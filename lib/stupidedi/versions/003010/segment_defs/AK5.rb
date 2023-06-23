# frozen_string_literal: true
module Stupidedi
  module Versions
    module ThirtyTen
      module SegmentDefs
        s = Schema
        e = ElementDefs
        r = ElementReqs

        AK5 = s::SegmentDef.build(:AK5, "Transaction Set Response Trailer",
          "To acknowledge acceptance or rejection and to report errors in a Transaction Set.",
          e::E717 .simple_use(r::Mandatory,  s::RepeatCount.bounded(1)),
          e::E718 .simple_use(r::Optional,   s::RepeatCount.bounded(1)),
          e::E718 .simple_use(r::Mandatory,  s::RepeatCount.bounded(1)),
          e::E718 .simple_use(r::Optional,   s::RepeatCount.bounded(1)),
          e::E718 .simple_use(r::Optional,   s::RepeatCount.bounded(1)),
          e::E718 .simple_use(r::Optional,   s::RepeatCount.bounded(1)))
      end
    end
  end
end
