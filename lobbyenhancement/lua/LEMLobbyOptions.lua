GPGrestrictedUnits = {
    T1 = {
        categories = {"TECH1"},
        name = "<LOC restricted_units_data_0000>No Tech 1",
        tooltip = "restricted_uints_T1",
    },
    T2 = {
        categories = {"TECH2"},
        name = "<LOC restricted_units_data_0001>No Tech 2",
        tooltip = "restricted_uints_T2",
    },
    T3 = {
        categories = {"TECH3"},
        name = "<LOC restricted_units_data_0002>No Tech 3",
        tooltip = "restricted_uints_T3",
    },
    EXPERIMENTAL = {
        categories = {"EXPERIMENTAL"},
        name = "<LOC restricted_units_data_0003>No Experimental",
        tooltip = "restricted_uints_experimental",
    },
    NAVAL = {
        categories = {"NAVAL"},
        name = "<LOC restricted_units_data_0004>No Naval",
        tooltip = "restricted_uints_naval",
    },
    LAND = {
        categories = {"LAND"},
        name = "<LOC restricted_units_data_0005>No Land",
        tooltip = "restricted_uints_land",
    },
    AIR = {
        categories = {"AIR"},
        name = "<LOC restricted_units_data_0006>No Air",
        tooltip = "restricted_uints_air",
    },
    UEF = {
        categories = {"UEF"},
        name = "<LOC restricted_units_data_0007>No UEF",
        tooltip = "restricted_uints_uef",
    },
    CYBRAN = {
        categories = {"CYBRAN"},
        name = "<LOC restricted_units_data_0008>No Cybran",
        tooltip = "restricted_uints_cybran",
    },
    AEON = {
        categories = {"AEON"},
        name = "<LOC restricted_units_data_0009>No Aeon",
        tooltip = "restricted_uints_aeon",
    },
    SERAPHIM = {
        categories = {"SERAPHIM"},
        name = "<LOC restricted_units_data_0010>No Seraphim",
        tooltip = "restricted_uints_seraphim",
    },
    NUKE = {
        categories = {"uab2305", "ueb2305", "urb2305", "xsb2305", "xsb2401", "xss0302", "xsb4302", "ueb4302", "urb4302", "uab4302", "uas0304", "urs0304", "ues0304" },
        name = "<LOC restricted_units_data_0011>No Nukes",
        tooltip = "restricted_uints_nukes",
    },
    GAMEENDERS = {
        categories = {"uab2302", "urb2302", "ueb2302", "xsb2302", "xab1401", "xab2307", "url0401", "xeb2402", "ueb2401", "xsb2401"},
        name = "<LOC restricted_units_data_0012>No Game Enders",
        tooltip = "restricted_uints_gameenders",
    },
    BUBBLES = {
        categories = {"uel0307", "ual0307", "xsl0307", "deb4303", "xes0205", "ueb4202", "urb4202", "uab4202", "xsb4202", "ueb4301", "uab4301", "xsb4301", },
        name = "<LOC restricted_units_data_0013>No Bubbles",
        tooltip = "restricted_uints_bubbles",
    },
    INTEL = {
        categories = {"OMNI", "uab3101", "uab3201", "ueb3101", "ueb3201", "urb3101", "urb3201", "xsb3101", "xsb3201", "uab3102", "uab3202", "ueb3102", "ueb3202", "urb3102", "urb3202", "xsb3102", "xsb3202", "xab3301", "xrb3301", "ues0305", "uas0305", "urs0305", },
        name = "<LOC restricted_units_data_0014>No Intel Structures",
        tooltip = "restricted_uints_intel",
    },
    SUPCOM = {
        categories = {"SUBCOMMANDER", },
        name = "<LOC restricted_units_data_0015>No Support Commanders",
        tooltip = "restricted_uints_supcom",
    },
    PRODSC1 = {
        categories = {"PRODUCTSC1", },
        name = "<LOC restricted_units_data_0016>No Supreme Commander",
        tooltip = "restricted_units_supremecommander",
    },
    PRODFA = {
        categories = {"PRODUCTFA", },
        name = "<LOC restricted_units_data_0017>No Forged Alliance",
        tooltip = "restricted_units_forgedalliance",
    },
    PRODDL = {
        categories = {"PRODUCTDL", },
        name = "<LOC restricted_units_data_0018>No Downloaded",
        tooltip = "restricted_units_downloaded",
    },
    FABS = {
        categories = {"ueb1104", "ueb1303", "urb1104", "urb1303", "uab1104", "uab1303", "xsb1104", "xsb1303", },
        name = "<LOC restricted_units_data_0019>No Mass Fabrication",
        tooltip = "restricted_units_massfab",
    },
}

