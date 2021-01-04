function extractDependantPaths(
  modulePath: string,
  moduleContent: string,
): string[] {
  const importLines = extractImports(moduleContent);
  return importLines;
}

function extractImports(content: string): string[] {
  return content.split("\n")
    .flatMap((line) => line.startsWith("import") ? [line] : [])
    // .map((line) => line.split(" ").slice(1, 2))[0];
    .map((line) => line.split(" ").slice(1, 2)[0]);
}

console.log(
  extractDependantPaths(
    "./sfds.elm",
    `
module MainB exposing (main)

import Browser
import MainA exposing (thisIsUsedByB)


main =
    Browser.sandbox
        { init = ()
        , update = \\_ _ -> ()
        , view = always thisIsUsedByB
        }

    `,
  ),
);
