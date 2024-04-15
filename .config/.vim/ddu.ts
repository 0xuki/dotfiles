import { BaseConfig } from "https://deno.land/x/ddu_vim@v3.10.3/types.ts";
import type { Denops } from "https://deno.land/x/ddu_vim@v3.10.3/deps.ts";
import { o } from "https://deno.land/x/denops_std@v6.4.0/variable/option.ts";

export class Config extends BaseConfig {
  override async config({ denops }: { denops: Denops }): Promise<void> {
    const columns = await o.get(denops, "columns") as number;

    denops.call('ddu#custom#patch_global', {
      ui: 'ff',
      sources: [
        {
          name: 'file_rec',
          params: {
            ignoredDirectories: ['.git', 'node_modules', 'vendor', '.next']
          }
        }
      ],
      sourceOptions: {
        _: {
          matchers: ['matcher_substring'],
          columns: ['icon_filename'],
        },
      },
      filterParams: {
        matcher_fzf: {
          highlightMatched: 'Search',
        },
      },
      kindOptions: {
        file: {
          defaultAction: 'open',
        },
        buffer: {
          defaultAction: 'open',
        },
        memos: {
          defaultAction: 'open',
        }
      },
      uiParams: {
        ff: {
          startFilter: true,
          prompt: "> ",
          split: "horizontal",
          previewFloating: false,
          previewSplit: "vertical",
          previewFloatingBorder: "none",
          previewWidth: Math.floor(columns * 0.56),  
          previewHeight: Math.floor(columns * 0.12),
          autoAction: {
            name: "preview",
          },
        },
      },
    });

    // Filer specific settings
    denops.call('ddu#custom#patch_local', 'filer', {
      ui: "filer",
      sources: [{
        name: "file",
        params: {},
      }],
      sourceOptions: {
        _: {
          columns: ["icon_filename"],
        },
      },
      kindOptions: {
        file: {
          defaultAction: "open",
        },
      },
      uiParams: {
        filer: {
          // winWidth: 25,
          split: "vertical",
          // splitDirection: "topleft",
          winWidth: 25,
          //split: "floating", 
          splitDirection: "topleft",
          displayTree: true, 
          previewVertical: true, 
          previewWidth: 80, 
        }
      },
    });
  }
}

// import { BaseConfig } from "https://deno.land/x/ddu_vim@v3.10.3/types.ts";
// import type { Denops } from "https://deno.land/x/ddu_vim@v3.10.3/deps.ts";
// import { o } from "https://deno.land/x/denops_std@v6.4.0/variable/option.ts";
//
// type DduUiSize = {
//   winRow: number;
//   winCol: number;
//   winWidth: number;
//   winHeight: number;
//   previewFloating: boolean;
//   previewSplit: "vertical" | "horizontal";
//   previewRow: number;
//   previewCol: number;
//   previewHeight: number;
//   previewWidth: number;
// };
//
// async function uiSize(
//   denops: Denops,
//   splitRatio: number,
//   previewSplit: "horizontal" | "vertical",
// ): Promise<DduUiSize> {
//   const FRAME_SIZE = 2;
//   const columns = await o.get(denops, "columns") as number;
//   const lines = await o.get(denops, "lines") as number;
//
//   let winHeight: number, winWidth: number, previewRow: number, previewCol: number, previewHeight: number, previewWidth: number;
//
//   if (previewSplit === "horizontal") {
//     winHeight = Math.floor(lines / splitRatio);
//     winWidth = columns - FRAME_SIZE;
//     previewRow = winHeight + 1;
//     previewCol = 0;
//     previewHeight = lines - winHeight - FRAME_SIZE;
//     previewWidth = winWidth;
//   } else {
//     winHeight = lines - FRAME_SIZE;
//     winWidth = Math.floor(columns / splitRatio);
//     previewRow = 0;
//     previewCol = winWidth + 1;
//     previewHeight = winHeight;
//     previewWidth = columns - winWidth - FRAME_SIZE;
//   }
//
//   return {
//     winRow: 0,
//     winCol: 0,
//     winWidth,
//     winHeight,
//     previewFloating: true,
//     previewSplit,
//     previewRow,
//     previewCol,
//     previewHeight,
//     previewWidth,
//   };
// }
//
// export class Config extends BaseConfig {
//   override async config({ denops }: { denops: Denops }): Promise<void> {
//     const size = await uiSize(denops, 3, "vertical");
//
//     denops.call('ddu#custom#patch_global', {
//       ui: 'ff',
//       sources: [
//         {
//           name: 'file_rec',
//           params: {
//             ignoredDirectories: ['.git', 'node_modules', 'vendor', '.next']
//           }
//         }
//       ],
//       sourceOptions: {
//         _: {
//           matchers: ['matcher_substring'],
//           columns: ['icon_filename'],
//         },
//       },
//       filterParams: {
//         matcher_fzf: {
//           highlightMatched: 'Search',
//         },
//       },
//       kindOptions: {
//         file: {
//           defaultAction: 'open',
//         },
//         buffer: {
//           defaultAction: 'open',
//         },
//         memos: {
//           defaultAction: 'open',
//         }
//       },
//       uiParams: {
//         ff: {
//           startFilter: true,
//           prompt: "> ",
//           ...size
//         },
//       },
//     });
//   }
// }
