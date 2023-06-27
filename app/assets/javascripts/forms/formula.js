// http://www.developpez.net/forums/d940195-2/webmasters-developpement-web/general-conception-web/contribuez/eval-calcul-risque/
export default class Formula {

  constructor(){
    this.res = ""

    this.t = {
      x: "*",
      X: "*",
      ":": "/"
    };

    this.rg = {
      "/[^\\+\\*\\/\\-\\(\\)\\s\\d\\.]/": "It is not a number",
      "/[\\+\\*\\/\\-\\(]\\)/": "Parenthesis ending with a incorrect expression.",
      "/([\\+\\x\\*\\/\\-]{2,})|([\\+\\x\\*\\/\\-]\\s[\\+\\x\\*\\/\\-])/i": "Multiple Operators in a row.",
      "/(\\D\\.)|(\\.[\\D\\s]+)|(\\.\\d+\\.)/": "Wrong Decimal.",
      "/\\d\\s+\\d/": "Cut Integer.",
      "/\\([\\/\\*]/": "First operator within parenthesis is wrong.",
      "/^[\\*\\/]+/": "First operator within string is wrong"
    };

    this.rg2 = {
      "/\\s+/g": " ",
      "/([^\\.\\,\\;\\d]|^)0+([\\,\\.\\;\\d])/g": "$10$2",
      "/[,;]/g": ".",
      "/([^\\d\\.\\,\\;])0+(\\d)/g": "$1$2",
      "/^(0)(\\d)/g": "$2",
      "/[\\[\\]\\|\\&\\=\\!]/g": "",
      "/([\\d\\)])(\\()/g": "$1*$2",
      "/(\\))([\\d\\(])/g": "$1*$2",
      "/\\/+/g": "/",
      "/[xX:]/g"(o) {
        return t[o];
      },

      "/\\/+/g": "/"
    };
  }

  suite(q) {
    const me   = this;
    const par1 = q.match(/\(/g);
    const par2 = q.match(/\)/g);
    if (((par1 != null) && (par2 != null) && (par1.length !== par2.length)) || ((par1 == null) && (par2 != null)) || ((par1 != null) && (par2 == null))) {
      return me.res = "Unclosed parenthesis.";
    } else if (/.*[\+x\*\/\-]$/.test(q)) {
      return me.res = "Formula ending with an operator.";
    } else {
      return me.res = "Undefined Error.";
    }
  }

  go(ch) {
    let i;
    const me = this;
    let flag = 0;
    for (i in me.rg2) {
      ch = ch.replace(eval(i), me.rg2[i]);
    }
    const finalvalue = ch;
    try {
      const op     = String(ch).match(/[\+x\*\/\-]{2,}/g);
      ch     = ch.toUpperCase();
      ch     = eval(ch);
      if (op != null) { me.res = "Multiple Operators in a row. <br/> Result is probably wrong."; }
      const dec    = (!isNaN(ch) ? ch.toFixed(3) : "It is a string.");
      me.res = (String(dec).search(/\.0+$/) !== -1 ? String(dec).substring(0, String(dec).indexOf(".")) : dec);
      me.res = '';
    } catch (er) {
      for (i in me.rg) {
        if (ch.match(eval(i)) != null) {
          me.res = me.rg[i];
          break;
        }
        flag++;
        if (flag === 5) { me.suite(ch); }
      }
    }
    return [me.res, finalvalue];
  }
}
