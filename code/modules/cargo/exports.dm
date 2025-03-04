#warn remove these
/*
// Simple holder datum to pass export results around
/datum/export_report
	var/list/exported_atoms = list()	//names of atoms sold/deleted by export
	var/list/total_amount = list()		//export instance => total count of sold objects of its type, only exists if any were sold
	var/list/total_value = list()		//export instance => total value of sold objects
	var/list/exported_atoms_ref = list()	//if they're not deleted they go in here for use.

// external_report works as "transaction" object, pass same one in if you're doing more than one export in single go
/proc/export_item_and_contents(atom/movable/AM, allowed_categories = EXPORT_CARGO, apply_elastic = TRUE, delete_unsold = TRUE, dry_run=FALSE, datum/export_report/external_report)
	if(!GLOB.exports_list.len)
		setupExports()

	var/profit_ratio = 1 //Percentage that gets sent to the seller, rest goes to cargo.

	var/list/contents = AM.GetAllContents()

	var/datum/export_report/report = external_report

	if(!report) //If we don't have any longer transaction going on
		report = new

	// We go backwards, so it'll be innermost objects sold first
	for(var/i in reverseRange(contents))
		var/atom/movable/thing = i
		var/sold = FALSE
		if(QDELETED(thing))
			continue

		for(var/datum/export/E in GLOB.exports_list)
			if(!E)
				continue
			if(E.applies_to(thing, allowed_categories, apply_elastic))
				sold = E.sell_object(thing, report, dry_run, allowed_categories , apply_elastic, profit_ratio)
				report.exported_atoms += " [thing.name]"
				if(!QDELETED(thing))
					report.exported_atoms_ref += thing
				break
		if(!dry_run && (sold || delete_unsold))
			if(ismob(thing))
				thing.investigate_log("deleted through cargo export",INVESTIGATE_CARGO)
	if(!dry_run)
		qdel(AM)

	return report
*/

#warn redocument
/datum/export
	var/unit_name = ""				// Unit name. Only used in "Received [total_amount] [name]s [message]." message
	var/desc = ""
	/// The base amount of money gained when selling a "unit" of this item, as determined by get_amount().
	/// The actual sale value may change if this export has elasticity, and is controlled by the variable true_cost.
	var/cost = 1
	/// The "actual" sale cost of the item, including the current value as altered by elasticity.
	var/true_cost

	/// The percentage of the item's value which is shaved off after each unit is sold, compounding multiplicatively. This recovers over time.
	/// If items are sold in bulk (i.e., 2 or 3 or 10 at a time), the total payout is the same as if they were sold individually, before rounding.
	/// Even without any items previously sold, the sale price may be slightly smaller than the "base" price, due to the math attempting to remain
	/// correct even when less than a whole unit is sold.
	/// If set to 0, the price is static.
	var/elasticity_coeff = 0
	/// The amount of time it takes for the sale price of the export to recover from a single unit sold.
	/// If set to 0, the price will never recover.
	var/recovery_ds = 10 MINUTES

	var/list/export_types = list()	// Type of the exported object. If none, the export datum is considered base type.
	var/include_subtypes = TRUE		// Set to FALSE to make the datum apply only to a strict type.
	var/list/exclude_types = list()	// Types excluded from export

#warn stop these from processing all the time just because they have elasticity -- should wait until something is sold
/datum/export/New()
	..()
	START_PROCESSING(SSprocessing, src)
	true_cost = cost

	export_types = typecacheof(export_types, FALSE, !include_subtypes)
	exclude_types = typecacheof(exclude_types)

/datum/export/Destroy()
	STOP_PROCESSING(SSprocessing, src)
	return ..()

/datum/export/process(wait)
	. = ..()
	if(!elasticity_coeff || !recovery_ds)
		return PROCESS_KILL
	true_cost *= (1 - elasticity_coeff)**(-1 * wait/(recovery_ds))
	if(true_cost > cost)
		true_cost = cost

// Checks the cost. 0 cost items are skipped in export.
/datum/export/proc/get_cost(obj/O, apply_elastic = TRUE)
	var/amount = get_amount(O)
	if(apply_elastic && elasticity_coeff != 0)
		// definite integral from (old amount sold) to (new amount sold) of the cost function.
		// this applies even when the amount being sold is one unit, decreasing it slightly,
		// so that selling even half a unit twice is no more effective than selling the whole unit, ignoring rounding.
		return round(
			(true_cost/log(1 - elasticity_coeff)) * ((1 - elasticity_coeff)**(amount) - 1),
			1
		)
	else
		return round(cost * amount, 1)

// Checks the amount of exportable in object. Credits in the bill, sheets in the stack, etc.
// Usually acts as a multiplier for a cost, so item that has 0 amount will be skipped in export.
/datum/export/proc/get_amount(obj/O)
	return 1

// Checks if the atom is fit for export datum.
/datum/export/proc/applies_to(obj/O, apply_elastic = TRUE)
	if(!is_type_in_typecache(O, export_types))
		return FALSE
	if(include_subtypes && is_type_in_typecache(O, exclude_types))
		return FALSE
	if(!get_cost(O, apply_elastic))
		return FALSE
	if(O.flags_1 & HOLOGRAM_1)
		return FALSE
	return TRUE

/datum/export/proc/sell_object(obj/O, dry_run = TRUE, apply_elastic = TRUE)
	///This is the value of the object, as derived from export datums.
	var/the_cost = get_cost(O, apply_elastic)
	///Quantity of the object in question.
	var/amount = get_amount(O)
	///Utilized in the pricetag component. Splits the object's profit when it has a pricetag by the specified amount.
	var/profit_ratio = 0

	if(amount <= 0 || the_cost <= 0)
		return null
	if(dry_run == FALSE)
		#warn remove this shit too
		if(SEND_SIGNAL(O, COMSIG_ITEM_SOLD, item_value = the_cost) & COMSIG_ITEM_SPLIT_VALUE)
			profit_ratio = SEND_SIGNAL(O, COMSIG_ITEM_SPLIT_PROFIT_DRY)
			the_cost = the_cost * ((100 - profit_ratio) * 0.01)
	else
		profit_ratio = SEND_SIGNAL(O, COMSIG_ITEM_SPLIT_PROFIT)
		the_cost = the_cost * ((100 - profit_ratio) * 0.01)

	if(!dry_run)
		if(apply_elastic)
			true_cost *= (1 - elasticity_coeff)**amount
		SSblackbox.record_feedback("nested tally", "export_sold_cost", 1, list("[O.type]", "[the_cost]"))
	return the_cost

GLOBAL_LIST_EMPTY(exports_list)
#warn this needs to be called
/proc/setupExports()
	for(var/subtype in subtypesof(/datum/export))
		var/datum/export/E = new subtype
		if(E.export_types && E.export_types.len) // Exports without a type are invalid/base types
			GLOB.exports_list += E
