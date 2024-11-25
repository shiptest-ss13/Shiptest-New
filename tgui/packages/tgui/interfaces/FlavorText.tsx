import { marked } from 'marked';
import { resolveAsset } from '../assets';
import { useBackend } from '../backend';
import { Box, Section, Stack } from '../components';
import { Window } from '../layouts';
import { walkTokens } from './common/Markdown';

type FlavorTextContext = {
  characterName: string;
  portraitUrl: string;
  portraitSource: string;
  flavorText: string;
};

export const FlavorText = (props, context) => {
  const { data } = useBackend<FlavorTextContext>(context);

  marked.use({
    breaks: true,
    gfm: true,
    smartypants: true,
    walkTokens: walkTokens,
    // Once assets are fixed might need to change this for them
    baseUrl: 'thisshouldbreakhttp',
  });

  return (
    <Window title={data.characterName} width={400} height={200}>
      <Window.Content>
        <Stack fill vertical>
          {data.portraitUrl && (
            <Section title="Portrait">
              <Box className="FlavorText__Portrait">
                <img src={resolveAsset(data.portraitUrl)} />
              </Box>
              <Box italic textAlign="center">
                {data.portraitSource}
              </Box>
            </Section>
          )}
          <Section title="Flavor Text">
            <Box
              dangerouslySetInnerHTML={{
                __html: marked(data.flavorText),
              }}
            />
          </Section>
        </Stack>
      </Window.Content>
    </Window>
  );
};
