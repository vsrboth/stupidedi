# frozen_string_literal: true
module Stupidedi
  module TransactionSets
    module ThirtyTen
      module Standards
        b = Builder
        d = Schema
        r = SegmentReqs
        s = SegmentDefs

        RA820 = b.build("RA", "820", "Payment Order/Remittance Advice",
          d::TableDef.header("1 - Header",
            s:: ST.use( 10, r::Mandatory, d::RepeatCount.bounded(1)),
            s::BPS.use( 20, r::Mandatory, d::RepeatCount.bounded(1)),
            s::REF.use( 50, r::Mandatory, d::RepeatCount.bounded(5)),
            s::DTM.use( 60, r::Mandatory,  d::RepeatCount.bounded(1)),

            d::LoopDef.build("N1", d::RepeatCount.bounded(1),
              s:: N1.use(  70, r::Mandatory, d::RepeatCount.bounded(1)),
              s:: N1.use(  75, r::Mandatory, d::RepeatCount.bounded(1)),
              s:: PER.use(  120, r::Optional, d::RepeatCount.bounded(1)))),

          d::TableDef.detail("2 - Detail",
            s:: LS.use(  10, r::Mandatory, d::RepeatCount.bounded(1)),

            d::LoopDef.build("N1", d::RepeatCount.bounded(10000),
              s:: N1.use(  20, r::Mandatory, d::RepeatCount.bounded(1)),

              d::LoopDef.build("RMT", d::RepeatCount.unbounded,
                s::RMT.use(  30, r::Optional,  d::RepeatCount.bounded(1)),
                s::REF.use(  50, r::Optional,  d::RepeatCount.unbounded),
                s::DTM.use(  60, r::Optional,  d::RepeatCount.bounded(10)))),

            s:: LE.use(  70, r::Mandatory, d::RepeatCount.bounded(1))),

          d::TableDef.summary("3 - Summary",
            s:: SE.use( 10, r::Mandatory, d::RepeatCount.bounded(1))))

      end
    end
  end
end
