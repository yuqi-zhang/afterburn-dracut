#!/bin/bash
# -*- mode: shell-script; indent-tabs-mode: nil; sh-basic-offset: 4; -*-
# ex: ts=8 sw=4 sts=4 et filetype=sh

check() {
    return 0
}

depends() {
    echo systemd network
}

install() {
    inst_multiple afterburn

    inst_simple "$moddir/azure-hostname.service" \
        "$systemdutildir/system/azure-hostname.service"

    mkdir -p "$initdir/$systemdsystemunitdir/initrd.target.requires"

    ln -s "../azure-hostname.service" "$initdir/$systemdsystemunitdir/initrd.target.requires/azure-hostname.service"

    inst_simple "$moddir/test-metal.service" \
        "$systemdutildir/system/test-metal.service"

    ln -s "../test-metal.service" "$initdir/$systemdsystemunitdir/initrd.target.requires/test-metal.service"
}
