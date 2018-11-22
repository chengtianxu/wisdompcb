{ Draw_Four_Picture1.Draw_Unit_Space_Big_Small_Scale:=false; //是否按比例画图
      Draw_Four_Picture1.Draw_Unit_Space_Big_Small_Size:=2; //当按比例画图为FALSE时,才起作用,单元间距加上这个数
      Draw_Four_Picture1.Draw_Unit_To_Pnl_Space_Big_Small_Size:=5;//当按比例画图为FALSE时,才起作用,单元边距加上这个数
}



//   bw:Sheet_size; //定义记录
//   cw:pnl_size;  //定义记录
//Draw_Picture1:=TDraw_Picture.Create ;建立类

     {给记录值
     bw.Long1:=Plan_makeup_using_Sheet1.Result_return[0].Long1 ;
     bw.Width1:=Plan_makeup_using_Sheet1.Result_return[0].Width1 ;
     bw.Long1_number:=Plan_makeup_using_Sheet1.Result_return[0].Long1_number ;
     bw.Width1_number:=Plan_makeup_using_Sheet1.Result_return[0].Width1_number ;
     bw.Long2:=Plan_makeup_using_Sheet1.Result_return[0].Long2 ;
     bw.Width2:=Plan_makeup_using_Sheet1.Result_return[0].Width2 ;
     bw.Long2_number:=Plan_makeup_using_Sheet1.Result_return[0].Long2_number ;
     bw.Width2_number:=Plan_makeup_using_Sheet1.Result_return[0].Width2_number ;
     bw.Long3:=Plan_makeup_using_Sheet1.Result_return[0].Long3 ;
     bw.Width3:=Plan_makeup_using_Sheet1.Result_return[0].Width3 ;
     bw.Long3_number:=Plan_makeup_using_Sheet1.Result_return[0].Long3_number ;
     bw.Width3_number:=Plan_makeup_using_Sheet1.Result_return[0].Width3_number ;
     bw.sheet_long:=Plan_makeup_using_Sheet1.Result_return[0].sheet_long ;
     bw.sheet_width:=Plan_makeup_using_Sheet1.Result_return[0].sheet_width ;

     Draw_Picture1.Input_Sheet_Size:=bw;
画开料图     Draw_Picture1.Draw_Sheet_Picture(image3.Canvas,image3.Width ,image3.Height);
     }

     {给记录值
     cw.Long1:=300;
     cw.Width1:=400;
     cw.Unit_Long:=50;
     cw.Unit_Width:=15;
     cw.Unit_Long_ToUnit_Space:=1.5;
     cw.Unit_Width_ToUnit_Space:=1.4;
     cw.Unit_Long_PNL_Space:=18.9;
     cw.Unit_Width_PNL_Space:=7.8;
     cw.Unit_Long_Number:=5;
     cw.Unit_Width_number:=7;
     Draw_Picture1.Input_pnl_size:=cw;
画排版图     Draw_Picture1.Draw_PNL_Picture(image3.Canvas,image3.Width ,image3.Height);
     }





//画图单元类,可以画排版图与开料图
//DRAW_PNL_PICTURE与DRAW_SHEET_PICTURE
unit Draw_Picture_Unit;

interface
uses
  Messages,SysUtils,StdCtrls,Dialogs,ExtCtrls,math,Graphics,wintypes;
type
    Draw_Sheet_OnePNL_One_Section=record   //用于一区画图
         PNLA_Long:currency; //PNLA长,用于标注尺寸
         PNLA_Width:currency;//宽,用于标注尺寸
         PNLA_Long_Number:integer;//长个数
         PNLA_Width_Number:integer;//宽个数
         PNLA_Long_integer:integer;//长用于画图
         PNLA_Width_integer:integer;//宽用于画图
    end;
    Draw_Sheet_TwoPNL_Two_Section=record
         PNLA_Long:currency; //PNLA长,用于标注尺寸
         PNLA_Width:currency;//宽,用于标注尺寸
         PNLA_Long_Number:integer;//长个数
         PNLA_Width_Number:integer;//宽个数
         PNLA_Long_integer:integer;//长用于画图
         PNLA_Width_integer:integer;//宽用于画图
         PNLB_Long:currency; //PNLA长,用于标注尺寸
         PNLB_Width:currency;//宽,用于标注尺寸
         PNLB_Long_Number:integer;//长个数
         PNLB_Width_Number:integer;//宽个数
         PNLB_Long_integer:integer;//长用于画图
         PNLB_Width_integer:integer;//宽用于画图
    end;

    Sheet_Size_TwoPNL_1=RECORD
       One_PNLA_Long:currency;//一区PNL长                                    大料长
       One_PNLA_Width:currency;//一区PNL宽                         N个一区PNLA长                   N'个二区PNLA长,
       One_PNLA_Long_Number:integer;//一区PNL长个数               |-------------------------|--------------------------------------------------------|
       One_PNLA_Width_Number:integer;//一区PNL宽个数              |                         |                                                        |
       Two_Section_Array_type:integer;//二区排方式                |                         |                                                        |
       Two_PNLA_Long:currency; //二区PNLA长                       |                         |                                                        |
       Two_PNLA_Width:currency;//二区PNLA宽                       |   一区                  |                                                        |
       Two_PNLA_Long_Number:integer;//二区PNLA长个数              |                         |     二区                                               |
       Two_PNLA_Width_Number:integer;//二区PNLA宽个数             |                         |                                                        |
                                 //                               |                         |                                                        |
       Two_PNLB_Long:currency;//二区PNLB长                        |                         |                                                        |
       Two_PNLB_Width:currency;//二区PNLB宽                       |                         |                                                        |
       Two_PNLB_Long_Number:integer;//二区PNLB个数                |----------------------------------------------------------------------------------|
       Two_PNLB_Width_Number:integer;//二区PNLB个数               |                                                                                  |
                                 //                               |                                                                                  |
       Three_PNLA_Long:currency;//三区PNLA长                      |                                                                                  |
       Three_PNLA_Width:currency;//三区PNLA宽                     |                                                                                  |
       Three_PNLA_Long_Number:integer;//三区PNLA长个数            |                  三区                                                            |
       Three_PNLA_Width_Number:integer;//三区PNLA宽个数           |                                                                                  |
                                  //                              |                                                                                  |
       Three_PNLB_Long:currency;//三区PNLB长                      |                                                                                  |
       Three_PNLB_Width:currency;//三区PNLB宽                     |                                                                                  |
       Three_PNLB_Long_Number:integer;//三区PNLB长个数            |                                                                                  |
       Three_PNLB_Width_Number:integer;//三区PNLB宽个数           |                                                                                  |
       Three_Section_Array_type:integer;//三区排方式              |----------------------------------------------------------------------------------|
       Sheet_Long:currency;//大料长                                一区只排一种PNL尺寸,二区,三区可能排两种PNL尺寸,具体根据DRAW_TYPE而定.
       Sheet_Width:currency;//大料宽
       Draw_type:integer;
    END;
    Sheet_size=record
      Long1:currency;//一区PNL长
      Width1:currency;//一区PNL宽
      Long1_number:integer;//一区长个数
      Width1_number:integer;//一区宽个数
      Long2:currency;//二区PNL长
      Width2:currency;//二区PNL宽
      Long2_number:integer;//二区长个数
      Width2_number:integer;//二区宽个数
      Long3:currency;//三区PNL长
      Width3:currency;//三区PNL宽
      Long3_number:integer;//3区长个数
      Width3_number:integer;//3区宽个数
      sheet_long:currency; //余料长
      sheet_width:currency;//余料宽
      using2:currency;//利用率
      makeup_type:integer;//排版方式
      use_type1:integer;//0没有1不使用2要使用
      unit1_number_pnl:integer;//一区每PNL单元个数
      unit2_number_pnl:integer;//二区每PNL单元个数
      unit3_number_pnl:integer;//三区每PNL单元个数
      Use_Sheet_Number:integer;//使用余料张数
    end;
   pnl_size=record
      Long1:currency;//PNL长                                          PNL长
      Width1:currency;//PNL宽                             单元长边边距
      Unit_Long:currency;//单元长                        |__________________________________
      Unit_Width:currency;//单元宽                       |    单元长     单元长间距         |
      Unit_Long_ToUnit_Space:currency;//单元长间距       |   __________      ___________    |
      Unit_Width_ToUnit_Space:currency;//单元宽间距      |  |          |     |              |
      Unit_Long_PNL_Space:currency; //单元长到PNL间距    |  |          |     | s             |
      Unit_Width_PNL_Space:currency;//单元宽到PNL间距    |  |__________|     |              |
      Unit_Long_Number:integer;//单元长个数              |__________________________________|
      Unit_Width_number:integer;//单元宽个数
    end;

    TDraw_Picture= CLASS(Tobject)
    private
         Sheet_Size_TwoPNL1:Sheet_Size_TwoPNL_1;
         Sheet_size1:Sheet_size;
         pnl_size1:pnl_size;

          //增加以下三个变量 ,2005-4-12
         Draw_Unit_Space_Big_Small_Size2:integer;//
         Draw_Unit_Space_Big_Small_Scale2:boolean;//
         Draw_Unit_To_Pnl_Space_Big_Small_Size2:integer;


    function Get_Input_Sheet_Size: sheet_size;
    procedure Set_Input_Sheet_Size(const Value: sheet_size);
    function Get_Input_pnl_size1: pnl_size;
    procedure Set_Input_pnl_size1(const Value: pnl_size);
    function Get_Sheet_Size_TwoPNL_1: Sheet_Size_TwoPNL_1;
    procedure Set_Sheet_Size_TwoPNL_1(const Value: Sheet_Size_TwoPNL_1);//
      //用于区画PNL图,只有一个PNL,尺寸标注于PNL内第一个表示长,第二个表示宽
    function Draw_Sheet_OnePNL_Section(ss2:TCanvas;v_Start_X,v_Start_Y:integer;v_Section:Draw_Sheet_OnePNL_One_Section):boolean;//开料图
     //用于二区画图,有二个PNL,只有两个区间画图
    function Draw_Sheet_OnePNL_Picture_One_Section(ss2:TCanvas;v_Start_X,v_Start_Y:integer;v_Section:Draw_Sheet_OnePNL_One_Section):boolean;//开料图
     //用于二区画图,有二个PNL,只有两个区间画图
    function Draw_Sheet_TwoPNL_Picture_Two_Section(ss2:TCanvas;v_Start_X,v_Start_Y,v_End_X,v_End_Y:integer;v_Section:Draw_Sheet_TwoPNL_Two_Section):boolean;
    function Get_Draw_Unit_Space_Big_Small_Scale: boolean;
    function Get_Draw_Unit_Space_Big_Small_Size: integer;
    function Get_Draw_Unit_To_Pnl_Space_Big_Small_Size: integer;
    procedure Set_Draw_Unit_Space_Big_Small_Scale(const Value: boolean);
    procedure Set_Draw_Unit_Space_Big_Small_Size(const Value: integer);
    procedure Set_Draw_Unit_To_Pnl_Space_Big_Small_Size(
      const Value: integer);//开料图

 //   function Draw_Sheet_TwoPNL_Picture_Two_Section_change_pnlapnlb(ss2:TCanvas;v_Start_X,v_Start_Y,v_End_X,v_End_Y:integer;v_Section:Draw_Sheet_TwoPNL_Two_Section):boolean;//开料图

        { Private declarations }
    public
       function Draw_PNL_Picture(ss1:TCanvas;ss1_width,ss1_height:integer):boolean;//排版式图

       function Draw_Sheet_Picture(ss1:TCanvas;ss1_width,ss1_height:integer):boolean;//开料图

       function Draw_Sheet_TwoPNL_Picture(ss1:TCanvas;ss1_width,ss1_height:integer):boolean;//开双拼版开料图

       function Draw_Sheet_OnePNL_Picture(ss1:TCanvas;ss1_width,ss1_height:integer):boolean;//开单拼版开料图

       property Input_Sheet_Size:sheet_size read Get_Input_Sheet_Size write Set_Input_Sheet_Size;
       property Input_pnl_size:pnl_size read Get_Input_pnl_size1 write Set_Input_pnl_size1;
       property Sheet_Size_TwoPNL:Sheet_Size_TwoPNL_1 read Get_Sheet_Size_TwoPNL_1 write Set_Sheet_Size_TwoPNL_1;//双拼板,且二,三区可排两种排版
         //增加以下三个属性, 2005-4-12
       //要画的最小值,小于时,则用这个代替,用于画PNL图时,单元间距与边距很小时,按一个固定的值画出
      property  Draw_Unit_Space_Big_Small_Size:integer read Get_Draw_Unit_Space_Big_Small_Size write Set_Draw_Unit_Space_Big_Small_Size   default 0;
      property  Draw_Unit_To_Pnl_Space_Big_Small_Size:integer read Get_Draw_Unit_To_Pnl_Space_Big_Small_Size write Set_Draw_Unit_To_Pnl_Space_Big_Small_Size   default 0;
      property  Draw_Unit_Space_Big_Small_Scale:boolean read Get_Draw_Unit_Space_Big_Small_Scale write Set_Draw_Unit_Space_Big_Small_Scale   default false;

       { Public declarations }
    end;
var
  Draw_Picture1:TDraw_Picture; //
implementation

{ TDraw_Picture }

function TDraw_Picture.Draw_PNL_Picture(ss1: TCanvas;ss1_width,ss1_height:integer): boolean;
type
  Sheet_pnl2=record
      Long1:integer;//单元长
      Width1:integer;//单元宽
      Unit_Long:integer;//单元长
      Unit_Width:integer;//单元宽
      Unit_Long_ToUnit_Space:integer;//单元长间距
      Unit_Width_ToUnit_Space:integer;//单元宽间距
      Unit_Long_PNL_Space:integer; //单元长到PNL间距
      Unit_Width_PNL_Space:integer;//单元宽到PNL间距
      Unit_Long_Number:integer;//单元长个数
      Unit_Width_number:integer;//单元宽个数
  end;
var
   i,j,Long1,Width1,Stat_x,Stat_y,Stat_x1,Stat_y1,End_x,End_y,text_height1,Long2,varx,vary:integer;
   Tep_PNLA:ARRAY[0..9] OF INTEGER;//
   Tep_PNLA1:ARRAY[0..9] OF currency;//
   Tep_PNLAN:ARRAY[0..8] OF INTEGER;
   k:currency; //比率
   vsheet_size1:pnl_size;//
   Sheet_unit3:Sheet_pnl2;
   FlogFont:TlogFont;
   fhfont:hfont;
   WI5,wi6:CURRENCY;  //新增变量,2005-4-12
