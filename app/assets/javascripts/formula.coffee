# http://www.developpez.net/forums/d940195-2/webmasters-developpement-web/general-conception-web/contribuez/eval-calcul-risque/
@UiBibzFormula = class Formula

  contructor: ->
    alert 'uie'

  res: ''

  suite: (q) ->
    me   = this
    par1 = q.match(/\(/g)
    par2 = q.match(/\)/g)
    if (par1? and par2? and par1.length isnt par2.length) or (not par1? and par2?) or (par1? and not par2?)
      me.res = "Unclosed parenthesis."
    else if /.*[\+x\*\/\-]$/.test(q)
      me.res = "Formula ending with an operator."
    else
      me.res = "Undefined Error."

  go: (ch) ->
    me = this
    flag = 0
    for i of me.rg2
      ch = ch.replace(eval(i), me.rg2[i])
    finalvalue = ch
    try
      op     = String(ch).match(/[\+x\*\/\-]{2,}/g)
      ch     = ch.toUpperCase()
      ch     = eval(ch)
      me.res = "Multiple Operators in a row. <br/> Result is probably wrong."  if op?
      dec    = (if not isNaN(ch) then ch.toFixed(3) else "It is a string.")
      me.res = (if String(dec).search(/\.0+$/) isnt -1 then String(dec).substring(0, String(dec).indexOf(".")) else dec)
      me.res = ''
    catch er
      for i of me.rg
        if ch.match(eval(i))?
          me.res = me.rg[i]
          break
        flag++
        me.suite ch  if flag is 5
    return [me.res, finalvalue]

  t:
    x: "*"
    X: "*"
    ":": "/"

  rg:
    "/[^\\+\\*\\/\\-\\(\\)\\s\\d\\.]/": "It is not a number"
    "/[\\+\\*\\/\\-\\(]\\)/": "Parenthesis ending with a incorrect expression."
    "/([\\+\\x\\*\\/\\-]{2,})|([\\+\\x\\*\\/\\-]\\s[\\+\\x\\*\\/\\-])/i": "Multiple Operators in a row."
    "/(\\D\\.)|(\\.[\\D\\s]+)|(\\.\\d+\\.)/": "Wrong Decimal."
    "/\\d\\s+\\d/": "Cut Integer."
    "/\\([\\/\\*]/": "First operator within parenthesis is wrong."
    "/^[\\*\\/]+/": "First operator within string is wrong"

  rg2:
    "/\\s+/g": " "
    "/([^\\.\\,\\;\\d]|^)0+([\\,\\.\\;\\d])/g": "$10$2"
    "/[,;]/g": "."
    "/([^\\d\\.\\,\\;])0+(\\d)/g": "$1$2"
    "/^(0)(\\d)/g": "$2"
    "/[\\[\\]\\|\\&\\=\\!]/g": ""
    "/([\\d\\)])(\\()/g": "$1*$2"
    "/(\\))([\\d\\(])/g": "$1*$2"
    "/\\/+/g": "/"
    "/[xX:]/g": (o) ->
      t[o]

    "/\\/+/g": "/"
