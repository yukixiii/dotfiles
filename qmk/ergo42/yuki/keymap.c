#include QMK_KEYBOARD_H
#include "keymap_jp.h"

extern keymap_config_t keymap_config;

#define BASE 0
#define META 1
#define SYMB 2
#define MOVE 3
#define FKEY 4

// Fillers to make layering more clear
#define _______ KC_TRNS
#define XXXXXXX KC_NO

const uint16_t PROGMEM keymaps[][MATRIX_ROWS][MATRIX_COLS] = {

  /* BASE
   * ,------------------------------------------------.   ,------------------------------------------------.
   * | Tab  |   Q  |   W  |   E  |   R  |  T   |  Y   |   |  T   |   Y  |   U  |   I  |   O  |   P  | Bksp |
   * |------+------+------+------+------+------+------|   |--------------------+------+------+------+------|
   * | LCtrl|   A  |   S  |   D  |   F  |  G   |  H   |   |  G   |   H  |   J  |   K  |   L  |   ;  |   :  |
   * |------+------+------+------+------+------+------|   |------|------|------+------+------+------+------|
   * | LSft |   Z  |   X  |   C  |   V  |  B   |  N   |   |  B   |   N  |   M  |   ,  |   .  |   /  |   \  |
   * |------+------+------+------+------+------+------|   |------+------+------+------+------+------+------|
   * | FKEY | LALT | LGUI | SYMB | META | ESC  |Space |   |Space | ZKHK | Enter| MOVE |      |      |  Del |
   * `------------------------------------------------'   `------------------------------------------------'
   */
  [BASE] = LAYOUT( \
    KC_TAB,   KC_Q,    KC_W,    KC_E,     KC_R,     KC_T,   KC_Y,   KC_T,   KC_Y,              KC_U,              KC_I,     KC_O,    KC_P,    KC_BSPC, \
    KC_LCTL,  KC_A,    KC_S,    KC_D,     KC_F,     KC_G,   KC_H,   KC_G,   KC_H,              KC_J,              KC_K,     KC_L,    JP_SCLN, JP_COLN, \
    KC_LSFT,  KC_Z,    KC_X,    KC_C,     KC_V,     KC_B,   KC_N,   KC_B,   KC_N,              KC_M,              JP_COMM,  JP_DOT,  JP_SLSH, JP_BSLS, \
    MO(FKEY), KC_LALT, KC_LGUI, KC_LGUI,  MO(META), KC_ESC, KC_SPC, KC_SPC, LT(SYMB, JP_ZHTG), LT(MOVE, KC_ENT),  MO(MOVE), XXXXXXX, XXXXXXX, KC_DEL \
  ),

  /* META
   * ,------------------------------------------------.   ,------------------------------------------------.
   * | Tab  |   1  |   2  |   3  |   4  |   5  |   6  |   |   5  |   6  |   7  |   8  |   9  |   0  |      |
   * |------+------+------+------+------+------+------|   |-------------+------+------+------+------+------|
   * | LCtrl|GUI(1)|GUI(2)|GUI(3)|GUI(4)|GUI(5)|GUI(6)|   |GUI(5)|GUI(6)|GUI(7)|GUI(8)|GUI(9)|GUI(0)|      |
   * |------+------+------+------+------+------+------|   |-------------+------+------+------+------+------|
   * | LSft |ALT(1)|ALT(2)|ALT(3)|ALT(4)|ALT(5)|ALT(6)|   |ALT(5)|ALT(6)|ALT(7)|ALT(8)|ALT(9)|ALT(0)|      |
   * |------+------+------+------+------+------+------|   |-------------+------+------+------+------+------|
   * | FKEY | LGUI | LALT | SYMB | META | ESC  |Space |   |Space | ZKHK | Enter| MOVE |      |      |      |
   * `------------------------------------------------'   `------------------------------------------------'
   */
  [META] = LAYOUT( \
    _______, KC_1,       KC_2,       KC_3,       KC_4,       KC_5,       KC_6,       KC_5,       KC_6,       KC_7,       KC_8,       KC_9,       KC_0,       _______,  \
    _______, LGUI(KC_1), LGUI(KC_2), LGUI(KC_3), LGUI(KC_4), LGUI(KC_5), LGUI(KC_6), LGUI(KC_5), LGUI(KC_6), LGUI(KC_7), LGUI(KC_8), LGUI(KC_9), LGUI(KC_0), XXXXXXX, \
    _______, LALT(KC_1), LALT(KC_2), LALT(KC_3), LALT(KC_4), LALT(KC_5), LALT(KC_6), LALT(KC_5), LALT(KC_6), LALT(KC_7), LALT(KC_8), LALT(KC_9), LALT(KC_0), XXXXXXX, \
    _______, _______,    _______,    _______,    _______,    _______,    _______,    _______,    _______,    _______,    _______,    XXXXXXX,    XXXXXXX,    XXXXXXX \
  ),

  /* SYMB
   * ,------------------------------------------------.   ,------------------------------------------------.
   * | Tab  |   !  |   "  |   #  |   $  |   %  |      |   |      |   &  |   '  |   -  |   ~  |   @  |   `  |
   * |------+------+------+------+------+------+------|   |-------------+------+------+------+------+------|
   * | LCtrl|      |      |      |   [  |   {  |  (   |   |  )   |   }  |   ]  |   =  |   |  |   +  |   *  |
   * |------+------+------+------+------+------+------|   |------|------+------+------+------+------+------|
   * | LSft |      |      |      |      |      |      |   |      |      |   ^  |   <  |   >  |   ?  |   _  |
   * |------+------+------+------+------+------+------|   |------+------+------+------+------+------+------|
   * | FKEY | LGUI | LALT | SYMB | META | ESC  |Space |   |Space | ZKHK | Enter| MOVE |      |      |      |
   * `------------------------------------------------'   `------------------------------------------------'
   */
  [SYMB] = LAYOUT( \
    _______, JP_EXLM, JP_DQT,  JP_HASH, JP_DLR,  JP_PERC, XXXXXXX, XXXXXXX, JP_AMPR, JP_QUOT, JP_MINS, JP_TILD, JP_AT,   JP_GRV,  \
    _______, XXXXXXX, XXXXXXX, XXXXXXX, JP_LBRC, JP_LCBR, JP_LPRN, JP_RPRN, JP_RCBR, JP_RBRC, JP_EQL,  JP_PIPE, JP_PLUS, JP_ASTR, \
    _______, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, JP_CIRC, JP_LT,   JP_GT,   JP_QUES, JP_UNDS, \
    _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______ \
  ),
  /*
   * [SYMB] = LAYOUT( \
   *   _______, KC_EXLM, KC_AT,   KC_HASH, KC_DLR,  KC_PERC, XXXXXXX, XXXXXXX, KC_CIRC, KC_QUOTE, KC_MINS, KC_PLUS, KC_LBRC, KC_LCBR,  \
   *   _______, XXXXXXX, XXXXXXX, XXXXXXX, KC_LCBR, KC_LBRC, KC_LPRN, KC_RPRN, KC_RBRC, KC_RCBR,  KC_UNDS, KC_PIPE, KC_COLN, KC_DQT, \
   *   _______, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX,  XXXXXXX, XXXXXXX, XXXXXXX, KC_CIRC, \
   *   _______, _______, _______, _______, _______, _______, _______, _______, _______, _______,  _______, _______, _______, _______ \
   * ),
   * [SYMB] = LAYOUT( \
   *   _______, KC_EXLM, KC_DQT,  KC_HASH, KC_DLR,  KC_PERC, XXXXXXX, XXXXXXX, KC_AMPR, KC_QUOTE, KC_MINS, KC_EQL,  KC_AT,   KC_GRV,  \
   *   _______, XXXXXXX, XXXXXXX, XXXXXXX, KC_LCBR, KC_LBRC, KC_LPRN, KC_RPRN, KC_RBRC, KC_RCBR,  XXXXXXX, KC_PIPE, KC_PLUS, KC_ASTR, \
   *   _______, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX,  XXXXXXX, XXXXXXX, XXXXXXX, KC_CIRC, \
   *   _______, _______, _______, _______, _______, _______, _______, _______, _______, _______,  _______, _______, _______, _______ \
   * ),
   */

  /* MOVE
   * ,------------------------------------------------.   ,------------------------------------------------.
   * | Tab  |      |SCPgD |SCPgU |      |      |      |   |      |      |      |      |      |      |      |
   * |------+------+------+------+------+------+------|   |------+-------------+------+------+------+------|
   * | LCtrl|      | CPgD | CPgU |      |      |      |   |      | Left | Down |  Up  |Right |      | PgUp |
   * |------+------+------+------+------+------+------|   |------+------+------|------+------+------+------|
   * | LSft |      |      |      |      |      |      |   |      |      | Home |  End | PgUp | PgDn | PgDn |
   * |------+------+------+------+------+------+------|   |------+------+------+------+------+------+------|
   * | FKEY | LGUI | LALT | SYMB | META | ESC  |Space |   |Space | ZKHK | Enter| MOVE |      |      |      |
   * `------------------------------------------------'   `------------------------------------------------'
   */
  [MOVE] = LAYOUT( \
    _______, XXXXXXX, LCTL(S(KC_PGUP)), LCTL(S(KC_PGDOWN)), XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, LALT(KC_LEFT), LALT(KC_RIGHT), XXXXXXX, XXXXXXX, XXXXXXX,   \
    _______, XXXXXXX, LCTL(KC_PGUP),    LCTL(KC_PGDOWN),    XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, KC_LEFT, KC_DOWN,       KC_UP,          KC_RGHT, XXXXXXX, KC_PGUP,   \
    _______, XXXXXXX, XXXXXXX,          XXXXXXX,            XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, KC_HOME,       KC_END,         XXXXXXX, XXXXXXX, KC_PGDOWN, \
    _______, _______, _______,          _______,            _______, _______, _______, _______, _______, _______,       _______,        XXXXXXX, XXXXXXX, XXXXXXX \
  ),

  /* FKEY
   * ,------------------------------------------------.   ,------------------------------------------------.
   * | Tab  |  F1  |  F2  |  F3  |  F4  |  F5  |  F6  |   |  F5  |  F6  |  F7  |  F8  |  F9  | F10  | F11  |
   * |------+------+------+------+------+------+------|   |-------------+------+------+------+------+------|
   * | LCtrl|      |      |      |      |      |      |   |      |      |      |      |      |      | F12  |
   * |------+------+------+------+------+------+------|   |------|------+------+------+------+------+------|
   * | LSft |      |      |      |      |      |      |   |      |      |      |      |      |      |      |
   * |------+------+------+------+------+------+------|   |------+------+------+------+------+------+------|
   * | FKEY | LGUI | LALT | SYMB | META | ESC  |Space |   |Space | ZKHK | Enter| MOVE |      |      |      |
   * `------------------------------------------------'   `------------------------------------------------'
   */
  [FKEY] = LAYOUT( \
    _______, KC_F1,   KC_F2,   KC_F3,   KC_F4,   KC_F5,   KC_F6,      KC_F5,      KC_F6,   KC_F7,   KC_F8,   KC_F9,   KC_F10,  KC_F11, \
    _______, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX,    XXXXXXX,    XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, KC_F12, \
    _______, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX,    XXXXXXX,    XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, \
    _______, _______, _______, _______, _______, _______, _______,    _______,    _______, _______, _______, XXXXXXX, XXXXXXX, XXXXXXX \
  )

};

