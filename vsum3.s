    .text
    .align 2

vsum:
    .word   0x27bdffe0          # スタック・フレームは32 バイト長
    .word   0xafbf0014          # 戻りアドレスを退避
    .word   0xafbe0010          # 古いフレーム・ポインタを退避
    .word   0xafa40020          # a0レジスタをバックアップ
    .word   0xafa50024          # a1レジスタをバックアップ
    .word   0x27be001c          # フレーム・ポインタを設定

    .word   0x34100000          # sum = 0
    .word   0x34080000          # i = 0
    .word   0x00055821          # 終了判定用にデータの要素数をコピー
L1:
    .word   0x110b000f          # break
    .word   0x34010004          # t1 = i * 4
    .word   0x01010018
    .word   0x00000810
    .word   0x00004812
    .word   0x00094fc3
    .word   0x10290003
    .word   0x00000000
    .word   0x0000000d
    .word   0x00004812
    .word   0x00892821          # a1 = a0 + t1
    .word   0x8caa0000          # t2に数値をロード
    .word   0x020a8021          # v0 = v0 + t2
    .word   0x25080001          # i++
    .word   0x08100012
L2:
    .word   0x00101021          # 戻り値にsumを入れる
    .word   0x8fbf0014          # 戻りアドレスを復元
    .word   0x8fbe0010          # フレーム・ポインタを復元
    .word   0x27bd0020          # スタック・フレームをポップ
    .word   0x03e00008

main:
    .word   0x27bdffe0          # スタック・フレームは32 バイト長
    .word   0xafbf0014          # 戻りアドレスを退避
    .word   0xafbe0010          # 古いフレーム・ポインタを退避
    .word   0x27be001c          # フレーム・ポインタを設定

    .word   0x3c011001
    .word   0x34240000
    .word   0x34050003
    .word   0x0c100009

    .word   0x00022021
    .word   0x34020001          # print_int
    .word   0x0000000c

    .word   0x8fbf0014          # 戻りアドレスを復元
    .word   0x8fbe0010          # フレーム・ポインタを復元
    .word   0x27bd0020          # スタック・フレームをポップ
    .word   0x03e00008

    .data
    .align 2
array:
    .word 1, 3, 5