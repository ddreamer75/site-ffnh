features {
  'autoupdater',
  'mesh-batman-adv-15',
  'mesh-vpn-fastd-l2tp',
--  'client-bridge',
  'ebtables-filter-multicast',
  'ebtables-filter-ra-dhcp',
  'ebtables-source-filter',
  'ebtables-limit-arp',
  'radvd',
  'radv-filterd',
  'respondd',
  'status-page',
  'web-admin',
  'web-wizard',
  'web-advanced',
  'web-private-wifi',
  'config-mode-geo-location-osm',
  'config-mode-domain-select',
}

packages {
    'iwinfo',
    'gluon-autorestart',
    'respondd-module-airtime',
    'tecff-general-workaround',
    'tecff-broken-wlan-workaround',
    'ffac-ssid-changer',
}

include_usb = false

tiny_like = device({
    'tp-link-archer-c6-v2-eu-ru-jp',
    'tp-link-archer-c60-v1',
    'tp-link-td-w8970',
    'tp-link-td-w8980',
})

if not device_class('tiny') and not tiny_like then
    features {
        'tls',
--	'wireless-encryption-wpa3',
    }
    packages {
--      'ffac-autoupdater-wifi-fallback',
        'ffmuc-custom-banner',
        'ff-web-ap-timer',
	'htop',
	'ffda-gluon-usteer',
    }
    -- usb is only default available for non-tiny devices
    -- disabled usb per default, only active for special devices
    -- include_usb = true
end

if device({
        'zte-mf281',
        'glinet-gl-xe300',
        'glinet-gl-ap1300',
        'zte-mf289f',
        'zte-mf286r',
        'wavlink-ws-wn572hp3-4g',
        'tp-link-tl-mr6400-v5',
    }) then
    features {
        'web-cellular',
    }
    packages {
        'ffac-web-private-wan-dhcp',
    }
end

pkgs_usb = {
    'usbutils',
}

pkgs_hid = {
    'kmod-usb-hid',
    'kmod-hid-generic',
}

pkgs_usb_serial = {
    'kmod-usb-serial',
    'kmod-usb-serial-ftdi',
    'kmod-usb-serial-pl2303',
}

pkgs_usb_storage = {
    'block-mount',
    'blkid',
    'kmod-fs-ext4',
    'kmod-fs-ntfs',
    'kmod-fs-vfat',
    'kmod-usb-storage',
    'kmod-usb-storage-extras',-- Card Readers
    'kmod-usb-storage-uas', -- USB Attached SCSI (UAS/UASP)
    'kmod-nls-base',
    'kmod-nls-cp1250',      -- NLS Codepage 1250 (Eastern Europe)
    'kmod-nls-cp437',       -- NLS Codepage 437 (United States, Canada)
    'kmod-nls-cp850',       -- NLS Codepage 850 (Europe)
    'kmod-nls-cp852',       -- NLS Codepage 852 (Europe)
    'kmod-nls-iso8859-1',   -- NLS ISO 8859-1 (Latin 1)
    'kmod-nls-iso8859-13',  -- NLS ISO 8859-13 (Latin 7; Baltic)
    'kmod-nls-iso8859-15',  -- NLS ISO 8859-15 (Latin 9)
    'kmod-nls-iso8859-2',   -- NLS ISO 8859-2 (Latin 2)
    'kmod-nls-utf8',        -- NLS UTF-8
}

pkgs_usb_net = {
    'kmod-mii',
    'kmod-usb-net',
    'kmod-usb-net-asix',
    'kmod-usb-net-asix-ax88179',
    'kmod-usb-net-cdc-eem',
    'kmod-usb-net-cdc-ether',
    'kmod-usb-net-cdc-subset',
    'kmod-usb-net-dm9601-ether',
    'kmod-usb-net-hso',
    'kmod-usb-net-ipheth',
    'kmod-usb-net-mcs7830',
    'kmod-usb-net-pegasus',
    'kmod-usb-net-rndis',
    'kmod-usb-net-rtl8152',
    'kmod-usb-net-smsc95xx',
}

