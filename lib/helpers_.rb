# helpers_.rb is alphabetically ordered and thus loaded after the helpers/ subdirectory.
# https://nanoc.app/doc/helpers/

use_helper Environment
include Nanoc::Helpers::LinkTo # TODO: when My::Blog can be added via use_helper, this can be added like that, too
use_helper Nanoc::Helpers::Rendering
use_helper Nanoc::Helpers::Blogging
use_helper Nanoc::Helpers::HTMLEscape
use_helper Nanoc::Helpers::Tagging
use_helper Nanoc::Helpers::XMLSitemap
use_helper Nanoc::Helpers::ChildParent
include My::Blog
use_helper EmailHelper
use_helper Menu
use_helper MultiLang

#####

use_helper Snippets # last to use all other helpers
