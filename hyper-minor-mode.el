;; マイナーモードの定義
(easy-mmode-define-minor-mode
 hyper-minor-mode
 ;; モード名は、-mode
 ;; ドキュメント
 "Hyper minor mode."
 ;; 初期値
 t
 ;; on の時のモード行への表示
 " hyper"
 ;; マイナーモード用キーマップの初期値
 '(([(hyper b)] . browse-url-at-point)
   ([(hyper c) ?\i ?\'] . hyper-minor-mode-c-i-\')))


(defun hyper-minor-mode-c-i-\' ()
  "'の中を削除する。"
  (interactive)
  (let ((last-point (point)))
    (beginning-of-line)
    (goto-char
     (or (let ((a (search-forward "'" (save-excursion (end-of-line) (point)) t)))
           (when a
             (let ((b (search-forward "'" (save-excursion (end-of-line) (point)) t)))
               (when b
                 (delete-region a (1- b))
                 (backward-char)
                 (point)))))
         last-point))))

(provide 'hyper-minor-mode)