pkgs_not_needet = {
	'-ffda-gluon-usteer',
	'-respondd-module-airtime',
	'-ff-web-ap-timer',
	'-ff-ap-timer',
	'-ffac-ssid-changer',
	'-iwinfo',
	'-hostapd-common',
	'-hostapd-mini',
	'-tecff-general-workaround',
	'-tecff-broken-wlan-workaround',	
	}

pkgs_pci = {
    'pciutils',
    'kmod-bnx2', -- Broadcom NetExtreme BCM5706/5708/5709/5716
}

-- rtl838x has no USB support as of Gluon v2023.2
if target('realtek', 'rtl838x') or target('ramips', 'mt7620') then
    include_usb = false
end

-- 7M usable firmware space + USB port
if target('ath79', 'generic') and not device({
    'devolo-wifi-pro-1750e',
    'gl.inet-gl-ar150',
    'gl.inet-gl-ar300m-lite',
    'gl.inet-gl-ar750',
    'joy-it-jt-or750i',
    'netgear-wndr3700-v2',
    'tp-link-archer-a7-v5',
    'tp-link-archer-c5-v1',
    'tp-link-archer-c7-v2',
    'tp-link-archer-c7-v5',
    'tp-link-archer-c59-v1',
    'tp-link-tl-wr842n-v3',
    'tp-link-tl-wr1043nd-v4',
    'tp-link-tl-wr1043n-v5',
}) then
    include_usb = false
end

if target('ramips', 'mt76x8') and not device({
    'gl-mt300n-v2',
    'gl.inet-microuter-n300',
    'netgear-r6120',
    'ravpower-rp-wd009',
}) then
    include_usb = false
end

-- 7M usable firmware space + USB port
if device({
    'avm-fritz-box-7412',
    'tp-link-td-w8970',
    'tp-link-td-w8980',
    'gl-mt300n-v2',
    'gl.inet-microuter-n300',
    'netgear-r6120',
    'ravpower-rp-wd009'
}) then
    include_usb = false
end

-- devices without usb ports
if device({
    'ubiquiti-unifi-6-lr-v1',
    'netgear-ex6150',
    'netgear-ex3700',
    'ubiquiti-edgerouter-x',
    'ubiquiti-edgerouter-x-sfp',
    'zyxel-nwa55axe',
    'xiaomi-mi-router-4a-gigabit-edition-v2',
    'xiaomi-mi-router-4a-gigabit-edition',
    'cudy-x6-v1',
    'cudy-x6-v2',
    'd-link-dap-x1860-a1',
    'ubiquiti-unifi-6-lite',
    'cudy-wr3000-v1',
    'ubiquiti-unifi-6-plus',
}) then
    include_usb = false
end

if include_usb then
    packages(pkgs_usb)
    packages(pkgs_usb_net)
    packages(pkgs_usb_serial)
    packages(pkgs_usb_storage)
    packages {'ffka-gluon-web-usb-wan-hotplug', 'ffac-update-location-gps'}
end

-- device has no reset button and requires a special package to go into setup mode
-- https://github.com/freifunk-gluon/community-packages/tree/master/ffda-network-setup-mode

-- if target('ramips', 'mt7621') or target('mediatek', 'filogic') then
	-- reload wifi firmware twice a day
--	packages {
--		'ffac-mt7915-hotfix',
--	}
-- end

if device({
    'zyxel-nwa55axe',
}) then
    packages {'ffda-network-setup-mode'}
    broken(false)
end

if target('x86', '64') then
    include_usb = true
    -- add guest agent for qemu and vmware & remove not needet packages and features
    packages ({
        'qemu-ga',
        'open-vm-tools',
    })
    packages(pkgs_not_needet)
    features({
                '-web-cellular',
                '-wireless-encryption-wpa3',
                '-web-private-wifi',
                '-web-wifi-config'
                })
end

if device({'ubiquiti-edgerouter-x-sfp'}) or device({'ubiquiti-edgerouter-x'}) then
	packages(pkgs_not_needet)

    features({
		'-web-cellular',
		'-wireless-encryption-wpa3',
		'-web-private-wifi',
		'-web-wifi-config'
		})
end

if target('x86') and not target('x86', 'legacy') then
    include_usb = true
    packages(pkgs_pci)
    packages(pkgs_hid)
end

if target('bcm27xx') then
    packages(pkgs_hid)
end
