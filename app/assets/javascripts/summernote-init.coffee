$ ->
  $('[data-provider="summernote"]').each ->
    $(this).summernote
      lang: 'ja-JP',
      height: 500,
      toolbar: [
        ['style', ['style', 'bold', 'italic', 'underline', 'clear']],
        ['font', ['strikethrough', 'superscript', 'subscript']],
        ['color', ['color']],
        ['para', ['ul', 'ol', 'paragraph']],
        ['insert', ['link', 'picture', 'video']],
      ],
      placeholder: 'ブログの内容を入力してください。(※写真📷、動画📹も投稿できます！)'
      styleTags: [
        'p',
            { title: 'Blockquote', tag: 'blockquote', className: 'blockquote', value: 'blockquote' },
            'pre', 'h1', 'h2', 'h3', 'h4', 'h5', 'h6'
    	],
