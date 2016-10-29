#
#DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
DIR="$( cd "$( dirname "_drafts" )" && pwd )"
Rscript -e "source('$DIR/rmarkdown.r'); convertRMarkdown(images.dir='$DIR/images')"