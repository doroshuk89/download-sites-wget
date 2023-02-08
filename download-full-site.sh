#!/usr/bin/env bash

echo "Укажите адрес сайта, который необходимо скачать...";
read domain;

# Рассмотрим используемые параметры:
# -r	—	указывает на то, что нужно рекурсивно переходить по ссылкам на сайте, чтобы скачивать страницы.
# -k	—	используется для того, чтобы wget преобразовал все ссылки в скаченных файлах таким образом, чтобы по ним можно было переходить на локальном компьютере (в автономном режиме).
# -p	—	указывает на то, что нужно загрузить все файлы, которые требуются для отображения страниц (изображения, css и т.д.).
# -l	—	определяет максимальную глубину вложенности страниц, которые wget должен скачать (по умолчанию значение равно 5, в примере мы установили 7). 
# 			В большинстве случаев сайты имеют страницы с большой степенью вложенности и wget может просто «закопаться», скачивая новые страницы. Чтобы этого не произошло можно использовать параметр -l.
# -E	—	добавлять к загруженным файлам расширение .html.
# -nc	—	при использовании данного параметра существующие файлы не будут перезаписаны. Это удобно, когда нужно продолжить загрузку сайта, прерванную в предыдущий раз.
# -e robots=off - игнорирует запреты в файле robots.txt

if [[  ${domain} ]]; then
	time wget -r -k -l1 -p -E -nc  -e robots=off  ${domain}
fi