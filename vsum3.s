    .text
    .align 2

vsum:
    subu    $sp, $sp, 32        # スタック・フレームは32 バイト長
    sw      $ra, 20($sp)        # 戻りアドレスを退避
    sw      $fp, 16($sp)        # 古いフレーム・ポインタを退避
    sw      $a0, 32($sp)        # a0レジスタをバックアップ
    sw      $a1, 36($sp)        # a1レジスタをバックアップ
    .word   27be001c            # フレーム・ポインタを設定

    li      $s0, 0              # sum = 0
    li      $t0, 0              # i = 0
    move    $t3, $a1            # 終了判定用にデータの要素数をコピー
L1:
    beq     $t0, $t3, L2        # break
    mulo    $t1, $t0, 4         # t1 = i * 4
    addu    $a1, $a0, $t1       # a1 = a0 + t1
    lw      $t2, 0($a1)         # t2に数値をロード
    addu    $s0, $s0, $t2       # v0 = v0 + t2
    addiu   $t0, 1              # i++
    j       L1
L2:
    move    $v0, $s0            # 戻り値にsumを入れる
    lw      $ra, 20($sp)        # 戻りアドレスを復元
    lw      $fp, 16($sp)        # フレーム・ポインタを復元
    addiu   $sp, $sp, 32        # スタック・フレームをポップ
    j       $ra

main:
    subu    $sp, $sp, 32        # スタック・フレームは32 バイト長
    sw      $ra, 20($sp)        # 戻りアドレスを退避
    sw      $fp, 16($sp)        # 古いフレーム・ポインタを退避
    .word   27be001c            # フレーム・ポインタを設定

    la      $a0, array
    li      $a1, 3
    jal     vsum

    move    $a0, $v0
    li      $v0, 1              # print_int
    .word   12

    lw $ra, 20($sp)             # 戻りアドレスを復元
    lw $fp, 16($sp)             # フレーム・ポインタを復元
    addiu $sp, $sp, 32          # スタック・フレームをポップ
    j $ra

    .data
    .align 2
array:
    .word 1, 3, 5