import { BaseConfig } from "https://deno.land/x/ddc_vim@v4.3.1/types.ts";
import { ConfigArguments } from "https://deno.land/x/ddc_vim@v4.3.1/base/config.ts";

export class Config extends BaseConfig {
  override async config(args: ConfigArguments): Promise<void> {
    const globalPatch = {
      ui: "pum",
      sources: [
        "vim-lsp",
        "around",
        "vsnip",
        "file"
      ],
      sourceOptions: {
        _: {
          matchers: ["matcher_fuzzy"],
          sorters: ["sorter_fuzzy"],
          converters: ["converter_fuzzy"],
        },
        'vim-lsp': {
          matchers: ["matcher_head"],
          mark: "lsp",
        },
        around: {
          mark: "around",
        },
        path: {
          mark: "P",
        },
        file: {
          mark: "F",
          isVolatile: true,
          forceCompletionPattern: "\\S/\\S*",
        },
        vsnip: {
          mark: "vsnip",
        },
      },
      sourceParams: {
        path: {
          cmd: ["fd", "--max-depth", "5"],
        },
        file: {
          mode: "win32",
          forceCompletionPattern: "\\S\\\\\\S*",
        }
      }
    };

    args.contextBuilder.patchGlobal(globalPatch);

    args.contextBuilder.patchFiletype(['ps1', 'dosbatch', 'autohotkey', 'registry'], {
      sourceOptions: {
        file: {
          forceCompletionPattern: "\\S\\\\\\S*",
        }
      },
      sourceParams: {
        file: {
          mode: "win32",
        }
      }
    });

    return await Promise.resolve();
  }
}
