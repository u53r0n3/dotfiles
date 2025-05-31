/* See LICENSE file for copyright and license details. */

/* appearance */
static const unsigned int borderpx  = 2;        /* border pixel of windows */
static const unsigned int snap      = 32;       /* snap pixel */
static const unsigned int systraypinning = 0;   /* 0: sloppy systray follows selected monitor, >0: pin systray to monitor X */
static const unsigned int systrayonleft = 0;   	/* 0: systray in the right corner, >0: systray on left of status text */
static const unsigned int systrayspacing = 2;   /* systray spacing */
static const int systraypinningfailfirst = 1;   /* 1: if pinning fails, display systray on the first monitor, False: display systray on the last monitor*/
static const int showsystray        = 1;     /* 0 means no systray */
static const unsigned int gappih    = 10;       /* horiz inner gap between windows */
static const unsigned int gappiv    = 10;       /* vert inner gap between windows */
static const unsigned int gappoh    = 10;       /* horiz outer gap between windows and screen edge */
static const unsigned int gappov    = 10;       /* vert outer gap between windows and screen edge */
static const int smartgaps          = 0;        /* 1 means no outer gap when there is only one window */
static const int showbar            = 1;        /* 0 means no bar */
static const int topbar             = 1;        /* 0 means bottom bar */
static const char *fonts[]          = { "Hack Nerd Font:size=11"};
static const char dmenufont[]       = "ttf-hack:size=12";
static const char col_gray1[]       = "#181c28"; /*     bon bleu       */
static const char col_gray2[]       = "#86d0ee"; /* #c81313 */
static const char col_gray3[]       = "#86d0ee"; /* avant ct #bbbbbb #fea63c */
static const char col_gray4[]       = "#181c28";
static const char col_cyan[]        = "#86d0ee"; /*  fond central ba9903 */
static const char col1[]            = "#dede36";
static const char col2[]            = "#0025ff";
static const char col3[]            = "#86d0ee";
static const char col4[]            = "#c81313";
static const char col5[]            = "#00ff45";
static const char col6[]            = "#b225fd";

enum { SchemeNorm, SchemeCol1, SchemeCol2, SchemeCol3, SchemeCol4,
       SchemeCol5, SchemeCol6, SchemeSel }; /* color schemes */

static const char *colors[][3]      = {
	/*               fg         bg         border   */
	[SchemeNorm]  = { col_gray3, col_gray1, col_gray2 },
	[SchemeCol1]  = { col1,      col_gray1, col_gray2 },
	[SchemeCol2]  = { col2,      col_gray1, col_gray2 },
	[SchemeCol3]  = { col3,      col_gray1, col_gray2 },
	[SchemeCol4]  = { col4,      col_gray1, col_gray2 },
	[SchemeCol5]  = { col5,      col_gray1, col_gray2 },
	[SchemeCol6]  = { col6,      col_gray1, col_gray2 },
	[SchemeSel]   = { col_gray4, col_cyan,  col_cyan  },


};

/* tagging */
static const char *tags[] = { "α", "β", "γ", "Δ", "ε", "Σ" };

static const Rule rules[] = {
	/* xprop(1):
	 *	WM_CLASS(STRING) = instance, class
	 *	WM_NAME(STRING) = title
	 */
	/* class      instance    title       tags mask     isfloating   monitor */
	        { "st",     NULL,       NULL,       0,            1,           -1 },

	{ "gimp",     NULL,       NULL,       0,            1,           -1 },
	{ "VirtualBox Manager",  NULL,       NULL,       0,            1,           -1 },
    { "Firefox",  NULL,       NULL,       1 << 8,       0,           -1 },
};

/* layout(s) */
static const float mfact     = 0.55; /* factor of master area size [0.05..0.95] */
static const int nmaster     = 1;    /* number of clients in master area */
static const int resizehints = 1;    /* 1 means respect size hints in tiled resizals */
static const int lockfullscreen = 0; /* 1 will force focus on the fullscreen window */

#include "horizgrid.c"
static const Layout layouts[] = {
	/* symbol     arrange function */
	{ " ﰪ ",      tile },    /* first entry is default */
	{ " ﱖ ",      NULL },    /* no layout function means floating behavior */
	{ " ﲼ ",      monocle },
	{ " ﰦ ",      col },
    { " ﲼ ",      horizgrid },

};

/* key definitions */
#define MODKEY Mod4Mask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* commands */
static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */
static const char *dmenucmd[] = { "dmenu_run", "-m", dmenumon, "-fn", dmenufont, "-nb", col_gray1, "-nf", col_gray3, "-sb", col_gray3, "-sf", col_gray4, NULL };
static const char *termcmd[]  = { "alacritty", NULL };
static const char *web[]  = { "firefox", NULL };
static const char *file[]  = { "pcmanfm", NULL };
static const char *amen[]  = { "dmenu_fff", NULL };
static const char scratchpadname[] = "scratchpad";
static const char *scratchpadcmd[] = { "st", "-t", scratchpadname, "-g", "120x34", NULL };

