defmodule Graphql.Schema.Weather do
  use Absinthe.Schema.Notation

  object :weather do
    @desc "城市ID"
    field(:cityid, :string)

    @desc "当前日期"
    field(:date, :string)

    @desc "当前星期"
    field(:week, :string)

    @desc "气象台更新时间"
    field(:observatory_update_time, :string)

    @desc "城市名称"
    field(:city, :string)

    @desc "城市英文名称"
    field(:cityEn, :string)

    @desc "国家名称"
    field(:country, :string)

    @desc "国家英文名称"
    field(:countryEn, :string)

    @desc "天气情况"
    field(:wea, :string)

    @desc "天气对应图标, 固定9种类型(您也可以根据wea字段自己处理): xue、lei、shachen、wu、bingbao、yun、yu、yin、qing"
    field(:wea_img, :string)

    @desc "实时温度"
    field(:tem, :string)

    @desc "高温"
    field(:tem1, :string)

    @desc "低温"
    field(:tem2, :string)

    @desc "风向"
    field(:win, :string)

    @desc "风力等级"
    field(:win_speed, :string)

    @desc "风速"
    field(:win_meter, :string)

    @desc "湿度"
    field(:humidity, :string)

    @desc "能见度"
    field(:visibility, :string)

    @desc "气压hPa"
    field(:pressure, :string)

    @desc "空气质量"
    field(:air, :string)

    @desc "空气质量等级"
    field(:air_level, :string)

    @desc "空气质量描述"
    field(:air_tips, :string)
  end
end