begin
  //
     FlogFont.lfStrikeOut:=0;//非删除字体
     FlogFont.lfUnderline:=0;//非下画线
     FlogFont.lfItalic:=0;//非斜体
     FlogFont.lfHeight:=0;//高度,由系统计决定,
     FlogFont.lfWidth:=0;//宽度,由系统计决定,
     FlogFont.lfEscapement:=0; //使用FlogFont要引用wintypes单元  字体转90度
     FlogFont.lfWeight:=fw_dontcare;//字体密度
     FlogFont.lfCharSet:=default_charset;//ansi_charset=0;1;128;255
     FlogFont.lfQuality:=default_quality;//字体质量,proof_quality,draft_quality
     FlogFont.lfFaceName:='宋体';//字体的样式名

     fhfont:=createfontindirect(FlogFont);
     ss1.Font.Handle:=fhfont;
    //
  vsheet_size1.Long1:=pnl_size1.Long1;
  vsheet_size1.Width1 :=pnl_size1.Width1 ;
  vsheet_size1.Unit_Long :=pnl_size1.Unit_Long ;
  vsheet_size1.Unit_Width :=pnl_size1.Unit_Width ;
  vsheet_size1.Unit_Long_ToUnit_Space :=pnl_size1.Unit_Long_ToUnit_Space ;
  vsheet_size1.Unit_Width_ToUnit_Space :=pnl_size1.Unit_Width_ToUnit_Space ;
  vsheet_size1.Unit_Long_PNL_Space :=pnl_size1.Unit_Long_PNL_Space ;
  vsheet_size1.Unit_Width_PNL_Space :=pnl_size1.Unit_Width_PNL_Space ;
  vsheet_size1.Unit_Long_Number :=pnl_size1.Unit_Long_Number ;
  vsheet_size1.Unit_Width_number :=pnl_size1.Unit_Width_number ;

  //将PNL长宽转换
  if vsheet_size1.Long1<vsheet_size1.Width1 then
  begin
     vsheet_size1.Long1:=pnl_size1.Width1;
     vsheet_size1.Width1 :=pnl_size1.Long1 ;
     vsheet_size1.Unit_Long :=pnl_size1.Unit_Width ;
     vsheet_size1.Unit_Width :=pnl_size1.Unit_Long ;
     vsheet_size1.Unit_Long_ToUnit_Space :=pnl_size1.Unit_Width_ToUnit_Space ;
     vsheet_size1.Unit_Width_ToUnit_Space :=pnl_size1.Unit_Long_ToUnit_Space ;
     vsheet_size1.Unit_Long_PNL_Space :=pnl_size1.Unit_Width_PNL_Space ;
     vsheet_size1.Unit_Width_PNL_Space :=pnl_size1.Unit_Long_PNL_Space ;
     vsheet_size1.Unit_Long_Number :=pnl_size1.Unit_Width_number ;
     vsheet_size1.Unit_Width_number :=pnl_size1.Unit_Long_Number ;

  end;

   FlogFont.lfEscapement:=-900; //使用FlogFont要引用wintypes单元  字体转90度
   fhfont:=createfontindirect(FlogFont);
   ss1.Font.Handle:=fhfont;
  //
   FlogFont.lfEscapement:=0; //使用FlogFont要引用wintypes单元  字体转0度
 //   FlogFont.lfHeight:=ss1.Font.Height;
 //    FlogFont.lfWidth:=ss1.Font.Size;
   fhfont:=createfontindirect(FlogFont);
   ss1.Font.Handle:=fhfont;
  //
   text_height1:=ss1.TextHeight('板');
   Long2:=5* text_height1;//所画图形距边的距离
    //更改,由5.5改为7,以下两行,2005-4-12
   Long1:=ss1_Width-trunc(7*text_height1);//-ss1.TextHeight('板宽'+currtostr(vsheet_size1.Width2))-20;
   Width1:=ss1_Height-trunc(7*text_height1);
   Stat_x:=trunc(0.5*text_height1);
   Stat_y:=Long2-trunc(0.5* text_height1);
   //showmessage(currtostr(vsheet_size1.Long1));
   IF (vsheet_size1.Long1=0) or (vsheet_size1.Width1=0) THEN
   begin
     showmessage('尺寸为0!');
     exit;
   end;
   //新增内容,2005-4-12
   wi5:=0;
   wi6:=0;
   if Draw_Unit_Space_Big_Small_Scale2=false then
   begin
     wi5:=Draw_Unit_Space_Big_Small_Size2*(vsheet_size1.Unit_Long_Number-1);
     wi6:=Draw_Unit_Space_Big_Small_Size2*(vsheet_size1.Unit_width_Number-1);
     wi5:=wi5+2*Draw_Unit_To_Pnl_Space_Big_Small_Size2;
     wi6:=wi6+2*Draw_Unit_To_Pnl_Space_Big_Small_Size2;


     {
     Draw_Unit_Space_Big_Small_Size2:=1;
     if Draw_Unit_Space_Big_Small_Size2-vsheet_size1.Unit_Long_ToUnit_Space>0 THEN
         WI5:=WI5+Draw_Unit_Space_Big_Small_Size2*(vsheet_size1.Unit_Long_Number-1);
     if Draw_Unit_Space_Big_Small_Size2-vsheet_size1.Unit_width_ToUnit_Space>0 THEN
         WI6:=WI6+Draw_Unit_Space_Big_Small_Size2*(vsheet_size1.Unit_width_Number-1);
     Draw_Unit_To_Pnl_Space_Big_Small_Size2:=0;
     if Draw_Unit_To_Pnl_Space_Big_Small_Size2-vsheet_size1.Unit_Long_PNL_Space>0 THEN
         WI5:=WI5+Draw_Unit_To_Pnl_Space_Big_Small_Size2-vsheet_size1.Unit_Long_PNL_Space;
      if Draw_Unit_To_Pnl_Space_Big_Small_Size2-vsheet_size1.Unit_width_PNL_Space>0 THEN
         WI6:=WI6+Draw_Unit_To_Pnl_Space_Big_Small_Size2-vsheet_size1.Unit_width_PNL_Space;
      {}




   end;
   //k:=min(Long1/vsheet_size1.Long1,Width1/vsheet_size1.Width1); //画图比例
   k:=min(Long1/(vsheet_size1.Long1+wi5),Width1/(vsheet_size1.Width1+wi6)); //画图比例   //更改 2005-4-12

   Sheet_unit3.Long1:=trunc(k*vsheet_size1.Long1); //画图的长度
   Sheet_unit3.Width1 :=trunc(k*vsheet_size1.Width1) ;
   Sheet_unit3.Unit_Long :=trunc(k*vsheet_size1.Unit_Long);
   Sheet_unit3.Unit_Width :=trunc(k*vsheet_size1.Unit_Width);
   Sheet_unit3.Unit_Long_ToUnit_Space :=trunc(k*vsheet_size1.Unit_Long_ToUnit_Space);
   Sheet_unit3.Unit_Width_ToUnit_Space :=trunc(k*vsheet_size1.Unit_Width_ToUnit_Space);
   Sheet_unit3.Unit_Long_PNL_Space :=trunc(k*vsheet_size1.Unit_Long_PNL_Space);
   Sheet_unit3.Unit_Width_PNL_Space :=trunc(k*vsheet_size1.Unit_Width_PNL_Space) ;

   //新增,2005-4-12
   if Draw_Unit_Space_Big_Small_Scale2=false then
   begin
     WI5:=Draw_Unit_Space_Big_Small_Size2-vsheet_size1.Unit_Long_ToUnit_Space;
     if WI5<0 THEN
         Sheet_unit3.Unit_Long_ToUnit_Space:=trunc(k*vsheet_size1.Unit_Long_ToUnit_Space)
     ELSE
     BEGIN
         Sheet_unit3.Unit_Long_ToUnit_Space:=trunc(k*Draw_Unit_Space_Big_Small_Size2);
         Sheet_unit3.Long1:=Sheet_unit3.Long1+TRUNC(K*WI5*(vsheet_size1.Unit_Long_Number-1));
     END;
     WI5:=Draw_Unit_Space_Big_Small_Size2-vsheet_size1.Unit_Width_ToUnit_Space;
     if WI5<0 THEN
         Sheet_unit3.Unit_Width_ToUnit_Space :=trunc(k*vsheet_size1.Unit_Width_ToUnit_Space)
     ELSE
     BEGIN
         Sheet_unit3.Unit_Width_ToUnit_Space:=trunc(k*Draw_Unit_Space_Big_Small_Size2);
         Sheet_unit3.width1:=Sheet_unit3.width1+TRUNC(K*WI5*(vsheet_size1.Unit_width_Number-1));
     END;
     WI5:=Draw_Unit_To_Pnl_Space_Big_Small_Size2-vsheet_size1.Unit_Long_PNL_Space;
     if WI5<0 THEN
          Sheet_unit3.Unit_Long_PNL_Space:=trunc(k*vsheet_size1.Unit_Long_PNL_Space)
     ELSE
     BEGIN
         Sheet_unit3.Unit_Long_PNL_Space:=trunc(k*Draw_Unit_Space_Big_Small_Size2);
         Sheet_unit3.Long1:=Sheet_unit3.Long1+TRUNC(K*WI5*(vsheet_size1.Unit_Long_Number-1));
     END;

     WI5:=Draw_Unit_To_Pnl_Space_Big_Small_Size2-vsheet_size1.Unit_Width_PNL_Space;
     if WI5<0 THEN
         Sheet_unit3.Unit_Width_PNL_Space:=trunc(k*vsheet_size1.Unit_Width_PNL_Space)
     ELSE
     BEGIN
         Sheet_unit3.Unit_Width_PNL_Space:=trunc(k*Draw_Unit_Space_Big_Small_Size2);
         Sheet_unit3.width1:=Sheet_unit3.width1+TRUNC(K*WI5*(vsheet_size1.Unit_Long_Number-1));
     END;
   END;


   ss1.Pen.Width:=2;
   ss1.Pen.Color:=clblack;
   End_x:=Stat_x+Sheet_unit3.Long1 ;
   End_y:=Stat_y+Sheet_unit3.width1;
   Sheet_unit3.Unit_Long_Number:=vsheet_size1.Unit_Long_Number ;
   Sheet_unit3.Unit_Width_number:=vsheet_size1.Unit_Width_number ;

   if Sheet_unit3.Unit_Long*Sheet_unit3.Unit_Long_Number+Sheet_unit3.Unit_Long_ToUnit_Space*(Sheet_unit3.Unit_Long_Number-1)+2*Sheet_unit3.Unit_Long_PNL_Space<Sheet_unit3.Long1 then
   begin
      Sheet_unit3.Unit_Long_PNL_Space:=trunc((Sheet_unit3.Long1-(Sheet_unit3.Unit_Long *Sheet_unit3.Unit_Long_Number+Sheet_unit3.Unit_Long_ToUnit_Space*(Sheet_unit3.Unit_Long_Number-1)))/2);
   end;
   if Sheet_unit3.Unit_width*Sheet_unit3.Unit_width_Number+Sheet_unit3.Unit_width_ToUnit_Space*(Sheet_unit3.Unit_width_Number-1)+2*Sheet_unit3.Unit_width_PNL_Space<Sheet_unit3.width1 then
   begin
      Sheet_unit3.Unit_width_PNL_Space:=trunc((Sheet_unit3.width1-(Sheet_unit3.Unit_width *Sheet_unit3.Unit_width_Number+Sheet_unit3.Unit_width_ToUnit_Space*(Sheet_unit3.Unit_width_Number-1)))/2);
   end;


   //画PNL图
   ss1.Rectangle(Stat_x,Stat_y,End_x,End_y);
   //
   ss1.Pen.Width:=1;
   for i:=0 to Sheet_unit3.Unit_Long_Number-1   do  //坚线
   begin
      FOR J:=0 TO Sheet_unit3.Unit_Width_number-1 DO
      BEGIN
         ss1.Rectangle(Stat_x+Sheet_unit3.Unit_Long_PNL_Space+Sheet_unit3.Unit_Long*i+Sheet_unit3.Unit_Long_ToUnit_Space*i,Stat_y+Sheet_unit3.Unit_Width_PNL_Space+Sheet_unit3.Unit_Width*j+Sheet_unit3.Unit_Width_ToUnit_Space*j ,
                       Stat_x+Sheet_unit3.Unit_Long_PNL_Space+Sheet_unit3.Unit_Long*(i+1)+Sheet_unit3.Unit_Long_ToUnit_Space*i,Stat_y+Sheet_unit3.Unit_Width_PNL_Space+Sheet_unit3.Unit_Width*(j+1)+Sheet_unit3.Unit_Width_ToUnit_Space*j);
      end;
   end;
  ss1.Pen.Width:=1;
    //标注pnl板长
   ss1.MoveTo(end_x,Stat_y);  //竖线
   ss1.LineTo(end_x,Stat_y-4*text_height1);  //竖线
   ss1.MoveTo(Stat_x,Stat_y-trunc(3.5*text_height1));   //横线
   ss1.LineTo(end_x,Stat_y-trunc(3.5*text_height1));   //横线

   ss1.MoveTo(Stat_x,Stat_y-trunc(3.5*text_height1)); //箭头
   ss1.lineTo(Stat_x+10,Stat_y-trunc(3.5*text_height1)+5); //箭头
   ss1.MoveTo(Stat_x,Stat_y-trunc(3.5*text_height1)); //箭头
   ss1.lineTo(Stat_x+10,Stat_y-trunc(3.5*text_height1)-5); //箭头

   ss1.MoveTo(end_x,Stat_y-trunc(3.5*text_height1)); //箭头
   ss1.lineTo(end_x-10,Stat_y-trunc(3.5*text_height1)+5); //箭头
   ss1.MoveTo(end_x,Stat_y-trunc(3.5*text_height1)); //箭头
   ss1.lineTo(end_x-10,Stat_y-trunc(3.5*text_height1)-5); //箭头

   varx:=Stat_x+trunc((Sheet_unit3.Long1  -ss1.TextWidth(currtostr(vsheet_size1.Long1  )))/2);//  板长:
   vary:=stat_y-4*text_height1-2;
   ss1.TextOut(varx,vary,currtostr(vsheet_size1.Long1));//单元到边距离

   ss1.MoveTo(Stat_x,Stat_y);  //竖线
   ss1.LineTo(Stat_x,Stat_y-4*text_height1);  //竖线
   ss1.MoveTo(Stat_x+Sheet_unit3.Unit_Long_PNL_Space ,Stat_y);  //坚线
   ss1.LineTo(Stat_x+Sheet_unit3.Unit_Long_PNL_Space ,Stat_y-3*text_height1);  //坚线
   ss1.MoveTo(Stat_x,Stat_y-trunc(2.5*text_height1));   //横线

   ss1.LineTo(Stat_x+Sheet_unit3.Unit_Long_PNL_Space ,Stat_y-trunc(2.5*text_height1));   //横线

   if trunc((Sheet_unit3.Unit_Long_PNL_Space -ss1.TextWidth(currtostr(vsheet_size1.Unit_Long_PNL_Space  )))/2)>0 then //  '边距:'+'边距:'+
   begin
     varx:=Stat_x+trunc((Sheet_unit3.Unit_Long_PNL_Space -ss1.TextWidth(currtostr(vsheet_size1.Unit_Long_PNL_Space  )))/2);
   end
   else
   begin
     varx:=Stat_x+1+Sheet_unit3.Unit_Long_PNL_Space;
   end;
   vary:=stat_y-3*text_height1;
   ss1.TextOut(varx,vary,currtostr(vsheet_size1.Unit_Long_PNL_Space));//单元到边距离  '边距:'+

   ss1.MoveTo(Stat_x+Sheet_unit3.Unit_Long_PNL_Space +Sheet_unit3.Unit_Long  ,Stat_y);  //坚线
   ss1.LineTo(Stat_x+Sheet_unit3.Unit_Long_PNL_Space +Sheet_unit3.Unit_Long,Stat_y-2*text_height1);  //坚线
   ss1.MoveTo(Stat_x+Sheet_unit3.Unit_Long_PNL_Space  ,Stat_y-trunc(1.5*text_height1));   //横线
   ss1.LineTo(Stat_x+Sheet_unit3.Unit_Long_PNL_Space +Sheet_unit3.Unit_Long,Stat_y-trunc(1.5*text_height1));   //横线
   ss1.MoveTo(Stat_x+Sheet_unit3.Unit_Long_PNL_Space  ,Stat_y-trunc(1.5*text_height1)); //箭头
   ss1.lineto(Stat_x+Sheet_unit3.Unit_Long_PNL_Space+5  ,Stat_y-trunc(1.5*text_height1)+5); //箭头
   ss1.MoveTo(Stat_x+Sheet_unit3.Unit_Long_PNL_Space  ,Stat_y-trunc(1.5*text_height1)); //箭头
   ss1.lineto(Stat_x+Sheet_unit3.Unit_Long_PNL_Space+5  ,Stat_y-trunc(1.5*text_height1)-5); //箭头

   ss1.MoveTo(Stat_x+Sheet_unit3.Unit_Long_PNL_Space +Sheet_unit3.Unit_Long,Stat_y-trunc(1.5*text_height1)); //箭头
   ss1.lineTo(Stat_x+Sheet_unit3.Unit_Long_PNL_Space +Sheet_unit3.Unit_Long-5,Stat_y-trunc(1.5*text_height1)+5); //箭头
   ss1.MoveTo(Stat_x+Sheet_unit3.Unit_Long_PNL_Space +Sheet_unit3.Unit_Long,Stat_y-trunc(1.5*text_height1)); //箭头
   ss1.lineTo(Stat_x+Sheet_unit3.Unit_Long_PNL_Space +Sheet_unit3.Unit_Long-5,Stat_y-trunc(1.5*text_height1)-5); //箭头




   if trunc((Sheet_unit3.Unit_Long -ss1.TextWidth(currtostr(vsheet_size1.Unit_Long )+'X'+inttostr(Sheet_unit3.Unit_Long_Number) ))/2)>0 then // '单元长:'+ '单元长:'+
   begin
     varx:=Stat_x+Sheet_unit3.Unit_Long_PNL_Space +trunc((Sheet_unit3.Unit_Long-ss1.TextWidth(currtostr(vsheet_size1.Unit_Long)+'X'+inttostr(Sheet_unit3.Unit_Long_Number) ))/2);
   end
   else
   begin
     varx:=Stat_x+Sheet_unit3.Unit_Long_PNL_Space +Sheet_unit3.Unit_Long+1;
   end;
   vary:=stat_y-2*text_height1;
   ss1.TextOut(varx,vary,currtostr(vsheet_size1.Unit_Long )+'X'+inttostr(Sheet_unit3.Unit_Long_Number)  );//标注单元长与个数   '单元长:'+

   if vsheet_size1.Unit_Long_ToUnit_Space>0  then
   begin

      ss1.MoveTo(Stat_x+Sheet_unit3.Unit_Long_PNL_Space +Sheet_unit3.Unit_Long+Sheet_unit3.Unit_Long_ToUnit_Space+1,Stat_y);  //坚线
      ss1.LineTo(Stat_x+Sheet_unit3.Unit_Long_PNL_Space +Sheet_unit3.Unit_Long+Sheet_unit3.Unit_Long_ToUnit_Space+1,Stat_y-text_height1);  //坚线
      ss1.MoveTo(Stat_x+Sheet_unit3.Unit_Long_PNL_Space + Sheet_unit3.Unit_Long ,Stat_y-trunc(0.5*text_height1));   //横线
      ss1.LineTo(Stat_x+Sheet_unit3.Unit_Long_PNL_Space +Sheet_unit3.Unit_Long +Sheet_unit3.Unit_Long_ToUnit_Space+1,Stat_y-trunc(0.5*text_height1));   //横线
      if trunc((Sheet_unit3.Unit_Long_ToUnit_Space -ss1.TextWidth(currtostr(vsheet_size1.Unit_Long_ToUnit_Space  )+'X'+inttostr(Sheet_unit3.Unit_Long_Number-1) ))/2)>0 then //    '单元间距:'+ '单元间距:'+
      begin
        varx:=Stat_x+Sheet_unit3.Unit_Long_PNL_Space + Sheet_unit3.Unit_Long+Sheet_unit3.Unit_Long_ToUnit_Space+trunc((Sheet_unit3.Unit_Long_ToUnit_Space-ss1.TextWidth(currtostr(vsheet_size1.Unit_Long_ToUnit_Space)+'X'+inttostr(Sheet_unit3.Unit_Long_Number-1) ))/2);
      end else
      begin
        varx:=Stat_x+Sheet_unit3.Unit_Long_PNL_Space+Sheet_unit3.Unit_Long  +Sheet_unit3.Unit_Long_ToUnit_Space+1;
      end;
      vary:=stat_y-text_height1-2;
      ss1.TextOut(varx+2,vary,currtostr(vsheet_size1.Unit_Long_ToUnit_Space  )+'X'+inttostr(Sheet_unit3.Unit_Long_Number-1)  );//标注单元长与个数   '单元间距:'+
   end;

   FlogFont.lfEscapement:=-900; //使用FlogFont要引用wintypes单元  字体转90度
   //FlogFont.lfHeight:=ss1.Font.Height;
   //FlogFont.lfWidth:=ss1.Font.Size;
   fhfont:=createfontindirect(FlogFont);
   ss1.Font.Handle:=fhfont;
   //

    //标注pnl板宽 ,竖线尺寸
   ss1.MoveTo(end_x,Stat_y);  //横线
   ss1.LineTo(end_x+4*text_height1,Stat_y);  //横线
   ss1.MoveTo(end_x+trunc(3.5*text_height1)+2,Stat_y);   //竖线
   ss1.LineTo(end_x+trunc(3.5*text_height1)+2,Stat_y+Sheet_unit3.Width1);   //竖线

   ss1.MoveTo(end_x+trunc(3.5*text_height1)+2,Stat_y);   //箭头
   ss1.lineTo(end_x+trunc(3.5*text_height1)-3,Stat_y+10);   //箭头
   ss1.MoveTo(end_x+trunc(3.5*text_height1)+2,Stat_y);   //箭头
   ss1.lineTo(end_x+trunc(3.5*text_height1)+7,Stat_y+10);   //箭头
   ss1.moveTo(end_x+trunc(3.5*text_height1)+2,Stat_y+Sheet_unit3.Width1);   //箭头
   ss1.LineTo(end_x+trunc(3.5*text_height1)-3,Stat_y+Sheet_unit3.Width1-10);   //箭头
   ss1.moveTo(end_x+trunc(3.5*text_height1)+2,Stat_y+Sheet_unit3.Width1);   //箭头
   ss1.LineTo(end_x+trunc(3.5*text_height1)+7,Stat_y+Sheet_unit3.Width1-10);   //箭头


   varx:=end_x+4*text_height1+2;
   vary:=stat_y+trunc((Sheet_unit3.Width1  -ss1.TextWidth(currtostr(vsheet_size1.Width1  )))/2);  // '板宽:'+
   ss1.TextOut(varx,vary,currtostr(vsheet_size1.Width1 ));//单元到边距离 '板宽:'+
   //横竖线尺寸
   ss1.MoveTo(end_x,end_y);  //横线
   ss1.LineTo(end_x+4*text_height1,end_y);  //横线
   ss1.MoveTo(end_x,Stat_y+Sheet_unit3.Unit_Width_PNL_Space  );  //横线
   ss1.LineTo(end_x+3*text_height1 ,Stat_y+Sheet_unit3.Unit_Width_PNL_Space);  //横线
   ss1.MoveTo(end_x+trunc(2.5*text_height1)+2,Stat_y);   //竖线
   ss1.LineTo(end_x +trunc(2.5*text_height1)+2,Stat_y+Sheet_unit3.Unit_Width_PNL_Space);   //竖线
   if trunc((Sheet_unit3.Unit_Width_ToUnit_Space -ss1.TextWidth(currtostr(vsheet_size1.Unit_Width_PNL_Space  )))/2)>0 then // '边距:'+ '边距:'+
   begin
     vary:=stat_y+trunc((Sheet_unit3.Unit_Width_PNL_Space -ss1.TextWidth(currtostr(vsheet_size1.Unit_Width_PNL_Space  )))/2);
   end
   else
   begin
     vary:=stat_y+Sheet_unit3.Unit_Width_PNL_Space+1;
   end;
   varx:=end_x+2+3*text_height1;
   ss1.TextOut(varx,vary,currtostr(vsheet_size1.Unit_Width_PNL_Space));//单元到边距离 '边距:'+
   //
   ss1.MoveTo(end_x ,Stat_y+Sheet_unit3.Unit_Width_PNL_Space  +Sheet_unit3.Unit_Width  );  //横线
   ss1.LineTo(end_x+2*text_height1,Stat_y+Sheet_unit3.Unit_Width_PNL_Space +Sheet_unit3.Unit_Width);  //横线

   ss1.MoveTo(end_x+trunc(1.5*text_height1)+2 ,Stat_y+Sheet_unit3.Unit_Width_PNL_Space );   //竖线
   ss1.LineTo(end_x+trunc(1.5*text_height1)+2,Stat_y+Sheet_unit3.Unit_Width_PNL_Space +Sheet_unit3.Unit_Width);   //竖线

   ss1.MoveTo(end_x+trunc(1.5*text_height1)+2 ,Stat_y+Sheet_unit3.Unit_Width_PNL_Space );   //竖线
   ss1.lineTo(end_x+trunc(1.5*text_height1)-3 ,Stat_y+Sheet_unit3.Unit_Width_PNL_Space +5);   //竖线
   ss1.MoveTo(end_x+trunc(1.5*text_height1)+2 ,Stat_y+Sheet_unit3.Unit_Width_PNL_Space );   //竖线
   ss1.lineTo(end_x+trunc(1.5*text_height1)+7 ,Stat_y+Sheet_unit3.Unit_Width_PNL_Space +5);   //竖线
   ss1.moveTo(end_x+trunc(1.5*text_height1)+2,Stat_y+Sheet_unit3.Unit_Width_PNL_Space +Sheet_unit3.Unit_Width);   //竖线
   ss1.LineTo(end_x+trunc(1.5*text_height1)-3,Stat_y+Sheet_unit3.Unit_Width_PNL_Space +Sheet_unit3.Unit_Width-5);   //竖线
   ss1.moveTo(end_x+trunc(1.5*text_height1)+2,Stat_y+Sheet_unit3.Unit_Width_PNL_Space +Sheet_unit3.Unit_Width);   //竖线
   ss1.LineTo(end_x+trunc(1.5*text_height1)+7,Stat_y+Sheet_unit3.Unit_Width_PNL_Space +Sheet_unit3.Unit_Width-5);   //竖线

   if trunc((Sheet_unit3.Unit_Width -ss1.TextWidth(currtostr(vsheet_size1.Unit_Width  )+'X'+inttostr(Sheet_unit3.Unit_Width_Number) ))/2)>0 then //     '单元宽:' '单元宽:'+
   begin
     vary:=stat_y+Sheet_unit3.Unit_Width_PNL_Space +trunc((Sheet_unit3.Unit_Width -ss1.TextWidth(currtostr(vsheet_size1.Unit_Width)+'X'+inttostr(Sheet_unit3.Unit_Width_number ) ))/2);
   end
   else
   begin
     vary:= stat_y+Sheet_unit3.Unit_Width_PNL_Space+1+Sheet_unit3.Unit_Width;
   end;
   varx:=end_x+2*text_height1+2;
   ss1.TextOut(varx,vary,currtostr(vsheet_size1.Unit_Width )+'X'+inttostr(Sheet_unit3.Unit_Width_number )  );//标注单元长与个数  '单元宽:'+
    //
   if vsheet_size1.Unit_Width_ToUnit_Space >0  then
   begin
      ss1.MoveTo(end_x,Stat_y+Sheet_unit3.Unit_Width_PNL_Space  +Sheet_unit3.Unit_Width+Sheet_unit3.Unit_Width_ToUnit_Space+1);  //坚线
      ss1.LineTo(end_x+text_height1,Stat_y+Sheet_unit3.Unit_Width_PNL_Space +Sheet_unit3.Unit_Width+Sheet_unit3.Unit_Width_ToUnit_Space+1);  //坚线
      ss1.MoveTo(end_x+trunc(0.5*text_height1),Stat_y+Sheet_unit3.Unit_Width_PNL_Space + Sheet_unit3.Unit_Width+Sheet_unit3.Unit_Width_ToUnit_Space+1 );   //横线
      ss1.LineTo(end_x+trunc(0.5*text_height1),Stat_y+Sheet_unit3.Unit_Width_PNL_Space +Sheet_unit3.Unit_Width);   //横线
      if trunc((Sheet_unit3.Unit_Width_ToUnit_Space -ss1.TextWidth(currtostr(vsheet_size1.Unit_Width_ToUnit_Space  )+'X'+inttostr(Sheet_unit3.Unit_Width_Number-1) ))/2)>0 then  //    '单元间距:'+  '单元间距:'+
      begin
        vary:=2+stat_y+Sheet_unit3.Unit_Width_PNL_Space + Sheet_unit3.Unit_Long+Sheet_unit3.Unit_Width_ToUnit_Space+trunc((Sheet_unit3.Unit_Width_ToUnit_Space-ss1.TextWidth(currtostr(vsheet_size1.Unit_Width_ToUnit_Space)+'X'+inttostr(Sheet_unit3.Unit_Width_number -1) ))/2);
      end
      else
      begin
        vary:=2+stat_y+Sheet_unit3.Unit_Width_PNL_Space+Sheet_unit3.Unit_Width  +Sheet_unit3.Unit_Width_ToUnit_Space+1;
      end;
      varx:=end_x+2+text_height1;
      ss1.TextOut(varx,vary+2,currtostr(vsheet_size1.Unit_Width_ToUnit_Space  )+'X'+inttostr(Sheet_unit3.Unit_Width_number -1)  );//标注单元长与个数      '单元间距:'+
   end;





   ss1.Pen.Width:=1;
   FlogFont.lfEscapement:=0; //使用FlogFont要引用wintypes单元  字体转0度
   fhfont:=createfontindirect(FlogFont);
   ss1.Font.Handle:=fhfont;
   //
end;



function TDraw_Picture.Draw_Sheet_OnePNL_Picture(ss1: TCanvas; ss1_width,
  ss1_height: integer): boolean;
type
   Draw_Data_1=record
        One_Section_Long:integer;//一区板长
        One_Section_Width:integer;//一区板宽
        One_Section_Long_Number:integer;//一区板长个数
        One_Section_Width_Number:integer;//一区板宽个数

        Two_Section_LongA:integer;//二区板长a
        Two_Section_WidthA:integer;//二区板宽a
        Two_Section_Long_NumberA:integer;//二区板长个数 a
        Two_Section_Width_NumberA:integer;//二区板宽个数 a
        Two_Section_LongB:integer;//二区板长 b
        Two_Section_WidthB:integer;//二区板宽b
        Two_Section_Long_NumberB:integer;//二区板长个数 b
        Two_Section_Width_NumberB:integer;//二区板宽个数 b

        Three_Section_LongA:integer;//三区板长a
        Three_Section_WidthA:integer;//三区板宽a
        Three_Section_Long_NumberA:integer;//三区板长个数 a
        Three_Section_Width_NumberA:integer;//三区板宽个数 a
        Three_Section_LongB:integer;//三区板长 b
        Three_Section_WidthB:integer;//三区板宽b
        Three_Section_Long_NumberB:integer;//三区板长个数 b
        Three_Section_Width_NumberB:integer;//三区板宽个数 b

        Sheet_Long:integer;//大料长
        Sheet_Width:integer;//大料宽
   end;
var
  temS1:Sheet_Size_TwoPNL_1;
  Draw_Data:Draw_Data_1;
  i,j,Long1,Width1,Stat_x,Stat_y,Stat_x1,Stat_y1,End_x,End_y,text_height1,Long2,varx,vary:integer;
  //Tep_PNLA:ARRAY[0..9] OF INTEGER;//
  //Tep_PNLA1:ARRAY[0..9] OF currency;//
  //Tep_PNLAN:ARRAY[0..8] OF INTEGER;
   k:currency; //比率
   x5,y5,x6,y6,x7,y7:integer;
   FlogFont:TlogFont;
   fhfont:hfont;
   function_result:boolean;
   tep_Section: Draw_Sheet_OnePNL_One_Section;
   //tep_Two_Section:Draw_Sheet_TwoPNL_Two_Section;
begin
   Result:=false;
  //Sheet_Size_TwoPNL1数据存放处
  temS1:=Sheet_Size_TwoPNL1;
  {FlogFont.lfStrikeOut:=0;//非删除字体
  FlogFont.lfUnderline:=0;//非下画线
  FlogFont.lfItalic:=0;//非斜体
  FlogFont.lfHeight:=ss1.Font.Height;
  FlogFont.lfWidth:=ss1.Font.Size;
  FlogFont.lfEscapement:=0; //使用FlogFont要引用wintypes单元  字体转90度
  }
  FlogFont.lfStrikeOut:=0;//非删除字体
  FlogFont.lfUnderline:=0;//非下画线
  FlogFont.lfItalic:=0;//非斜体
  FlogFont.lfHeight:=0;//高度,由系统计决定,
  FlogFont.lfWidth:=0;//宽度,由系统计决定,
  FlogFont.lfEscapement:=0; //使用FlogFont要引用wintypes单元  字体转90度
  FlogFont.lfWeight:=fw_dontcare;//字体密度
  FlogFont.lfCharSet:=default_charset;//ansi_charset=0;1;128;255
  FlogFont.lfQuality:=default_quality;//字体质量,proof_quality,draft_quality
  flogFont.lfFaceName:='宋体';//字体的样式名

     fhfont:=createfontindirect(FlogFont);
     ss1.Font.Handle:=fhfont;

   // showmessage(currtostr(Sheet_Size_TwoPNL1.sheet_long));
   //宽比长大将大料料长宽转换  temS1的值变,一区长与宽交换,二区长与宽交换,三区宽与长交换
   {}
   if Sheet_Size_TwoPNL1.sheet_long<Sheet_Size_TwoPNL1.sheet_width then
   begin

      temS1.Sheet_Long:=Sheet_Size_TwoPNL1.sheet_width;
      temS1.Sheet_Width:=Sheet_Size_TwoPNL1.sheet_long;
      temS1.One_PNLA_Long:=Sheet_Size_TwoPNL1.One_PNLA_Width ;
      temS1.One_PNLA_Width:=Sheet_Size_TwoPNL1.One_PNLA_Long ;
      temS1.One_PNLA_Long_Number:=Sheet_Size_TwoPNL1.One_PNLA_Width_Number;
      temS1.One_PNLA_Width_Number:=Sheet_Size_TwoPNL1.One_PNLA_Long_Number;

      temS1.Two_PNLA_Long:=Sheet_Size_TwoPNL1.Three_PNLa_Width;
      temS1.Two_PNLA_Width:=Sheet_Size_TwoPNL1.Three_PNLa_Long ;
      temS1.Two_PNLA_Long_Number:=Sheet_Size_TwoPNL1.Three_PNLa_Width_Number;
      temS1.Two_PNLA_Width_Number:=Sheet_Size_TwoPNL1.Three_PNLa_Long_Number;
      temS1.Two_PNLb_Long:=Sheet_Size_TwoPNL1.Three_PNLb_Width;
      temS1.Two_PNLb_Width:=Sheet_Size_TwoPNL1.Three_PNLb_Long;
      temS1.Two_PNLb_Long_Number:=Sheet_Size_TwoPNL1.Three_PNLb_Width_Number;
      temS1.Two_PNLb_Width_Number:=Sheet_Size_TwoPNL1.Three_PNLb_Long_Number;

     if  Sheet_Size_TwoPNL1.Three_Section_Array_type=1 then
        temS1.Two_Section_Array_type:=2
     else
        temS1.Two_Section_Array_type:=1;

      temS1.Three_PNLA_Long:=Sheet_Size_TwoPNL1.Two_PNLa_Width;
      temS1.Three_PNLA_Width:=Sheet_Size_TwoPNL1.Two_PNLa_Long ;
      temS1.Three_PNLA_Long_Number:=Sheet_Size_TwoPNL1.Two_PNLa_Width_Number;
      temS1.Three_PNLA_Width_Number:=Sheet_Size_TwoPNL1.Two_PNLa_Long_Number;
      temS1.Three_PNLb_Long:=Sheet_Size_TwoPNL1.Two_PNLb_Width;
      temS1.Three_PNLb_Width:=Sheet_Size_TwoPNL1.Two_PNLb_Long;
      temS1.Three_PNLb_Long_Number:=Sheet_Size_TwoPNL1.Two_PNLb_Width_Number;
      temS1.Three_PNLb_Width_Number:=Sheet_Size_TwoPNL1.Two_PNLb_Long_Number;

     if  Sheet_Size_TwoPNL1.Two_Section_Array_type=1 then
         temS1.Three_Section_Array_type:=2
     else
        temS1.Three_Section_Array_type:=1;

     if Sheet_Size_TwoPNL1.Draw_type=1 then
        temS1.Draw_type:=2
     else
        temS1.Draw_type:=1;

   end;
    {}


   text_height1:=ss1.TextHeight('9');//
   Long2:=2*text_height1;//所画图形距边的距离

   Long1:=ss1_Width-2*text_height1;//-ss1.TextHeight('板宽'+currtostr(vsheet_size1.Width2))-20;
   Width1:=ss1_Height-2*text_height1-5;
   Stat_x:=text_height1;
   Stat_y:=Long2;
   //SHOWMESSAGE(CURRTOSTR(vsheet_size1.sheet_width));
   if (temS1.sheet_long=0) or (temS1.sheet_width=0) then
   begin
     showmessage('大料长宽为零!');
     exit;
   end;
   k:=min(Long1/temS1.sheet_long,Width1/temS1.sheet_width);

   Draw_Data.Sheet_Long:=TRUNC(temS1.Sheet_Long*K);//大料长,整数按比例算
   Draw_Data.Sheet_Width:=trunc(temS1.Sheet_Width*K);//大料宽

   Draw_Data.One_Section_Long:=trunc(temS1.One_PNLA_Long*k);//一区板长
   Draw_Data.One_Section_Width:=trunc(temS1.One_PNLA_Width*k);//一区板宽
   ss1.Pen.Width:=2; //线条大小
   ss1.Pen.Color:=clblack;//线条颜色
   End_x:=Stat_x+Draw_Data.sheet_long ;
   End_y:=Stat_y+Draw_Data.sheet_width;
   //画大料图
   ss1.Rectangle(Stat_x,Stat_y,End_x,End_y);
   //一区
   tep_Section.PNLA_Long:=temS1.One_PNLA_Long;
   tep_Section.PNLA_Width:=temS1.One_PNLA_Width;
   tep_Section.PNLA_Long_Number:=temS1.One_PNLA_Long_Number;
   tep_Section.PNLA_Width_Number:=temS1.One_PNLA_Width_Number;
   tep_Section.PNLA_Long_integer:=Draw_Data.One_Section_Long;
   tep_Section.PNLA_Width_integer:=Draw_Data.One_Section_Width;
   function_result:=Draw_Sheet_OnePNL_Section(ss1,Stat_x,Stat_y,tep_Section);//画图,一区PNLA

   x5:=tep_Section.PNLA_Long_integer*tep_Section.PNLA_Long_Number;
   y5:=tep_Section.PNLA_Width_integer*tep_Section.PNLA_Width_Number;

   //function_result:=Draw_Sheet_OnePNL_Picture_One_Section(ss1,Stat_x,Stat_y,tep_Section);
   //二区
   Draw_Data.Two_Section_LongA :=trunc(temS1.Two_PNLA_Long*k);//二区板长
   Draw_Data.Two_Section_WidthA :=trunc(temS1.Two_PNLA_Width*k);//二区板宽
   tep_Section.PNLA_Long:=temS1.Two_PNLA_Long ;
   tep_Section.PNLA_Width:=temS1.Two_PNLA_Width ;
   tep_Section.PNLA_Long_Number:=temS1.Two_PNLA_Long_Number ;
   tep_Section.PNLA_Width_Number:=temS1.Two_PNLA_Width_Number ;
   tep_Section.PNLA_Long_integer:=Draw_Data.Two_Section_LongA;
   tep_Section.PNLA_Width_integer:=Draw_Data.Two_Section_WidthA;

   function_result:=Draw_Sheet_OnePNL_Section(ss1,Stat_x+x5,Stat_y,tep_Section); //画图,二区PNLA


   x6:=tep_Section.PNLA_Long_Number*tep_Section.PNLA_Long_integer;
   y6:=tep_Section.PNLA_Width_Number*tep_Section.PNLA_Width_integer;
   Draw_Data.Two_Section_Longb :=trunc(temS1.Two_PNLb_Long*k);//二区板长
   Draw_Data.Two_Section_Widthb :=trunc(temS1.Two_PNLb_Width*k);//二区板宽
   tep_Section.PNLa_Long:=temS1.Two_PNLb_Long ;
   tep_Section.PNLa_Width:=temS1.Two_PNLb_Width ;
   tep_Section.PNLA_Long_Number:=temS1.Two_PNLb_Long_Number ;
   tep_Section.PNLA_Width_Number:=temS1.Two_PNLb_Width_Number ;
   tep_Section.PNLA_Long_integer:=Draw_Data.Two_Section_LongB ;
   tep_Section.PNLA_Width_integer:=Draw_Data.Two_Section_WidthB ;
   //  showmessage(inttostr(temS1.Two_Section_Array_type));
//     showmessage(currtostr(Sheet_Size_TwoPNL1.Two_PNLa_Long ));
    if temS1.Two_Section_Array_type=1 then
    begin  //
      function_result:=Draw_Sheet_OnePNL_Section(ss1,Stat_x+x5,Stat_y+y6,tep_Section); //画图,二区PNLB
    end else //if temS1.Two_Section_Array_type=2 then
    begin  //
        function_result:=Draw_Sheet_OnePNL_Section(ss1,Stat_x+x5+x6,Stat_y,tep_Section); //画图,二区PNLB
       //function_result:=Draw_Sheet_OnePNL_Section_change_pnlapnlb(ss1,Stat_x+x5,Stat_y+y6,tep_Section); //画图,二区PNLB
    end;
   //三区
   Draw_Data.Three_Section_LongA :=trunc(temS1.Three_PNLA_Long*k);//三区板长
   Draw_Data.Three_Section_WidthA :=trunc(temS1.Three_PNLA_Width*k);//三区板宽
   tep_Section.PNLA_Long:=temS1.Three_PNLA_Long ;
   tep_Section.PNLA_Width:=temS1.Three_PNLA_Width ;
   tep_Section.PNLA_Long_Number:=temS1.Three_PNLA_Long_Number ;
   tep_Section.PNLA_Width_Number:=temS1.Three_PNLA_Width_Number ;
   tep_Section.PNLA_Long_integer:=Draw_Data.Three_Section_LongA ;
   tep_Section.PNLA_Width_integer:=Draw_Data.Three_Section_WidthA ;

   function_result:=Draw_Sheet_OnePNL_Section(ss1,Stat_x,Stat_y+y5,tep_Section); //画图,三区PNLA
   x7:=tep_Section.PNLA_Long_Number*tep_Section.PNLA_Long_integer;
   y7:=tep_Section.PNLA_Width_Number*tep_Section.PNLA_Width_integer;

   Draw_Data.Three_Section_LongB:=trunc(temS1.Three_PNLb_Long*k);//三区板长
   Draw_Data.Three_Section_Widthb :=trunc(temS1.Three_PNLb_Width*k);//三区板宽
   tep_Section.PNLA_Long:=temS1.Three_PNLb_Long ;
   tep_Section.PNLA_Width:=temS1.Three_PNLb_Width ;
   tep_Section.PNLA_Long_Number:=temS1.Three_PNLb_Long_Number ;
   tep_Section.PNLA_Width_Number:=temS1.Three_PNLb_Width_Number ;
   tep_Section.PNLA_Long_integer:=Draw_Data.Three_Section_LongB;
   tep_Section.PNLA_Width_integer:=Draw_Data.Three_Section_Widthb ;

    if temS1.Three_Section_Array_type=1 then
    begin
       function_result:=Draw_Sheet_OnePNL_Section(ss1,Stat_x,Stat_y+y5+y7,tep_Section); //画图,三区PNLB
    end else
    begin
       function_result:=Draw_Sheet_OnePNL_Section(ss1,Stat_x+x7,Stat_y+y5,tep_Section); //画图,三区PNLB
    end;


     //用于画一二三区的分界线
   if  temS1.Draw_type=2 then
   begin
     ss1.Pen.Color:=clred;
     ss1.MoveTo(Stat_x,Stat_y+y5);
     ss1.LineTo(end_x,Stat_y+y5);
     ss1.MoveTo(Stat_x+x5,Stat_y);
     ss1.LineTo(Stat_x+x5,Stat_y+y5);
     ss1.Pen.Color:=clblack;
   end else
   begin
     ss1.Pen.Color:=clred;
     ss1.MoveTo(Stat_x+x5,Stat_y);//画竖线
     ss1.LineTo(Stat_x+x5,end_y);
     ss1.MoveTo(Stat_x,Stat_y+y5);//画竖线
     ss1.LineTo(Stat_x+x5,Stat_y+y5);
     ss1.Pen.Color:=clblack;
   end;

     FlogFont.lfStrikeOut:=0;//非删除字体
     FlogFont.lfUnderline:=0;//非下画线
     FlogFont.lfItalic:=0;//非斜体
     FlogFont.lfHeight:=ss1.Font.Height;
     FlogFont.lfWidth:=ss1.Font.Size;
     FlogFont.lfEscapement:=0; //使用FlogFont要引用wintypes单元  字体转90度
     fhfont:=createfontindirect(FlogFont);
     ss1.Font.Handle:=fhfont;

     ss1.MoveTo(stat_x,stat_y);    //竖线
     ss1.LineTo(stat_x,stat_y-text_height1);//竖线
     ss1.MoveTo(end_x,stat_y);    //竖线
     ss1.LineTo(end_x,stat_y-text_height1);//竖线

     ss1.MoveTo(stat_x,stat_y-trunc(0.5*text_height1)); //横线
     ss1.LineTo(end_x,stat_y-trunc(0.5*text_height1));//横线

     ss1.MoveTo(stat_x,stat_y-trunc(0.5*text_height1));    // 箭头
     ss1.lineTo(stat_x+10,stat_y-trunc(0.5*text_height1)+5);    // 箭头
     ss1.MoveTo(stat_x,stat_y-trunc(0.5*text_height1));   // 箭头
     ss1.lineTo(stat_x+10,stat_y-trunc(0.5*text_height1)-5);    // 箭头
     ss1.moveTo(end_x,stat_y-trunc(0.5*text_height1)); // 箭头
     ss1.LineTo(end_x-10,stat_y-trunc(0.5*text_height1)+5); // 箭头
     ss1.moveTo(end_x,stat_y-trunc(0.5*text_height1));  // 箭头
     ss1.LineTo(end_x-10,stat_y-trunc(0.5*text_height1)-5);  // 箭头



     ss1.TextOut(trunc((end_x-stat_x-ss1.TextWidth(currtostr(temS1.Sheet_Long)))/2),stat_y-trunc(text_height1)-2,currtostr(temS1.Sheet_Long));//

     //FlogFont.lfStrikeOut:=0;//非删除字体
    // FlogFont.lfUnderline:=0;//非下画线
    // FlogFont.lfItalic:=0;//非斜体
     //FlogFont.lfHeight:=ss1.Font.Height;
    // FlogFont.lfWidth:=ss1.Font.Size;
     FlogFont.lfEscapement:=-900; //使用FlogFont要引用wintypes单元  字体转90度
     fhfont:=createfontindirect(FlogFont);
     ss1.Font.Handle:=fhfont;

     ss1.MoveTo(end_x,stat_y);    //横线
     ss1.LineTo(end_x+text_height1,stat_y); //横线

     ss1.MoveTo(end_x,end_y);    //横线
     ss1.LineTo(end_x+text_height1,end_y); //横线

     ss1.MoveTo(end_x+trunc(0.5*text_height1),stat_y); //竖线
     ss1.LineTo(end_x+trunc(0.5*text_height1),end_y); //竖线


     ss1.MoveTo(end_x+trunc(0.5*text_height1),stat_y); //箭头
     ss1.lineTo(end_x+trunc(0.5*text_height1)-5,stat_y+10); //箭头
     ss1.MoveTo(end_x+trunc(0.5*text_height1),stat_y); //箭头
     ss1.lineTo(end_x+trunc(0.5*text_height1)+5,stat_y+10); //箭头
     ss1.moveTo(end_x+trunc(0.5*text_height1),end_y);  //箭头
     ss1.LineTo(end_x+trunc(0.5*text_height1)-5,end_y-10);  //箭头
     ss1.moveTo(end_x+trunc(0.5*text_height1),end_y);  //箭头
     ss1.LineTo(end_x+trunc(0.5*text_height1)+5,end_y-10);  //箭头

     ss1.TextOut(end_x+2+trunc(text_height1),trunc((end_y-stat_y-ss1.TextWidth(currtostr(temS1.Sheet_width)))/2),currtostr(temS1.Sheet_width));//

     //FlogFont.lfStrikeOut:=0;//非删除字体
     //FlogFont.lfUnderline:=0;//非下画线
     //FlogFont.lfItalic:=0;//非斜体
     //FlogFont.lfHeight:=ss1.Font.Height;
     //FlogFont.lfWidth:=ss1.Font.Size;
     FlogFont.lfEscapement:=0; //使用FlogFont要引用wintypes单元  字体转90度
     fhfont:=createfontindirect(FlogFont);
     ss1.Font.Handle:=fhfont;

    // FreeAndNil(fhfont);

   Result:=true;


end;

function TDraw_Picture.Draw_Sheet_OnePNL_Picture_One_Section(ss2: TCanvas;
  v_Start_X, v_Start_Y: integer;
  v_Section: Draw_Sheet_OnePNL_One_Section): boolean;//用于画只有一种PNL,的开料图
var
 i,textheight1,x1,y1,x2,y2:integer;
 FlogFont:TlogFont;
 fhfont:hfont;
begin
   Result:=false;
   FlogFont.lfStrikeOut:=0;//非删除字体
     FlogFont.lfUnderline:=0;//非下画线
     FlogFont.lfItalic:=0;//非斜体
     FlogFont.lfHeight:=0;//高度,由系统计决定,
     FlogFont.lfWidth:=0;//宽度,由系统计决定,
     FlogFont.lfEscapement:=0; //使用FlogFont要引用wintypes单元  字体转90度
     FlogFont.lfWeight:=fw_dontcare;//字体密度
     FlogFont.lfCharSet:=default_charset;//ansi_charset=0;1;128;255
     FlogFont.lfQuality:=default_quality;//字体质量,proof_quality,draft_quality
     FlogFont.lfFaceName:='宋体';//字体的样式名

   if (v_Section.PNLA_Long_Number>=1) and (v_Section.PNLA_Width_Number>=1) then
   begin
     //showmessage(inttostr(v_Section.PNLA_Width_integer ));
     textheight1:=ss2.TextHeight('宽');
     //ss2.MoveTo(0,0);
     //ss2.LineTo(v_Start_X,v_Start_Y);
     ss2.Pen.Width:=1;
     for i:=0 to v_Section.PNLA_Long_Number do //画竖线
     begin
       ss2.MoveTo(v_Start_X+i*v_Section.PNLA_Long_integer ,v_Start_Y);
       ss2.LineTo(v_Start_X+i*v_Section.PNLA_Long_integer ,v_Start_Y+v_Section.PNLA_Width_Number*v_Section.PNLA_Width_integer);
     end;
     for i:=0 to v_Section.PNLA_Width_Number do //画横线
     begin
        ss2.MoveTo(v_Start_X,v_Start_Y+i*v_Section.PNLA_Width_integer );
        ss2.LineTo(v_Start_X+v_Section.PNLA_Long_Number*v_Section.PNLA_Long_integer ,v_Start_Y+i*v_Section.PNLA_Width_integer );

     end;
     //标注尺寸
     x1:=v_Start_X;
     x2:=v_Start_X;
     y1:=v_Start_Y;
     y2:=v_Start_Y-textheight1;
     ss2.MoveTo(x1,y1);
     ss2.LineTo(x2,y2);
     x2:=x2+2;
     y2:=y2-2;


     //FlogFont.lfStrikeOut:=0;//非删除字体
     //FlogFont.lfUnderline:=0;//非下画线
     //FlogFont.lfItalic:=0;//非斜体
     //FlogFont.lfHeight:=ss2.Font.Height;
     //FlogFont.lfWidth:=ss2.Font.Size;
     FlogFont.lfEscapement:=0; //使用FlogFont要引用wintypes单元  字体转90度
     fhfont:=createfontindirect(FlogFont);
     ss2.Font.Handle:=fhfont;


     ss2.TextOut(x2,y2,currtostr(v_Section.PNLA_Long)+'X'+inttostr(v_Section.PNLA_Long_Number));
     x1:=v_Start_X+v_Section.PNLA_Long_Number*v_Section.PNLA_Long_integer;
     x2:=v_Start_X+v_Section.PNLA_Long_Number*v_Section.PNLA_Long_integer;
     y1:=v_Start_Y;
     y2:=v_Start_Y-textheight1;
     ss2.MoveTo(x1,y1);
     ss2.LineTo(x2,y2);



     //FlogFont.lfStrikeOut:=0;//非删除字体
     //FlogFont.lfUnderline:=0;//非下画线
     //FlogFont.lfItalic:=0;//非斜体
     //FlogFont.lfHeight:=ss2.Font.Height;
     //FlogFont.lfWidth:=ss2.Font.Size;
     FlogFont.lfEscapement:=900; //使用FlogFont要引用wintypes单元  字体转90度
     fhfont:=createfontindirect(FlogFont);
     ss2.Font.Handle:=fhfont;

     x1:=v_Start_X;
     x2:=v_Start_X-textheight1;
     y1:=v_Start_Y;
     y2:=v_Start_Y;
     ss2.MoveTo(x1,y1);
     ss2.LineTo(x2,y2);
     x2:=x2-2;
     y2:=y2-2+v_Section.PNLA_Width_Number*v_Section.PNLA_Width_integer;
     ss2.TextOut(x2,y2,currtostr(v_Section.PNLA_Width )+'X'+inttostr(v_Section.PNLA_Width_Number ));
     x1:=v_Start_X;
     x2:=v_Start_X-textheight1;
     y1:=v_Start_Y+v_Section.PNLA_Width_Number*v_Section.PNLA_Width_integer;
     y2:=v_Start_Y+v_Section.PNLA_Width_Number*v_Section.PNLA_Width_integer;
     ss2.MoveTo(x1,y1);
     ss2.LineTo(x2,y2);

     //FlogFont.lfStrikeOut:=0;//非删除字体
     //FlogFont.lfUnderline:=0;//非下画线
     //FlogFont.lfItalic:=0;//非斜体
     //FlogFont.lfHeight:=ss2.Font.Height;
     //FlogFont.lfWidth:=ss2.Font.Size;
     FlogFont.lfEscapement:=0; //使用FlogFont要引用wintypes单元  字体转90度
     fhfont:=createfontindirect(FlogFont);
     ss2.Font.Handle:=fhfont;


   end;

end;

function TDraw_Picture.Draw_Sheet_OnePNL_Section(ss2: TCanvas; v_Start_X,
  v_Start_Y: integer; v_Section: Draw_Sheet_OnePNL_One_Section): boolean; //尺寸标于PNL内
var
 i,j,textheight1,x1,y1:integer;
 FlogFont:TlogFont;
 fhfont:hfont;
begin
   Result:=false;

   if (v_Section.PNLA_Long_Number>=1) and (v_Section.PNLA_Width_Number>=1) then
   begin
     //showmessage(inttostr(v_Section.PNLA_Width_integer ));

     //ss2.MoveTo(0,0);
     //ss2.LineTo(v_Start_X,v_Start_Y);
     {
     FlogFont.lfStrikeOut:=0;//非删除字体
            FlogFont.lfUnderline:=0;//非下画线
            FlogFont.lfItalic:=0;//非斜体
            FlogFont.lfHeight:=ss2.Font.Height;
            FlogFont.lfWidth:=ss2.Font.Size;
            FlogFont.lfEscapement:=0; //使用FlogFont要引用wintypes单元  字体转90度
     }
     FlogFont.lfStrikeOut:=0;//非删除字体
     FlogFont.lfUnderline:=0;//非下画线
     FlogFont.lfItalic:=0;//非斜体
     FlogFont.lfHeight:=0;//高度,由系统计决定,
     FlogFont.lfWidth:=0;//宽度,由系统计决定,
     FlogFont.lfEscapement:=0; //使用FlogFont要引用wintypes单元  字体转90度
     FlogFont.lfWeight:=fw_dontcare;//字体密度
     FlogFont.lfCharSet:=default_charset;//ansi_charset=0;1;128;255
     FlogFont.lfQuality:=default_quality;//字体质量,proof_quality,draft_quality
     FlogFont.lfFaceName:='宋体';//字体的样式名

            fhfont:=createfontindirect(FlogFont);
            ss2.Font.Handle:=fhfont;

            textheight1:=ss2.TextHeight('宽');
     ss2.Pen.Width:=1;
     for i:=0 to v_Section.PNLA_Long_Number do //画竖线
     begin
       ss2.MoveTo(v_Start_X+i*v_Section.PNLA_Long_integer ,v_Start_Y);
       ss2.LineTo(v_Start_X+i*v_Section.PNLA_Long_integer ,v_Start_Y+v_Section.PNLA_Width_Number*v_Section.PNLA_Width_integer);
     end;
     for i:=0 to v_Section.PNLA_Width_Number do //画横线
     begin
        ss2.MoveTo(v_Start_X,v_Start_Y+i*v_Section.PNLA_Width_integer );
        ss2.LineTo(v_Start_X+v_Section.PNLA_Long_Number*v_Section.PNLA_Long_integer ,v_Start_Y+i*v_Section.PNLA_Width_integer );


     end;


     for i:=0 to v_Section.PNLA_Long_Number-1 do
     begin
         for j:=0 to v_Section.PNLA_Width_Number-1 do
         begin

            //FlogFont.lfStrikeOut:=0;//非删除字体
            //FlogFont.lfUnderline:=0;//非下画线
            //FlogFont.lfItalic:=0;//非斜体
            //FlogFont.lfHeight:=ss2.Font.Height;
            //FlogFont.lfWidth:=ss2.Font.Size;
            FlogFont.lfEscapement:=0; //使用FlogFont要引用wintypes单元  字体转90度
            fhfont:=createfontindirect(FlogFont);
            ss2.Font.Handle:=fhfont;                              //v_Section.PNLA_Long

            if v_Section.PNLA_Long_integer>=ss2.TextWidth(currtostr(v_Section.PNLA_Long)) then
            begin
               x1:=v_Start_X+i*v_Section.PNLA_Long_integer+2+ trunc((v_Section.PNLA_Long_integer-ss2.TextWidth(currtostr(v_Section.PNLA_Long)))/2);
            end else
            begin
              x1:=v_Start_X+i*v_Section.PNLA_Long_integer+2;
            end;
            y1:=v_Start_Y+2+j*v_Section.PNLA_Width_integer ;
            ss2.TextOut(x1,y1,currtostr(v_Section.PNLA_Long));//+'X'+inttostr(v_Section.PNLA_Long_Number));
            if v_Section.PNLA_Width_integer-textheight1-2<=ss2.TextWidth(currtostr(v_Section.PNLA_Width )) then
            begin
               x1:=v_Start_X+i*v_Section.PNLA_Long_integer+2 ;
               y1:=v_Start_Y+textheight1+2+j*v_Section.PNLA_Width_integer ;
               ss2.TextOut(x1,y1,currtostr(v_Section.PNLA_Width ));//+'X'+inttostr(v_Section.PNLA_Width_Number ));
            end  else
            begin
               //FlogFont.lfStrikeOut:=0;//非删除字体
               //FlogFont.lfUnderline:=0;//非下画线
               //FlogFont.lfItalic:=0;//非斜体
               //FlogFont.lfHeight:=ss2.Font.Height;
               //FlogFont.lfWidth:=ss2.Font.Size;
               FlogFont.lfEscapement:=-900; //使用FlogFont要引用wintypes单元  字体转90度
               fhfont:=createfontindirect(FlogFont);
               ss2.Font.Handle:=fhfont;

                 x1:=v_Start_X+i*v_Section.PNLA_Long_integer+2+textheight1 ;
                 if v_Section.PNLA_Width_integer-2*textheight1-2>=ss2.TextWidth(currtostr(v_Section.PNLA_Width )) then
                 begin
                   y1:=v_Start_Y+trunc((v_Section.PNLA_Width_integer-ss2.TextWidth(currtostr(v_Section.PNLA_Width ))-textheight1)/2)+2+j*v_Section.PNLA_Width_integer;
                 end else
                 begin
                   y1:=v_Start_Y+textheight1+2+j*v_Section.PNLA_Width_integer;
                 end;
                 //y1:=v_Start_Y+textheight1+2+j*v_Section.PNLA_Width_integer ;
                ss2.TextOut(x1,y1,currtostr(v_Section.PNLA_Width ));//+'X'+inttostr(v_Section.PNLA_Width_Number ));
            end;
         end;
     end;
     {
     FlogFont.lfStrikeOut:=0;//非删除字体
     FlogFont.lfUnderline:=0;//非下画线
     FlogFont.lfItalic:=0;//非斜体
     FlogFont.lfHeight:=ss2.Font.Height;
     FlogFont.lfWidth:=ss2.Font.Size;
     FlogFont.lfEscapement:=0; //使用FlogFont要引用wintypes单元  字体转90度
     fhfont:=createfontindirect(FlogFont);
     ss2.Font.Handle:=fhfont;
      }

   end;


end;

function TDraw_Picture.Draw_Sheet_Picture(ss1: TCanvas;ss1_width,ss1_height:integer): boolean;
type
  Sheet_pnl2=record
      Long1:integer;//一区PNL长
      Width1:integer;//一区PNL宽
      Long2:integer;//二区PNL长
      Width2:integer;//二区PNL宽
      Long3:integer;//三区PNL长
      Width3:integer;//三区PNL宽
      sheet_long:integer; //余料长
      sheet_width:integer;//余料宽
  end;
var
   i,j,Long1,Width1,Stat_x,Stat_y,Stat_x1,Stat_y1,End_x,End_y,text_height1,Long2,varx,vary:integer;
   Tep_PNLA:ARRAY[0..9] OF INTEGER;//
   Tep_PNLA1:ARRAY[0..9] OF currency;//
   Tep_PNLAN:ARRAY[0..8] OF INTEGER;
   k:currency; //比率
   vsheet_size1:sheet_size;//
   Sheet_pnl3:Sheet_pnl2;
   FlogFont:TlogFont;
   fhfont:hfont;
begin

   vsheet_size1.Long1 :=sheet_size1.Long1 ;
   vsheet_size1.Width1  :=sheet_size1.Width1  ;
   vsheet_size1.Long1_number  :=sheet_size1.Long1_number   ;
   vsheet_size1.Width1_number :=sheet_size1.Width1_number  ;
   vsheet_size1.Long2:=sheet_size1.Long2 ;
   vsheet_size1.Width2:=sheet_size1.Width2  ;
   vsheet_size1.Long2_number:=sheet_size1.Long2_number   ;
   vsheet_size1.Width2_number:=sheet_size1.Width2_number  ;
   vsheet_size1.Long3 :=sheet_size1.Long3;
   vsheet_size1.Width3  :=sheet_size1.Width3;
   vsheet_size1.Long3_number  :=sheet_size1.Long3_number   ;
   vsheet_size1.Width3_number :=sheet_size1.Width3_number  ;
   vsheet_size1.sheet_long  :=sheet_size1.sheet_long ;
   vsheet_size1.sheet_width  :=sheet_size1.sheet_width  ;

   //将余料长宽转换
   if vsheet_size1.sheet_long <vsheet_size1.sheet_width then
   begin
     vsheet_size1.Long1:=sheet_size1.Width1;
     vsheet_size1.Width1:=sheet_size1.Long1;
     vsheet_size1.Long1_number :=sheet_size1.Width1_number ;
     vsheet_size1.Width1_number :=sheet_size1.Long1_number ;
     vsheet_size1.Long2:=sheet_size1.Width3;
     vsheet_size1.Width2:=sheet_size1.Long3;
     vsheet_size1.Long2_number :=sheet_size1.Width3_number ;
     vsheet_size1.Width2_number :=sheet_size1.Long3_number ;
     vsheet_size1.Long3:=sheet_size1.Width2;
     vsheet_size1.Width3:=sheet_size1.Long2;
     vsheet_size1.Long3_number :=sheet_size1.Width2_number ;
     vsheet_size1.Width3_number :=sheet_size1.Long2_number ;
     vsheet_size1.sheet_long :=sheet_size1.sheet_width ;
     vsheet_size1.sheet_width :=sheet_size1.sheet_long ;
   end;

   text_height1:=ss1.TextHeight('9');//
   Long2:=5* text_height1;//所画图形距边的距离

   Long1:=ss1_Width-10*text_height1;//-ss1.TextHeight('板宽'+currtostr(vsheet_size1.Width2))-20;
   Width1:=ss1_Height-8*text_height1;
   Stat_x:=3*text_height1;
   Stat_y:=Long2;
   //SHOWMESSAGE(CURRTOSTR(vsheet_size1.sheet_width));
   k:=min(Long1/vsheet_size1.sheet_long,Width1/vsheet_size1.sheet_width);

   Sheet_pnl3.Long1:=trunc(k*vsheet_size1.Long1);
   Sheet_pnl3.Width1 :=trunc(k*vsheet_size1.Width1 );
   Sheet_pnl3.Long2:=trunc(k*vsheet_size1.Long2);
   Sheet_pnl3.Width2 :=trunc(k*vsheet_size1.Width2 );
   Sheet_pnl3.Long3:=trunc(k*vsheet_size1.Long3);
   Sheet_pnl3.Width3 :=trunc(k*vsheet_size1.Width3 );
   Sheet_pnl3.sheet_long :=trunc(k*vsheet_size1.sheet_long );
   Sheet_pnl3.sheet_width :=trunc(k*vsheet_size1.sheet_width );
   ss1.Pen.Width:=2;
   ss1.Pen.Color:=clblack;
   End_x:=Stat_x+Sheet_pnl3.sheet_long ;
   End_y:=Stat_y+Sheet_pnl3.sheet_width;
   //画大料图
   ss1.Rectangle(Stat_x,Stat_y,End_x,End_y);
   //一区
   for i:=1 to vsheet_size1.Long1_number-1  do  //坚线
   begin
      ss1.MoveTo(Stat_x+Sheet_pnl3.Long1*i,Stat_y);
      ss1.LineTo(Stat_x+Sheet_pnl3.Long1*i,Stat_y+Sheet_pnl3.Width1*vsheet_size1.Width1_number);
   end;
   for i:=1 to vsheet_size1.Width1_number -1  do   //横线
   begin
      ss1.MoveTo(Stat_x,Stat_y+Sheet_pnl3.Width1*i);
      ss1.LineTo(Stat_x+Sheet_pnl3.Long1*vsheet_size1.Long1_number,Stat_y+Sheet_pnl3.Width1*i);
   end;
   {
   ss1.Pen.Color:=clred;
   ss1.MoveTo(Stat_x+Sheet_pnl3.Long1*vsheet_size1.Long1_number ,Stat_y);//竖线
   ss1.LineTo(Stat_x+Sheet_pnl3.Long1*vsheet_size1.Long1_number ,Stat_y+vsheet_size1.Width1_number*Sheet_pnl3.Width1);//竖线//Stat_y+Sheet_pnl3.Width1*vsheet_size1.Width1_number);
   ss1.MoveTo(Stat_x,Stat_y+Sheet_pnl3.Width1*vsheet_size1.Width1_number );//横线
   ss1.LineTo(Stat_x+Sheet_pnl3.Long1*vsheet_size1.Long1_number,Stat_y+Sheet_pnl3.Width1*vsheet_size1.Width1_number);
   ss1.Pen.Color:=clblack;
   }
   //一区尺寸标注
   //标注pnl板长
   ss1.Pen.Width:=1;
   ss1.MoveTo(Stat_x,Stat_y);  //竖线
   ss1.LineTo(Stat_x,Stat_y-4*text_height1);  //竖线
   ss1.MoveTo(Stat_x+Sheet_pnl3.Long1*vsheet_size1.Long1_number,Stat_y);  //坚线
   ss1.LineTo(Stat_x+Sheet_pnl3.Long1*vsheet_size1.Long1_number,Stat_y-2*text_height1);  //坚线
   ss1.MoveTo(Stat_x,Stat_y-2*text_height1);   //横线
   ss1.LineTo(Stat_x+Sheet_pnl3.Long1*vsheet_size1.Long1_number,Stat_y-2*text_height1);   //横线
   varx:=Stat_x+trunc((Sheet_pnl3.Long1*vsheet_size1.Long1_number-ss1.TextWidth('板长:'+currtostr(vsheet_size1.Long1)+'X'+inttostr(vsheet_size1.Long1_number)))/2);
   vary:=stat_y-3*text_height1;
   ss1.TextOut(varx,vary,'板长:'+currtostr(vsheet_size1.Long1)+'X'+inttostr(vsheet_size1.Long1_number));//标注PNL长与个数

   // 标注余料长SHEET
   ss1.MoveTo(End_x,Stat_y);  //竖线
   ss1.LineTo(End_x,Stat_y-4*text_height1);  //竖线
   ss1.MoveTo(Stat_x,Stat_y-3*text_height1-2);   //横线
   ss1.LineTo(End_x,Stat_y-3*text_height1-2);   //横线
   varx:=Stat_x+trunc((Sheet_pnl3.sheet_long-ss1.TextWidth('余料长:'+currtostr(vsheet_size1.sheet_long)))/2);
   vary:=stat_y-4*text_height1-4;
   ss1.TextOut(varx,vary,'余料长:'+currtostr(vsheet_size1.sheet_long ));//标注余料长

   //标注板宽pnl
   FlogFont.lfStrikeOut:=0;//非删除字体
     FlogFont.lfUnderline:=0;//非下画线
     FlogFont.lfItalic:=0;//非斜体
     FlogFont.lfHeight:=0;//高度,由系统计决定,
     FlogFont.lfWidth:=0;//宽度,由系统计决定,
     FlogFont.lfEscapement:=0; //使用FlogFont要引用wintypes单元  字体转90度
     FlogFont.lfWeight:=fw_dontcare;//字体密度
     FlogFont.lfCharSet:=default_charset;//ansi_charset=0;1;128;255
     FlogFont.lfQuality:=default_quality;//字体质量,proof_quality,draft_quality
     FlogFont.lfFaceName:='宋体';//字体的样式名

   FlogFont.lfEscapement:=900; //使用FlogFont要引用wintypes单元  字体转90度
   fhfont:=createfontindirect(FlogFont);
   ss1.Font.Handle:=fhfont;

   ss1.MoveTo(Stat_x,Stat_y);  //横线
   ss1.LineTo(Stat_x-2*text_height1,Stat_y);  //横线
   ss1.MoveTo(Stat_x,Stat_y+Sheet_pnl3.Width1 *vsheet_size1.Width1_number);  //横线
   ss1.LineTo(Stat_x-2*text_height1 ,Stat_y+Sheet_pnl3.Width1 *vsheet_size1.Width1_number);  //横线
   ss1.MoveTo(Stat_x-text_height1,Stat_y);   //竖线
   ss1.LineTo(Stat_x-text_height1,Stat_y+Sheet_pnl3.Width1 *vsheet_size1.Width1_number);   //竖线
   varx:=Stat_x-2*text_height1-5;
   vary:=stat_y+Sheet_pnl3.Width1 *vsheet_size1.Width1_number -trunc((Sheet_pnl3.Width1 *vsheet_size1.Width1_number -ss1.TextWidth('板宽:'+currtostr(vsheet_size1.Width1 )+'X'+inttostr(vsheet_size1.Width1_number )))/2);
   ss1.TextOut(varx,vary,'板宽:'+currtostr(vsheet_size1.Width1 )+'X'+inttostr(vsheet_size1.Width1_number ));//标注PNL长与个数
   //标注余料宽
   FlogFont.lfEscapement:=-900; //使用FlogFont要引用wintypes单元  字体转90度
   fhfont:=createfontindirect(FlogFont);
   ss1.Font.Handle:=fhfont;

   ss1.MoveTo(end_x,Stat_y);  //横线
   ss1.LineTo(end_x+4*text_height1,Stat_y);  //横线
   ss1.MoveTo(end_x,Stat_y+Sheet_pnl3.sheet_width );  //横线
   ss1.LineTo(end_x+4*text_height1 ,Stat_y+Sheet_pnl3.sheet_width);  //横线
   ss1.MoveTo(end_x+3*text_height1,Stat_y);   //竖线
   ss1.LineTo(end_x+3*text_height1,Stat_y+Sheet_pnl3.sheet_width);   //竖线
   varx:=end_x+4*text_height1+8;
   vary:=stat_y+trunc((Sheet_pnl3.sheet_width -ss1.TextWidth('余料宽:'+currtostr(vsheet_size1.sheet_width )))/2);
   ss1.TextOut(varx,vary,'余料宽:'+currtostr(vsheet_size1.sheet_width ));//标注PNL长与个数



   FlogFont.lfEscapement:=0; //使用FlogFont要引用wintypes单元  字体转0度
   fhfont:=createfontindirect(FlogFont);
   ss1.Font.Handle:=fhfont;


   if (Sheet_pnl3.Long2>0) or (Sheet_pnl3.Width2>0) then
   begin
     ss1.Pen.Width:=2;
     //二区,在一区的X上加上一区的内容
      for i:=0 to vsheet_size1.Long2_number-1  do  //坚线
      begin
        ss1.MoveTo(Stat_x+Sheet_pnl3.Long1*vsheet_size1.Long1_number+Sheet_pnl3.Long2*i,Stat_y);
        ss1.LineTo(Stat_x+Sheet_pnl3.Long1*vsheet_size1.Long1_number+Sheet_pnl3.Long2*i,Stat_y+Sheet_pnl3.Width2*vsheet_size1.Width2_number);
      end;
      for i:=0 to vsheet_size1.Width2_number -1  do   //横线
      begin
        ss1.MoveTo(Stat_x+Sheet_pnl3.Long1*vsheet_size1.Long1_number,Stat_y+Sheet_pnl3.Width2*i);
        ss1.LineTo(Stat_x+Sheet_pnl3.Long1*vsheet_size1.Long1_number+Sheet_pnl3.Long2*vsheet_size1.Long2_number,Stat_y+Sheet_pnl3.Width2*i);
      end;
      ss1.Pen.Color:=clred;
      ss1.MoveTo(Stat_x+Sheet_pnl3.Long1*vsheet_size1.Long1_number+Sheet_pnl3.Long2*vsheet_size1.Long2_number ,Stat_y);
      ss1.LineTo(Stat_x+Sheet_pnl3.Long1*vsheet_size1.Long1_number+Sheet_pnl3.Long2*vsheet_size1.Long2_number ,Stat_y+Sheet_pnl3.Width2*vsheet_size1.Width2_number);
      ss1.MoveTo(Stat_x+Sheet_pnl3.Long1*vsheet_size1.Long1_number,Stat_y+Sheet_pnl3.Width2*vsheet_size1.Width2_number );
      ss1.LineTo(Stat_x+Sheet_pnl3.Long1*vsheet_size1.Long1_number+Sheet_pnl3.Long2*vsheet_size1.Long2_number,Stat_y+Sheet_pnl3.Width2*vsheet_size1.Width2_number);
      ss1.Pen.Color:=clblack;
      ss1.Pen.Width:=1;
      //二区尺寸标注
      //标注pnl2板长
      ss1.MoveTo(Stat_x+Sheet_pnl3.Long1*vsheet_size1.Long1_number,Stat_y);  //竖线
      ss1.LineTo(Stat_x+Sheet_pnl3.Long1*vsheet_size1.Long1_number,Stat_y-text_height1);  //竖线
      ss1.MoveTo(Stat_x+Sheet_pnl3.Long1*vsheet_size1.Long1_number +Sheet_pnl3.Long2*vsheet_size1.Long2_number,Stat_y);  //坚线
      ss1.LineTo(Stat_x+Sheet_pnl3.Long1*vsheet_size1.Long1_number +Sheet_pnl3.Long2*vsheet_size1.Long2_number,Stat_y-text_height1);  //坚线
      ss1.MoveTo(Stat_x+Sheet_pnl3.Long1*vsheet_size1.Long1_number,Stat_y-text_height1);   //横线
      ss1.LineTo(Stat_x+Sheet_pnl3.Long1*vsheet_size1.Long1_number +Sheet_pnl3.Long2*vsheet_size1.Long2_number,Stat_y-text_height1);   //横线
      varx:=Stat_x+Sheet_pnl3.Long1*vsheet_size1.Long1_number+trunc((Sheet_pnl3.Long2*vsheet_size1.Long2_number-ss1.TextWidth('板长:'+currtostr(vsheet_size1.Long2)+'X'+inttostr(vsheet_size1.Long2_number)))/2);
      vary:=stat_y-2*text_height1-5;
      ss1.TextOut(varx,vary,'板长:'+currtostr(vsheet_size1.Long2)+'X'+inttostr(vsheet_size1.Long2_number));//标注PNL长与个数

      //二区标注板宽pnl
      FlogFont.lfEscapement:=-900; //使用FlogFont要引用wintypes单元  字体转90度
      fhfont:=createfontindirect(FlogFont);
      ss1.Font.Handle:=fhfont;

      ss1.MoveTo(end_x,Stat_y);  //横线
      ss1.LineTo(end_x+2*text_height1,Stat_y);  //横线
      ss1.MoveTo(end_x,Stat_y+Sheet_pnl3.Width2 *vsheet_size1.Width2_number);  //横线
      ss1.LineTo(end_x+2*text_height1 ,Stat_y+Sheet_pnl3.Width2 *vsheet_size1.Width2_number);  //横线
      ss1.MoveTo(end_x+text_height1,Stat_y);   //竖线
      ss1.LineTo(end_x+text_height1,Stat_y+Sheet_pnl3.Width2 *vsheet_size1.Width2_number);   //竖线
      varx:=end_x+2*text_height1+8;
      vary:=stat_y+trunc((Sheet_pnl3.Width2 *vsheet_size1.Width2_number -ss1.TextWidth('板宽:'+currtostr(vsheet_size1.Width2 )+'X'+inttostr(vsheet_size1.Width2_number )))/2);
      ss1.TextOut(varx,vary,'板宽:'+currtostr(vsheet_size1.Width2)+'X'+inttostr(vsheet_size1.Width2_number ));//标注PNL长与个数
      FlogFont.lfEscapement:=0; //使用FlogFont要引用wintypes单元  字体转0度
      fhfont:=createfontindirect(FlogFont);
      ss1.Font.Handle:=fhfont;

   end;

   if (Sheet_pnl3.Long3>0) or (Sheet_pnl3.Width3>0) then
   begin
     ss1.Pen.Width:=2;
     // showmessage(inttostr(Sheet_pnl3.Long3));
   //三区,在一区的Y上加一区的内容
     for i:=0 to vsheet_size1.Long3_number-1  do  //坚线
     begin
       ss1.MoveTo(Stat_x+Sheet_pnl3.Long3*i,Stat_y+Sheet_pnl3.Width1*vsheet_size1.Width1_number );
       ss1.LineTo(Stat_x+Sheet_pnl3.Long3*i,Stat_y+Sheet_pnl3.Width1*vsheet_size1.Width1_number+Sheet_pnl3.Width3*vsheet_size1.Width3_number);
     end;
     for i:=0 to vsheet_size1.Width3_number -1  do   //横线
     begin
      ss1.MoveTo(Stat_x,Stat_y+Sheet_pnl3.Width1*vsheet_size1.Width1_number+Sheet_pnl3.Width3*i);
      ss1.LineTo(Stat_x+Sheet_pnl3.Long3*vsheet_size1.Long3_number,Stat_y+Sheet_pnl3.Width1*vsheet_size1.Width1_number+Sheet_pnl3.Width3*i);
     end;
     ss1.Pen.Color:=clred;
     ss1.MoveTo(Stat_x+Sheet_pnl3.Long3*vsheet_size1.Long3_number ,Stat_y+Sheet_pnl3.Width1*vsheet_size1.Width1_number);
     ss1.LineTo(Stat_x+Sheet_pnl3.Long3*vsheet_size1.Long3_number ,Stat_y+Sheet_pnl3.Width1*vsheet_size1.Width1_number+Sheet_pnl3.Width3*vsheet_size1.Width3_number);
     ss1.MoveTo(Stat_x,Stat_y+Sheet_pnl3.Width1*vsheet_size1.Width1_number+Sheet_pnl3.Width3*vsheet_size1.Width3_number );
     ss1.LineTo(Stat_x+Sheet_pnl3.Long3*vsheet_size1.Long3_number,Stat_y+Sheet_pnl3.Width1*vsheet_size1.Width1_number+Sheet_pnl3.Width3*vsheet_size1.Width3_number);
     ss1.Pen.Color:=clblack;
     //三区尺寸标注
     ss1.Pen.Width:=1;
     //标注pnl3板长
     ss1.MoveTo(Stat_x,end_y);  //竖线
     ss1.LineTo(Stat_x,end_y+2*text_height1);  //竖线
     ss1.MoveTo(Stat_x+Sheet_pnl3.Long3*vsheet_size1.Long3_number,end_y);  //坚线
     ss1.LineTo(Stat_x+Sheet_pnl3.Long3*vsheet_size1.Long3_number,end_y+2*text_height1);  //坚线
     ss1.MoveTo(Stat_x,end_y+text_height1);   //横线
     ss1.LineTo(Stat_x+Sheet_pnl3.Long3*vsheet_size1.Long3_number,end_y+text_height1);   //横线
     varx:=Stat_x+trunc((Sheet_pnl3.Long3*vsheet_size1.Long3_number-ss1.TextWidth('板长:'+currtostr(vsheet_size1.Long3)+'X'+inttostr(vsheet_size1.Long3_number)))/2);
     vary:=end_y+text_height1+2;
     ss1.TextOut(varx,vary,'板长:'+currtostr(vsheet_size1.Long3)+'X'+inttostr(vsheet_size1.Long3_number));//标注PNL长与个数

     //标注板宽pnl
     FlogFont.lfEscapement:=900; //使用FlogFont要引用wintypes单元  字体转90度
     fhfont:=createfontindirect(FlogFont);
     ss1.Font.Handle:=fhfont;

     ss1.MoveTo(Stat_x,Stat_y+Sheet_pnl3.Width1*vsheet_size1.Width1_number);  //横线
     ss1.LineTo(Stat_x-2*text_height1,Stat_y+Sheet_pnl3.Width1*vsheet_size1.Width1_number);  //横线
     ss1.MoveTo(Stat_x,Stat_y+Sheet_pnl3.Width1*vsheet_size1.Width1_number+Sheet_pnl3.Width3 *vsheet_size1.Width3_number);  //横线
     ss1.LineTo(Stat_x-2*text_height1 ,Stat_y+Sheet_pnl3.Width1*vsheet_size1.Width1_number+Sheet_pnl3.Width3 *vsheet_size1.Width3_number);  //横线
     ss1.MoveTo(Stat_x-text_height1,Stat_y+Sheet_pnl3.Width1*vsheet_size1.Width1_number);   //竖线
     ss1.LineTo(Stat_x-text_height1,Stat_y+Sheet_pnl3.Width1*vsheet_size1.Width1_number+Sheet_pnl3.Width3 *vsheet_size1.Width3_number);   //竖线
     varx:=Stat_x-2*text_height1-5;
     vary:=stat_y+Sheet_pnl3.Width1*vsheet_size1.Width1_number++Sheet_pnl3.Width3*vsheet_size1.Width3_number -trunc((Sheet_pnl3.Width3*vsheet_size1.Width3_number -ss1.TextWidth('板宽:'+currtostr(vsheet_size1.Width3)+'X'+inttostr(vsheet_size1.Width3_number )))/2);
     ss1.TextOut(varx,vary,'板宽:'+currtostr(vsheet_size1.Width3 )+'X'+inttostr(vsheet_size1.Width3_number ));//标注PNL长与个数
     FlogFont.lfEscapement:=0; //使用FlogFont要引用wintypes单元  字体转0度
     fhfont:=createfontindirect(FlogFont);
     ss1.Font.Handle:=fhfont;


   end;

   ss1.Pen.Color:=clred;
   ss1.Pen.Width:=2;
   ss1.MoveTo(Stat_x+Sheet_pnl3.Long1*vsheet_size1.Long1_number ,Stat_y);//竖线
   ss1.LineTo(Stat_x+Sheet_pnl3.Long1*vsheet_size1.Long1_number ,Stat_y+vsheet_size1.Width1_number*Sheet_pnl3.Width1);//竖线//Stat_y+Sheet_pnl3.Width1*vsheet_size1.Width1_number);
   ss1.MoveTo(Stat_x,Stat_y+Sheet_pnl3.Width1*vsheet_size1.Width1_number );//横线
   ss1.LineTo(Stat_x+Sheet_pnl3.Long1*vsheet_size1.Long1_number,Stat_y+Sheet_pnl3.Width1*vsheet_size1.Width1_number);
   ss1.Pen.Color:=clblack;
   ss1.Pen.Width:=1;

end;

function TDraw_Picture.Draw_Sheet_TwoPNL_Picture(ss1: TCanvas; ss1_width,
  ss1_height: integer): boolean;
type
   Draw_Data_1=record
        One_Section_Long:integer;//一区板长
        One_Section_Width:integer;//一区板宽
        One_Section_Long_Number:integer;//一区板长个数
        One_Section_Width_Number:integer;//一区板宽个数

        Two_Section_LongA:integer;//二区板长a
        Two_Section_WidthA:integer;//二区板宽a
        Two_Section_Long_NumberA:integer;//二区板长个数 a
        Two_Section_Width_NumberA:integer;//二区板宽个数 a
        Two_Section_LongB:integer;//二区板长 b
        Two_Section_WidthB:integer;//二区板宽b
        Two_Section_Long_NumberB:integer;//二区板长个数 b
        Two_Section_Width_NumberB:integer;//二区板宽个数 b

        Three_Section_LongA:integer;//三区板长a
        Three_Section_WidthA:integer;//三区板宽a
        Three_Section_Long_NumberA:integer;//三区板长个数 a
        Three_Section_Width_NumberA:integer;//三区板宽个数 a
        Three_Section_LongB:integer;//三区板长 b
        Three_Section_WidthB:integer;//三区板宽b
        Three_Section_Long_NumberB:integer;//三区板长个数 b
        Three_Section_Width_NumberB:integer;//三区板宽个数 b

        Sheet_Long:integer;//大料长
        Sheet_Width:integer;//大料宽
   end;
var
  temS1:Sheet_Size_TwoPNL_1;
  Draw_Data:Draw_Data_1;
  i,j,Long1,Width1,Stat_x,Stat_y,Stat_x1,Stat_y1,End_x,End_y,text_height1,Long2,varx,vary:integer;
  //Tep_PNLA:ARRAY[0..9] OF INTEGER;//
  //Tep_PNLA1:ARRAY[0..9] OF currency;//
  //Tep_PNLAN:ARRAY[0..8] OF INTEGER;
   k:currency; //比率
   x5,y5,x6,y6,x7,y7:integer;
   FlogFont:TlogFont;
   fhfont:hfont;
   function_result:boolean;
   tep_Section: Draw_Sheet_OnePNL_One_Section;
   //tep_Two_Section:Draw_Sheet_TwoPNL_Two_Section;
begin
   Result:=false;
  //Sheet_Size_TwoPNL1数据存放处
  temS1:=Sheet_Size_TwoPNL1;

   // showmessage(currtostr(Sheet_Size_TwoPNL1.sheet_long));
   //宽比长大将大料料长宽转换  temS1的值变,一区长与宽交换,二区长与宽交换,三区宽与长交换
   {}
   if Sheet_Size_TwoPNL1.sheet_long<Sheet_Size_TwoPNL1.sheet_width then
   begin

      temS1.Sheet_Long:=Sheet_Size_TwoPNL1.sheet_width;
      temS1.Sheet_Width:=Sheet_Size_TwoPNL1.sheet_long;
      temS1.One_PNLA_Long:=Sheet_Size_TwoPNL1.One_PNLA_Width ;
      temS1.One_PNLA_Width:=Sheet_Size_TwoPNL1.One_PNLA_Long ;
      temS1.One_PNLA_Long_Number:=Sheet_Size_TwoPNL1.One_PNLA_Width_Number;
      temS1.One_PNLA_Width_Number:=Sheet_Size_TwoPNL1.One_PNLA_Long_Number;

      temS1.Two_PNLA_Long:=Sheet_Size_TwoPNL1.Three_PNLa_Width;
      temS1.Two_PNLA_Width:=Sheet_Size_TwoPNL1.Three_PNLa_Long ;
      temS1.Two_PNLA_Long_Number:=Sheet_Size_TwoPNL1.Three_PNLa_Width_Number;
      temS1.Two_PNLA_Width_Number:=Sheet_Size_TwoPNL1.Three_PNLa_Long_Number;
      temS1.Two_PNLb_Long:=Sheet_Size_TwoPNL1.Three_PNLb_Width;
      temS1.Two_PNLb_Width:=Sheet_Size_TwoPNL1.Three_PNLb_Long;
      temS1.Two_PNLb_Long_Number:=Sheet_Size_TwoPNL1.Three_PNLb_Width_Number;
      temS1.Two_PNLb_Width_Number:=Sheet_Size_TwoPNL1.Three_PNLb_Long_Number;

     if  Sheet_Size_TwoPNL1.Three_Section_Array_type=1 then
        temS1.Two_Section_Array_type:=2
     else
        temS1.Two_Section_Array_type:=1;

      temS1.Three_PNLA_Long:=Sheet_Size_TwoPNL1.Two_PNLa_Width;
      temS1.Three_PNLA_Width:=Sheet_Size_TwoPNL1.Two_PNLa_Long ;
      temS1.Three_PNLA_Long_Number:=Sheet_Size_TwoPNL1.Two_PNLa_Width_Number;
      temS1.Three_PNLA_Width_Number:=Sheet_Size_TwoPNL1.Two_PNLa_Long_Number;
      temS1.Three_PNLb_Long:=Sheet_Size_TwoPNL1.Two_PNLb_Width;
      temS1.Three_PNLb_Width:=Sheet_Size_TwoPNL1.Two_PNLb_Long;
      temS1.Three_PNLb_Long_Number:=Sheet_Size_TwoPNL1.Two_PNLb_Width_Number;
      temS1.Three_PNLb_Width_Number:=Sheet_Size_TwoPNL1.Two_PNLb_Long_Number;

     if  Sheet_Size_TwoPNL1.Two_Section_Array_type=1 then
         temS1.Three_Section_Array_type:=2
     else
        temS1.Three_Section_Array_type:=1;

     if Sheet_Size_TwoPNL1.Draw_type=1 then
        temS1.Draw_type:=2
     else
        temS1.Draw_type:=1;

   end;
   {}
     {
     FlogFont.lfStrikeOut:=0;//非删除字体
     FlogFont.lfUnderline:=0;//非下画线
     FlogFont.lfItalic:=0;//非斜体
     FlogFont.lfHeight:=ss1.Font.Height;
     FlogFont.lfWidth:=ss1.Font.Size;
     FlogFont.lfEscapement:=0; //使用FlogFont要引用wintypes单元  字体转90度
     }
     FlogFont.lfStrikeOut:=0;//非删除字体
     FlogFont.lfUnderline:=0;//非下画线
     FlogFont.lfItalic:=0;//非斜体
     FlogFont.lfHeight:=0;//高度,由系统计决定,
     FlogFont.lfWidth:=0;//宽度,由系统计决定,
     FlogFont.lfEscapement:=0; //使用FlogFont要引用wintypes单元  字体转90度
     FlogFont.lfWeight:=fw_dontcare;//字体密度
     FlogFont.lfCharSet:=default_charset;//ansi_charset=0;1;128;255
     FlogFont.lfQuality:=default_quality;//字体质量,proof_quality,draft_quality
     FlogFont.lfFaceName:='宋体';//字体的样式名

     fhfont:=createfontindirect(FlogFont);
     ss1.Font.Handle:=fhfont;


   text_height1:=ss1.TextHeight('板');//
   Long2:=2*text_height1;//所画图形距边的距离

   Long1:=ss1_Width-trunc(2.5*text_height1);//-ss1.TextHeight('板宽'+currtostr(vsheet_size1.Width2))-20;
   Width1:=ss1_Height-trunc(2.5*text_height1)-5;
   Stat_x:=text_height1;
   Stat_y:=Long2;
   //SHOWMESSAGE(CURRTOSTR(vsheet_size1.sheet_width));
   if (temS1.sheet_long=0) or (temS1.sheet_width=0) then
   begin
     showmessage('大料长宽为零!');
     exit;
   end;
   k:=min(Long1/temS1.sheet_long,Width1/temS1.sheet_width);

   Draw_Data.Sheet_Long:=TRUNC(temS1.Sheet_Long*K);//大料长,整数按比例算
   Draw_Data.Sheet_Width:=trunc(temS1.Sheet_Width*K);//大料宽

   Draw_Data.One_Section_Long:=trunc(temS1.One_PNLA_Long*k);//一区板长
   Draw_Data.One_Section_Width:=trunc(temS1.One_PNLA_Width*k);//一区板宽
   ss1.Pen.Width:=2; //线条大小
   ss1.Pen.Color:=clblack;//线条颜色
   End_x:=Stat_x+Draw_Data.sheet_long ;
   End_y:=Stat_y+Draw_Data.sheet_width;
   //画大料图
   ss1.Rectangle(Stat_x,Stat_y,End_x,End_y);
   //一区
   tep_Section.PNLA_Long:=temS1.One_PNLA_Long;
   tep_Section.PNLA_Width:=temS1.One_PNLA_Width;
   tep_Section.PNLA_Long_Number:=temS1.One_PNLA_Long_Number;
   tep_Section.PNLA_Width_Number:=temS1.One_PNLA_Width_Number;
   tep_Section.PNLA_Long_integer:=Draw_Data.One_Section_Long;
   tep_Section.PNLA_Width_integer:=Draw_Data.One_Section_Width;
   function_result:=Draw_Sheet_OnePNL_Section(ss1,Stat_x,Stat_y,tep_Section);//画图,一区PNLA

   x5:=tep_Section.PNLA_Long_integer*tep_Section.PNLA_Long_Number;
   y5:=tep_Section.PNLA_Width_integer*tep_Section.PNLA_Width_Number;

   //function_result:=Draw_Sheet_OnePNL_Picture_One_Section(ss1,Stat_x,Stat_y,tep_Section);
   //二区
   Draw_Data.Two_Section_LongA :=trunc(temS1.Two_PNLA_Long*k);//二区板长
   Draw_Data.Two_Section_WidthA :=trunc(temS1.Two_PNLA_Width*k);//二区板宽
   tep_Section.PNLA_Long:=temS1.Two_PNLA_Long ;
   tep_Section.PNLA_Width:=temS1.Two_PNLA_Width ;
   tep_Section.PNLA_Long_Number:=temS1.Two_PNLA_Long_Number ;
   tep_Section.PNLA_Width_Number:=temS1.Two_PNLA_Width_Number ;
   tep_Section.PNLA_Long_integer:=Draw_Data.Two_Section_LongA;
   tep_Section.PNLA_Width_integer:=Draw_Data.Two_Section_WidthA;

   function_result:=Draw_Sheet_OnePNL_Section(ss1,Stat_x+x5,Stat_y,tep_Section); //画图,二区PNLA


   x6:=tep_Section.PNLA_Long_Number*tep_Section.PNLA_Long_integer;
   y6:=tep_Section.PNLA_Width_Number*tep_Section.PNLA_Width_integer;
   Draw_Data.Two_Section_Longb :=trunc(temS1.Two_PNLb_Long*k);//二区板长
   Draw_Data.Two_Section_Widthb :=trunc(temS1.Two_PNLb_Width*k);//二区板宽
   tep_Section.PNLa_Long:=temS1.Two_PNLb_Long ;
   tep_Section.PNLa_Width:=temS1.Two_PNLb_Width ;
   tep_Section.PNLA_Long_Number:=temS1.Two_PNLb_Long_Number ;
   tep_Section.PNLA_Width_Number:=temS1.Two_PNLb_Width_Number ;
   tep_Section.PNLA_Long_integer:=Draw_Data.Two_Section_LongB ;
   tep_Section.PNLA_Width_integer:=Draw_Data.Two_Section_WidthB ;
   //  showmessage(inttostr(temS1.Two_Section_Array_type));
//     showmessage(currtostr(Sheet_Size_TwoPNL1.Two_PNLa_Long ));
    if temS1.Two_Section_Array_type=1 then
    begin  //
      function_result:=Draw_Sheet_OnePNL_Section(ss1,Stat_x+x5,Stat_y+y6,tep_Section); //画图,二区PNLB
    end else //if temS1.Two_Section_Array_type=2 then
    begin  //
        function_result:=Draw_Sheet_OnePNL_Section(ss1,Stat_x+x5+x6,Stat_y,tep_Section); //画图,二区PNLB
       //function_result:=Draw_Sheet_OnePNL_Section_change_pnlapnlb(ss1,Stat_x+x5,Stat_y+y6,tep_Section); //画图,二区PNLB
    end;
   //三区
   Draw_Data.Three_Section_LongA :=trunc(temS1.Three_PNLA_Long*k);//三区板长
   Draw_Data.Three_Section_WidthA :=trunc(temS1.Three_PNLA_Width*k);//三区板宽
   tep_Section.PNLA_Long:=temS1.Three_PNLA_Long ;
   tep_Section.PNLA_Width:=temS1.Three_PNLA_Width ;
   tep_Section.PNLA_Long_Number:=temS1.Three_PNLA_Long_Number ;
   tep_Section.PNLA_Width_Number:=temS1.Three_PNLA_Width_Number ;
   tep_Section.PNLA_Long_integer:=Draw_Data.Three_Section_LongA ;
   tep_Section.PNLA_Width_integer:=Draw_Data.Three_Section_WidthA ;

   function_result:=Draw_Sheet_OnePNL_Section(ss1,Stat_x,Stat_y+y5,tep_Section); //画图,三区PNLA
   x7:=tep_Section.PNLA_Long_Number*tep_Section.PNLA_Long_integer;
   y7:=tep_Section.PNLA_Width_Number*tep_Section.PNLA_Width_integer;

   Draw_Data.Three_Section_LongB:=trunc(temS1.Three_PNLb_Long*k);//三区板长
   Draw_Data.Three_Section_Widthb :=trunc(temS1.Three_PNLb_Width*k);//三区板宽
   tep_Section.PNLA_Long:=temS1.Three_PNLb_Long ;
   tep_Section.PNLA_Width:=temS1.Three_PNLb_Width ;
   tep_Section.PNLA_Long_Number:=temS1.Three_PNLb_Long_Number ;
   tep_Section.PNLA_Width_Number:=temS1.Three_PNLb_Width_Number ;
   tep_Section.PNLA_Long_integer:=Draw_Data.Three_Section_LongB;
   tep_Section.PNLA_Width_integer:=Draw_Data.Three_Section_Widthb ;

    if temS1.Three_Section_Array_type=1 then
    begin
       function_result:=Draw_Sheet_OnePNL_Section(ss1,Stat_x,Stat_y+y5+y7,tep_Section); //画图,三区PNLB
    end else
    begin
       function_result:=Draw_Sheet_OnePNL_Section(ss1,Stat_x+x7,Stat_y+y5,tep_Section); //画图,三区PNLB
    end;


     //用于画一二三区的分界线
   if  temS1.Draw_type=2 then
   begin
     ss1.Pen.Color:=clred;
     ss1.MoveTo(Stat_x,Stat_y+y5);
     ss1.LineTo(end_x,Stat_y+y5);
     ss1.MoveTo(Stat_x+x5,Stat_y);
     ss1.LineTo(Stat_x+x5,Stat_y+y5);
     ss1.Pen.Color:=clblack;
   end else
   begin
     ss1.Pen.Color:=clred;
     ss1.MoveTo(Stat_x+x5,Stat_y);//画竖线
     ss1.LineTo(Stat_x+x5,end_y);
     ss1.MoveTo(Stat_x,Stat_y+y5);//画竖线
     ss1.LineTo(Stat_x+x5,Stat_y+y5);
     ss1.Pen.Color:=clblack;
   end;

     //FlogFont.lfStrikeOut:=0;//非删除字体
     //FlogFont.lfUnderline:=0;//非下画线
     //FlogFont.lfItalic:=0;//非斜体
     //FlogFont.lfHeight:=ss1.Font.Height;
     //FlogFont.lfWidth:=ss1.Font.Size;
     FlogFont.lfEscapement:=0; //使用FlogFont要引用wintypes单元  字体转90度
     fhfont:=createfontindirect(FlogFont);
     ss1.Font.Handle:=fhfont;

     ss1.MoveTo(stat_x,stat_y);    //竖线
     ss1.LineTo(stat_x,stat_y-text_height1);  //竖线
     ss1.MoveTo(end_x,stat_y);    //竖线
     ss1.LineTo(end_x,stat_y-text_height1);  //竖线

     ss1.MoveTo(stat_x,stat_y-trunc(0.5*text_height1));  //横线
     ss1.LineTo(end_x,stat_y-trunc(0.5*text_height1)); //横线



     ss1.MoveTo(stat_x,stat_y-trunc(0.5*text_height1)); //箭头
     ss1.lineTo(stat_x+10,stat_y-trunc(0.5*text_height1)+5);//箭头
     ss1.MoveTo(stat_x,stat_y-trunc(0.5*text_height1)); //箭头
     ss1.lineTo(stat_x+10,stat_y-trunc(0.5*text_height1)-5);//箭头
     ss1.moveTo(end_x,stat_y-trunc(0.5*text_height1)); //箭头
     ss1.LineTo(end_x-10,stat_y-trunc(0.5*text_height1)-5); //箭头
     ss1.moveTo(end_x,stat_y-trunc(0.5*text_height1)); //箭头
     ss1.LineTo(end_x-10,stat_y-trunc(0.5*text_height1)+5); //箭头



     ss1.TextOut(trunc((end_x-stat_x-ss1.TextWidth(currtostr(temS1.Sheet_Long)))/2),stat_y-trunc(text_height1)-2,currtostr(temS1.Sheet_Long));//

     //FlogFont.lfStrikeOut:=0;//非删除字体
     //FlogFont.lfUnderline:=0;//非下画线
     //FlogFont.lfItalic:=0;//非斜体
     //FlogFont.lfHeight:=ss1.Font.Height;
     //FlogFont.lfWidth:=ss1.Font.Size;
     FlogFont.lfEscapement:=-900; //使用FlogFont要引用wintypes单元  字体转90度
     fhfont:=createfontindirect(FlogFont);
     ss1.Font.Handle:=fhfont;

     ss1.MoveTo(end_x,stat_y);     //横线
     ss1.LineTo(end_x+text_height1,stat_y); //横线

     ss1.MoveTo(end_x,end_y);    //横线
     ss1.LineTo(end_x+text_height1,end_y); //横线


     ss1.MoveTo(end_x+trunc(0.5*text_height1),stat_y);  //竖线
     ss1.LineTo(end_x+trunc(0.5*text_height1),end_y);//竖线

     ss1.MoveTo(end_x+trunc(0.5*text_height1),stat_y);  //箭头
     ss1.lineTo(end_x+trunc(0.5*text_height1)-5,stat_y+10); //箭头
     ss1.MoveTo(end_x+trunc(0.5*text_height1),stat_y);//箭头
     ss1.lineTo(end_x+trunc(0.5*text_height1)+5,stat_y+10);//箭头
     ss1.moveTo(end_x+trunc(0.5*text_height1),end_y);//箭头
     ss1.LineTo(end_x+trunc(0.5*text_height1)+5,end_y-10);//箭头
     ss1.moveTo(end_x+trunc(0.5*text_height1),end_y);//箭头
     ss1.LineTo(end_x+trunc(0.5*text_height1)-5,end_y-10);//箭头

     //ss1.TextWidth(currtostr(temS1.Sheet_width))
     ss1.TextOut(end_x+2+trunc(text_height1),trunc((end_y-stat_y-ss1.TextWidth(currtostr(temS1.Sheet_width)))/2),currtostr(temS1.Sheet_width));//

     //FlogFont.lfStrikeOut:=0;//非删除字体
     //FlogFont.lfUnderline:=0;//非下画线
     //FlogFont.lfItalic:=0;//非斜体
     //FlogFont.lfHeight:=ss1.Font.Height;
     //FlogFont.lfWidth:=ss1.Font.Size;
     FlogFont.lfEscapement:=0; //使用FlogFont要引用wintypes单元  字体转90度
     fhfont:=createfontindirect(FlogFont);
     ss1.Font.Handle:=fhfont;

    // FreeAndNil(fhfont);

   Result:=true;

end;

function TDraw_Picture.Draw_Sheet_TwoPNL_Picture_Two_Section(ss2: TCanvas;
  v_Start_X, v_Start_Y, v_End_X, v_End_Y: integer;
  v_Section: Draw_Sheet_TwoPNL_Two_Section): boolean;
var
 i,textheight1,x1,y1,x2,y2:integer;
 FlogFont:TlogFont;
 fhfont:hfont;
begin
   Result:=false;
  if (v_Section.PNLA_Long_Number>=1) and(v_Section.PNLA_Width_Number>=1) then //
  begin
      //ss2.MoveTo(0,0);
      //ss2.LineTo(v_Start_X,v_Start_Y);
     {
     FlogFont.lfStrikeOut:=0;//非删除字体
     FlogFont.lfUnderline:=0;//非下画线
     FlogFont.lfItalic:=0;//非斜体
     FlogFont.lfHeight:=ss2.Font.Height;
     FlogFont.lfWidth:=ss2.Font.Size;
     FlogFont.lfEscapement:=0; //使用FlogFont要引用wintypes单元  字体转90度
     }
     FlogFont.lfStrikeOut:=0;//非删除字体
     FlogFont.lfUnderline:=0;//非下画线
     FlogFont.lfItalic:=0;//非斜体
     FlogFont.lfHeight:=0;//高度,由系统计决定,
     FlogFont.lfWidth:=0;//宽度,由系统计决定,
     FlogFont.lfEscapement:=0; //使用FlogFont要引用wintypes单元  字体转90度
     FlogFont.lfWeight:=fw_dontcare;//字体密度
     FlogFont.lfCharSet:=default_charset;//ansi_charset=0;1;128;255
     FlogFont.lfQuality:=default_quality;//字体质量,proof_quality,draft_quality
     FlogFont.lfFaceName:='宋体';//字体的样式名

     fhfont:=createfontindirect(FlogFont);
     ss2.Font.Handle:=fhfont;

      textheight1:=ss2.TextHeight('宽');
      ss2.Pen.Width:=1;
     for i:=0 to v_Section.PNLA_Long_Number do //画竖线
     begin
       ss2.MoveTo(v_Start_X+i*v_Section.PNLA_Long_integer,v_Start_Y);
       ss2.LineTo(v_Start_X+i*v_Section.PNLA_Long_integer ,v_Start_Y+v_Section.PNLA_Width_Number*v_Section.PNLA_Width_integer);
     end;
     for i:=0 to v_Section.PNLA_Width_Number do //画横线
     begin
        ss2.MoveTo(v_Start_X,v_Start_Y+i*v_Section.PNLA_Width_integer );
        ss2.LineTo(v_Start_X+v_Section.PNLA_Long_Number*v_Section.PNLA_Long_integer ,v_Start_Y+i*v_Section.PNLA_Width_integer );

     end;
     //标注尺寸
     x1:=v_Start_X;
     x2:=v_Start_X;
     y1:=v_Start_Y;
     y2:=v_Start_Y-textheight1;
     ss2.MoveTo(x1,y1);
     ss2.LineTo(x2,y2);
     x2:=x2+2;
     y2:=y2-2;



     ss2.TextOut(x2,y2,currtostr(v_Section.PNLA_Long)+'X'+inttostr(v_Section.PNLA_Long_Number));
     x1:=v_Start_X+v_Section.PNLA_Long_Number*v_Section.PNLA_Long_integer;
     x2:=v_Start_X+v_Section.PNLA_Long_Number*v_Section.PNLA_Long_integer;
     y1:=v_Start_Y;
     y2:=v_Start_Y-textheight1;
     ss2.MoveTo(x1,y1);
     ss2.LineTo(x2,y2);



     //FlogFont.lfStrikeOut:=0;//非删除字体
     //FlogFont.lfUnderline:=0;//非下画线
     //FlogFont.lfItalic:=0;//非斜体
     //FlogFont.lfHeight:=ss2.Font.Height;
     //FlogFont.lfWidth:=ss2.Font.Size;
     FlogFont.lfEscapement:=-900; //使用FlogFont要引用wintypes单元  字体转90度
     fhfont:=createfontindirect(FlogFont);
     ss2.Font.Handle:=fhfont;

     x1:=v_End_X;
     x2:=v_End_X+textheight1;
     y1:=v_Start_Y;
     y2:=v_Start_Y;
     ss2.MoveTo(x1,y1);
     ss2.LineTo(x2,y2);
     x2:=x2+2;
     y2:=y2+2+v_Section.PNLA_Width_Number*v_Section.PNLA_Width_integer;
     ss2.TextOut(x2,y2,currtostr(v_Section.PNLA_Width )+'X'+inttostr(v_Section.PNLA_Width_Number ));
     x1:=v_End_X;
     x2:=v_End_X+textheight1;
     y1:=v_Start_Y+v_Section.PNLA_Width_Number*v_Section.PNLA_Width_integer;
     y2:=v_Start_Y+v_Section.PNLA_Width_Number*v_Section.PNLA_Width_integer;
     ss2.MoveTo(x1,y1);
     ss2.LineTo(x2,y2);

     FlogFont.lfStrikeOut:=0;//非删除字体
     FlogFont.lfUnderline:=0;//非下画线
     FlogFont.lfItalic:=0;//非斜体
     FlogFont.lfHeight:=ss2.Font.Height;
     FlogFont.lfWidth:=ss2.Font.Size;
     FlogFont.lfEscapement:=0; //使用FlogFont要引用wintypes单元  字体转90度
     fhfont:=createfontindirect(FlogFont);
     ss2.Font.Handle:=fhfont;









    Result:=true;
  end;
end;

function TDraw_Picture.Get_Draw_Unit_Space_Big_Small_Scale: boolean;
begin

end;

function TDraw_Picture.Get_Draw_Unit_Space_Big_Small_Size: integer;
begin

end;

function TDraw_Picture.Get_Draw_Unit_To_Pnl_Space_Big_Small_Size: integer;
begin

end;

function TDraw_Picture.Get_Input_pnl_size1: pnl_size;
begin
   Result:=pnl_size1;
end;

function TDraw_Picture.Get_Input_Sheet_Size: sheet_size;
begin
  Result:=Sheet_Size1;
end;

function TDraw_Picture.Get_Sheet_Size_TwoPNL_1: Sheet_Size_TwoPNL_1;
begin
   Result:=Sheet_Size_TwoPNL1;
end;

procedure TDraw_Picture.Set_Draw_Unit_Space_Big_Small_Scale(
  const Value: boolean);
begin
   Draw_Unit_Space_Big_Small_Scale2:=value;
end;

procedure TDraw_Picture.Set_Draw_Unit_Space_Big_Small_Size(
  const Value: integer);
begin
   Draw_Unit_Space_Big_Small_Size2:=value;
end;

procedure TDraw_Picture.Set_Draw_Unit_To_Pnl_Space_Big_Small_Size(
  const Value: integer);
begin
   Draw_Unit_To_Pnl_Space_Big_Small_Size2:=value;
end;

procedure TDraw_Picture.Set_Input_pnl_size1(const Value: pnl_size);
begin
    pnl_size1:=Value;
end;

procedure TDraw_Picture.Set_Input_Sheet_Size(const Value: sheet_size);
begin
   Sheet_Size1:=value;
end;

procedure TDraw_Picture.Set_Sheet_Size_TwoPNL_1(
  const Value: Sheet_Size_TwoPNL_1);
begin
  Sheet_Size_TwoPNL1:=value;
end;

end.
