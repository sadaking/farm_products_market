$ ->
  $("#address_zipcode").jpostal({
    # 郵便番号の入力欄が１つの場合
    # 111-1111と1111111のどちらの入力形式でも住所を自動入力してくれる
    postcode : [ "#address_zipcode" ],

    # 郵便番号の入力欄が3桁-4桁で分かれている場合
    # postcode : [ '#zipcode1', '#zipcode2' ]


    # 入力項目フォーマット
    #   %3  都道府県
    #   %4  市区町村
    #   %5  町域
    #   %6  大口事業所の番地
    #   %7  大口事業所の名称
    address  : {
      "#user_prefecture_code" : "%3", # 都道府県が入力される
      "#address_city"            : "%4%5", # 市区町村と町域が入力される
      "#address_street"          : "%6%7" # 大口事務所の番地と名称が入力される
    }
  })