static Key keys[] = {
	/* modifier                     key        function        argument */
	{ MODKEY,                       XK_d,      spawn,          {.v = dmenucmd } },
	{ MODKEY,	                    XK_a,	   spawn,          {.v = amen } },
	{ MODKEY,                       XK_Return, spawn,          {.v = termcmd } },
	{ MODKEY,			            XK_w,	   spawn,          {.v = web } },
	{ MODKEY,				        XK_x,	   spawn,          {.v = file } },
	{ MODKEY,                       XK_z,  togglescratch,  {.v = scratchpadcmd } },
	{ MODKEY,                       XK_b,      togglebar,      {0} },
	{ MODKEY,                       XK_j,      focusstack,     {.i = +1 } },
	{ MODKEY,                       XK_k,      focusstack,     {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_j,      inplacerotate,  {.i = +1} },
	{ MODKEY|ShiftMask,             XK_k,      inplacerotate,  {.i = -1} },
	{ MODKEY|ShiftMask,             XK_h,      inplacerotate,  {.i = +2} },
	{ MODKEY|ShiftMask,             XK_l,      inplacerotate,  {.i = -2} },
	{ MODKEY,                       XK_i,      incnmaster,     {.i = +1 } },
	{ MODKEY,                       XK_u,      incnmaster,     {.i = -1 } },
	{ MODKEY,                       XK_h,      setmfact,       {.f = -0.05} },
	{ MODKEY,                       XK_l,      setmfact,       {.f = +0.05} },
	{ MODKEY|Mod1Mask,              XK_h,      incrgaps,       {.i = +1 } },
	{ MODKEY|Mod1Mask,              XK_l,      incrgaps,       {.i = -1 } },
	{ MODKEY|Mod1Mask|ShiftMask,    XK_h,      incrogaps,      {.i = +1 } },
	{ MODKEY|Mod1Mask|ShiftMask,    XK_l,      incrogaps,      {.i = -1 } },
	{ MODKEY|Mod1Mask|ControlMask,  XK_h,      incrigaps,      {.i = +1 } },
	{ MODKEY|Mod1Mask|ControlMask,  XK_l,      incrigaps,      {.i = -1 } },
	{ MODKEY,                       XK_c,      togglegaps,     {0} },
	{ MODKEY|Mod1Mask|ShiftMask,    0xe0,      defaultgaps,    {0} },
	{ MODKEY,                       XK_y,      incrihgaps,     {.i = +1 } },
	{ MODKEY,                       XK_o,      incrihgaps,     {.i = -1 } },
	{ MODKEY|ControlMask,           XK_y,      incrivgaps,     {.i = +1 } },
	{ MODKEY|ControlMask,           XK_o,      incrivgaps,     {.i = -1 } },
	{ MODKEY|Mod1Mask,              XK_y,      incrohgaps,     {.i = +1 } },
	{ MODKEY|Mod1Mask,              XK_o,      incrohgaps,     {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_y,      incrovgaps,     {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_o,      incrovgaps,     {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_Return, zoom,           {0} },
	{ MODKEY,                       XK_Tab,    view,           {0} },
	{ MODKEY|ShiftMask,             XK_q,      killclient,     {0} },
	{ MODKEY,                       XK_F1,      setlayout,      {.v = &layouts[0]} },
	{ MODKEY,                       XK_F4,      setlayout,      {.v = &layouts[4]} },
	{ MODKEY,                       XK_F2,      setlayout,      {.v = &layouts[1]} },
	{ MODKEY,                       XK_F3,      setlayout,      {.v = &layouts[3]} },
	{ MODKEY,                       XK_f,      fullscreen,     {0} },

	{ MODKEY,                       XK_space,  setlayout,      {0} },
	{ MODKEY|ShiftMask,             XK_space,  togglefloating, {0} },
	{ MODKEY,                       0xe0,      view,           {.ui = ~0 } },
	{ MODKEY|ShiftMask,             0xe0,      tag,            {.ui = ~0 } },
	{ MODKEY,                       XK_comma,  focusmon,       {.i = -1 } },
	{ MODKEY,                       XK_period, focusmon,       {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_comma,  tagmon,         {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_period, tagmon,         {.i = +1 } },
	{ MODKEY,                       XK_Left,   viewtoleft,     {0} },
	{ MODKEY,                       XK_Right,  viewtoright,    {0} },
	{ MODKEY|ShiftMask,             XK_Left,   tagtoleft,      {0} },
	{ MODKEY|ShiftMask,             XK_Right,  tagtoright,     {0} },

    TAGKEYS(                        0x26,                      0)
	TAGKEYS(                        0xe9,                      1)
	TAGKEYS(                        0x22,                      2)
	TAGKEYS(                        0x27,                      3)
	TAGKEYS(                        0x28,                      4)
	TAGKEYS(                        0x2d,                      5)
	TAGKEYS(                        0xe8,                      6)
	TAGKEYS(                        0x5f,                      7)
	TAGKEYS(                        0xe7,                      8)
	{ MODKEY|ShiftMask,             XK_e,      quit,           {0} },
};

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ ClkLtSymbol,          0,              Button1,        setlayout,      {0} },
	{ ClkLtSymbol,          0,              Button3,        setlayout,      {.v = &layouts[2]} },
	{ ClkWinTitle,          0,              Button2,        zoom,           {0} },
	{ ClkStatusText,        0,              Button1,        sigdwmblocks,   {.i = 1} },
	{ ClkStatusText,        0,              Button2,        sigdwmblocks,   {.i = 2} },
	{ ClkStatusText,        0,              Button3,        sigdwmblocks,   {.i = 3} },
	{ ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
	{ ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
	{ ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
	{ ClkTagBar,            0,              Button1,        view,           {0} },
	{ ClkTagBar,            0,              Button3,        toggleview,     {0} },
	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
};
