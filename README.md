         user deposits DAI
receives Fractionalized Vault shares              vault deposits DAI,
       .─────.                                      receives yvDAI
      ╱       ╲
     ;   O  O  :                                                                   Λ
     :         ;                                                                  ╱ ╲
      ╲  \__/ ╱                                                                  ╱   ╲
       ╲     ╱                       ┌─────────────────────┐                    ╱     ╲
        `─┬─'           ┌────┐       │                     │     DAI           ╱       ╲
          │             │DAI │       │                     │ ──────────────▶  ╱         ╲
          ▣▣▣▣▣▣▣▣▣▣▣▣▣▣└────┘       │                     │                 ╱   YEARN   ╲
          │                ────────▶ │ FractionalizedVault │                ╱    VAULT    ╲
          │                          │                     │               ▕               ▏
          │                          │                     │                ╲             ╱
          │     ◀────────────────────│                     │     yvDAI       ╲           ╱
       ┌──┴──    FractionalizedVault │                     │ ◀──────────────  ╲         ╱
       │     │         Shares        └─────────────────────┘                   ╲       ╱
       │     │                                                                  ╲     ╱
       │     │                                                                   ╲   ╱
       │     │                                                                    ╲ ╱
       │     │                                                                     V
       │     │
       ▼     ▼