GPGsortOrder = {
    "GAMEENDERS",
    "NUKE",
    "PRODSC1",
    "PRODFA",
    "PRODDL",
    "UEF",
    "CYBRAN",
    "AEON",
    "SERAPHIM",
    "T1",
    "T2",
    "T3",
    "EXPERIMENTAL",
    "NAVAL",
    "LAND",
    "AIR",
    "BUBBLES",
    "INTEL",
    "SUPCOM",
    "FABS",
}

GPGOptions = {
    {
        default = 4,
        label = "<LOC lobui_0102>Unit Cap",
        help = "<LOC lobui_0103>Set the maximum number of units that can be in play",
        key = 'UnitCap',
        pref = 'Lobby_Gen_Cap',
        values = {
            {
                text = "75",
                help = "75 units per player may be in play",
                key = '75',
            },
            {
                text = "125",
                help = "125 units per player may be in play",
                key = '125',
            },
            {
                text = "<LOC lobui_0170>250",
                help = "<LOC lobui_0171>250 units per player may be in play",
                key = '250',
            },
            {
                text = "<LOC lobui_0172>500",
                help = "<LOC lobui_0173>500 units per player may be in play",
                key = '500',
            },
            {
                text = "<LOC lobui_0174>750",
                help = "<LOC lobui_0175>750 units per player may be in play",
                key = '750',
            },
            {
                text = "<LOC lobui_0235>1000",
                help = "<LOC lobui_0236>1000 units per player may be in play",
                key = '1000',
            },
            {
                text = "1500",
                help = "1500 units per player may be in play",
                key = '1500',
            },
            {
                text = "2000",
                help = "2000 units per player may be in play",
                key = '2000',
            },
        },
    },
    {
        default = 1,
        label = "<LOC lobui_0112>Fog of War",
        help = "<LOC lobui_0113>Set up how fog of war will be visualized",
        key = 'FogOfWar',
        pref = 'Lobby_Gen_Fog',
        values = {
            {
                text = "<LOC lobui_0114>Explored",
                help = "<LOC lobui_0115>Terrain revealed, but units still need recon data",
                key = 'explored',
            },
            {
                text = "<LOC lobui_0118>None",
                help = "<LOC lobui_0119>All terrain and units visible",
                key = 'none',
            },
        },
    },
    {
        default = 1,
        label = "<LOC lobui_0120>Victory Condition",
        help = "<LOC lobui_0121>Determines how a victory can be achieved",
        key = 'Victory',
        pref = 'Lobby_Gen_Victory',
        values = {
            {
                text = "<LOC lobui_0122>Assassination",
                help = "<LOC lobui_0123>Game ends when commander is destroyed",
                key = 'demoralization',
            },
            {
                text = "<LOC lobui_0124>Supremacy",
                help = "<LOC lobui_0125>Game ends when all structures, commanders and engineers are destroyed",
                key = 'domination',
            },
            {
                text = "<LOC lobui_0126>Annihilation",
                help = "<LOC lobui_0127>Game ends when all units are destroyed",
                key = 'eradication',
            },
            {
                text = "<LOC lobui_0128>Sandbox",
                help = "<LOC lobui_0129>Game never ends",
                key = 'sandbox',
            },
        },
    },
    {
        default = 2,
        label = "<LOC lobui_0242>Timeouts",
        help = "<LOC lobui_0243>Sets the number of timeouts each player can request",
        key = 'Timeouts',
        pref = 'Lobby_Gen_Timeouts',
        mponly = true,
        values = {
            {
                text = "<LOC lobui_0244>None",
                help = "<LOC lobui_0245>No timeouts are allowed",
                key = '0',
            },
            {
                text = "<LOC lobui_0246>Three",
                help = "<LOC lobui_0247>Each player has three timeouts",
                key = '3',
            },
            {
                text = "<LOC lobui_0248>Infinite",
                help = "<LOC lobui_0249>There is no limit on timeouts",
                key = '-1',
            },
        },
    },
    {
        default = 1,
        label = "<LOC lobui_0258>Game Speed",
        help = "<LOC lobui_0259>Set the game speed",
        key = 'GameSpeed',
        pref = 'Lobby_Gen_GameSpeed',
        values = {
            {
                text = "<LOC lobui_0260>Normal",
                help = "<LOC lobui_0261>Fixed at the normal game speed (+0)",
                key = 'normal',
            },
            {
                text = "<LOC lobui_0262>Fast",
                help = "<LOC lobui_0263>Fixed at a fast game speed (+4)",
                key = 'fast',
            },
            {
                text = "<LOC lobui_0264>Adjustable",
                help = "<LOC lobui_0265>Adjustable in-game",
                key = 'adjustable',
            },
        },
    },
    {
        default = 1,
        label = "<LOC lobui_0208>Cheating",
        help = "<LOC lobui_0209>Enable cheat codes",
        key = 'CheatsEnabled',
        pref = 'Lobby_Gen_CheatsEnabled',
        values = {
            {
                text = "<LOC _Off>Off",
                help = "<LOC lobui_0210>Cheats disabled",
                key = 'false',
            },
            {
                text = "<LOC _On>On",
                help = "<LOC lobui_0211>Cheats enabled",
                key = 'true',
            },
        },
    },
    {
        default = 1,
        label = "<LOC lobui_0291>Civilians",
        help = "<LOC lobui_0292>Set how civilian units are used",
        key = 'CivilianAlliance',
        pref = 'Lobby_Gen_Civilians',
        values = {
            {
                text = "<LOC lobui_0293>Enemy",
                help = "<LOC lobui_0294>Civilians are enemies of players",
                key = 'enemy',
            },
            {
                text = "<LOC lobui_0295>Neutral",
                help = "<LOC lobui_0296>Civilians are neutral to players",
                key = 'neutral',
            },
            {
                text = "<LOC lobui_0297>None",
                help = "<LOC lobui_0298>No Civilians on the battlefield",
                key = 'removed',
            },
        },
    },
    {
        default = 1,
        label = "<LOC lobui_0310>Prebuilt Units",
        help = "<LOC lobui_0311>Set whether the game starts with prebuilt units or not",
        key = 'PrebuiltUnits',
        pref = 'Lobby_Prebuilt_Units',
        values = {
            {
                text = "<LOC lobui_0312>Off",
                help = "<LOC lobui_0313>No prebuilt units",
                key = 'Off',
            },
            {
                text = "<LOC lobui_0314>On",
                help = "<LOC lobui_0315>Prebuilt units set",
                key = 'On',
            },
        },
    },
    {
        default = 1,
        label = "<LOC lobui_0316>No Rush Option",
        help = "<LOC lobui_0317>Enforce No Rush rules for a certain period of time",
        key = 'NoRushOption',
        pref = 'Lobby_NoRushOption',
        values = {
            {
                text = "<LOC lobui_0318>Off",
                help = "<LOC lobui_0319>Rules not enforced",
                key = 'Off',
            },
            {
                text = "<LOC lobui_0320>5",
                help = "<LOC lobui_0321>Rules enforced for 5 mins",
                key = '5',
            },
            {
                text = "<LOC lobui_0322>10",
                help = "<LOC lobui_0323>Rules enforced for 10 mins",
                key = '10',
            },
            {
                text = "<LOC lobui_0324>20",
                help = "<LOC lobui_0325>Rules enforced for 20 mins",
                key = '20',
            },
        },
    },
}

versionstrings = {
	us = 'Version :',
	es = 'Versi\195\179n :',
	fr = 'Version :',
	it = 'Versione :',
	gr = 'Version :',
}