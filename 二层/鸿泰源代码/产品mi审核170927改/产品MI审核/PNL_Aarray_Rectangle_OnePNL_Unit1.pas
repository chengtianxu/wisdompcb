//用于计算长正方形的开料图,只有一种PNL尺寸
{使用方法     pnl_size_s1:pnl_size;//定义记录 全局变量,否则不能画出多种拼法
var
  Input_PCB_SIZE_onePNL22:Input_PCB_SIZE_onePNL_1;//定义记录
  Input_Sheet_Size_15:Input_Sheet_Size_onePNL_1;//定义记录

  var_Sheet_Size_TwoPNL:Sheet_Size_twoPNL_1;//定义记录
begin
  //function TryStrToCurr(const S: string; out Value: Currency): Boolean;
  Input_PCB_SIZE_onePNL22.Unit_Long:=strtocurr(edit1.text); //单元长
  Input_PCB_SIZE_onePNL22.Unit_Width:=strtocurr(edit2.text); //单元宽
  Input_PCB_SIZE_onePNL22.Unit_Long_Space:=1.5;//单元长间距
  Input_PCB_SIZE_onePNL22.Unit_Width_Space:=1.5;//单元宽间距
  Input_PCB_SIZE_onePNL22.Unit_Long_ToPNL:=8.05;//单元长到边距离
  Input_PCB_SIZE_onePNL22.Unit_Width_ToPNL:=5.88;//单元宽到边距离
  Input_PCB_SIZE_onePNL22.PNLA_Long_Max:=450;//PNLA长上限
  Input_PCB_SIZE_onePNL22.PNLA_Width_Max:=400;//PNLA宽上限
  Input_PCB_SIZE_onePNL22.PNLA_Long_Min:=250; //PNLA长下限
  Input_PCB_SIZE_onePNL22.PNLA_Width_Min:=250;//PNLA宽下限
  Aarray_Rectangle_onePNL1:=TAarray_Rectangle_onePNL1.Create;//建立类

  Input_Sheet_Size_15.Sheet_Long:=1232;//大料长
  Input_Sheet_Size_15.Sheet_Width:=1080;//大料宽
  Aarray_Rectangle_onePNL1.Input_Sheet_Size[0]:=Input_Sheet_Size_15; //输入要求计算的大料尺寸,注意用数组表示
  //Input_Sheet_Size_15.Sheet_Long:=1030;//大料长
  //Input_Sheet_Size_15.Sheet_Width:=1004;//大料宽
  //Aarray_Rectangle_TwoPNL1.Input_Sheet_Size[1]:=Input_Sheet_Size_15; //输入要求计算的大料尺寸,注意用数组表示

  Aarray_Rectangle_onePNL1.Input_PCB_SIZE:=Input_PCB_SIZE_onePNL22;//输入要求计算的单元尺寸等信息

  Aarray_Rectangle_onePNL1.Calculate_Array_Complete_Percent:=ProgressBar2; //用于显示进度
  Aarray_Rectangle_onePNL1.Calculate_Array_Complete_Time_Display:=true;//显示计算时间
  //Aarray_Rectangle_TwoPNL1.Echange_Unit_To_Unit_Space:=true;//交换单元间距
  //Aarray_Rectangle_TwoPNL1.Echange_Unit_To_PNL_Space:=true;//交换单到边距离
  Aarray_Rectangle_onePNL1.Calculate_Rate_Type:=0;//0用单元计算利用率2用PNL计算利用率,暂时不起作用
  Aarray_Rectangle_onePNL1.Calculate_Array;//计算

  //画排版图
  pnl_size_s1.Long1:=Aarray_Rectangle_onePNL1.Calculate_Result[0].PNLA_Long;//取结果,PNLA长
  pnl_size_s1.Width1:=Aarray_Rectangle_onePNL1.Calculate_Result[0].PNLA_Width;//取结果,PNLA宽
  pnl_size_s1.Unit_Long:=Aarray_Rectangle_onePNL1.Calculate_Result[0].PNLA_Unit_Long;//取结果,PNLA单元长
  pnl_size_s1.Unit_Width:=Aarray_Rectangle_onePNL1.Calculate_Result[0].PNLA_Unit_Width;//取结果,PNLA单元宽
  pnl_size_s1.Unit_Long_ToUnit_Space:=Aarray_Rectangle_onePNL1.Calculate_Result[0].PNLA_Unit_Long_Space;//取结果,PNLA单元长间距
  pnl_size_s1.Unit_Width_ToUnit_Space:=Aarray_Rectangle_onePNL1.Calculate_Result[0].PNLA_Unit_Width_Space;//取结果,PNLA单元宽间距
  pnl_size_s1.Unit_Long_PNL_Space:=Aarray_Rectangle_onePNL1.Calculate_Result[0].PNLA_Unit_Long_ToPNL;//取结果,PNLA单元长到边距离
  pnl_size_s1.Unit_Width_PNL_Space:=Aarray_Rectangle_onePNL1.Calculate_Result[0].PNLA_Unit_Width_ToPNL;//取结果,PNLA单元宽到边距离
  pnl_size_s1.Unit_Long_Number:=Aarray_Rectangle_onePNL1.Calculate_Result[0].PNLA_Unit_Long_Number;//取结果,PNLA单元长个数
  pnl_size_s1.Unit_Width_number:=Aarray_Rectangle_onePNL1.Calculate_Result[0].PNLA_Unit_Width_Number;//取结果,PNLA单元宽个数
  Draw_Picture1:=TDraw_Picture.Create ;
  Draw_Picture1.Input_pnl_size:=pnl_size_s1; //输入PNLA尺寸,用于画PNLA排版图

  Image1.Canvas.Rectangle(0,0,Image1.Width,Image1.Height);//清除内容
  Draw_Picture1.Draw_PNL_Picture(image1.Canvas ,image1.Width ,image1.Height ); //画PNLA排版图,其中image1代表所要画的地方
  Image2.Canvas.Rectangle(0,0,Image2.Width,Image2.Height);//清除内容
  //画开料图
  var_Sheet_Size_TwoPNL.One_PNLA_Long:=Aarray_Rectangle_onePNL1.Calculate_Result[0].One_Section_Long;  //300;   //一区PNLA长
  var_Sheet_Size_TwoPNL.One_PNLA_Width:=Aarray_Rectangle_onePNL1.Calculate_Result[0].One_Section_Width;//  250;  //一区PNLA宽
  var_Sheet_Size_TwoPNL.One_PNLA_Long_Number:=Aarray_Rectangle_onePNL1.Calculate_Result[0].One_Section_Long_Number;//  1;//一区PNLA长个数
  var_Sheet_Size_TwoPNL.One_PNLA_Width_Number:=Aarray_Rectangle_onePNL1.Calculate_Result[0].One_Section_Width_Number;//  2;//一区PNLA宽个数
  var_Sheet_Size_TwoPNL.Two_PNLA_Long:=Aarray_Rectangle_onePNL1.Calculate_Result[0].One_Section_LongA;//  300;
  var_Sheet_Size_OnePNL.One_PNLA_Width:=Aarray_Rectangle_onePNL1.Calculate_Result[0].One_Section_WidthA;//  150;
  var_Sheet_Size_OnePNL.One_PNLA_Long_Number:=Aarray_Rectangle_onePNL1.Calculate_Result[0].One_Section_Long_NumberA;//  3;
  var_Sheet_Size_OnePNL.One_PNLA_Width_Number:=Aarray_Rectangle_onePNL1.Calculate_Result[0].One_Section_Width_NumberA;//  1 ;
  var_Sheet_Size_OnePNL.One_PNLB_Long:=Aarray_Rectangle_onePNL1.Calculate_Result[0].One_Section_Longb;//  350;
  var_Sheet_Size_OnePNL.One_PNLB_Width:=Aarray_Rectangle_onePNL1.Calculate_Result[0].One_Section_Widthb;//  200;
  var_Sheet_Size_OnePNL.One_PNLB_Long_Number:=Aarray_Rectangle_onePNL1.Calculate_Result[0].One_Section_Long_NumberB;//  2;
  var_Sheet_Size_OnePNL.One_PNLB_Width_Number:=Aarray_Rectangle_onePNL1.Calculate_Result[0].One_Section_Width_NumberB;//  1;
  var_Sheet_Size_OnePNL.Three_PNLA_Long:=Aarray_Rectangle_onePNL1.Calculate_Result[0].Three_Section_LongA;//  230;
  var_Sheet_Size_OnePNL.Three_PNLA_Width:=Aarray_Rectangle_onePNL1.Calculate_Result[0].Three_Section_WidthA;//  240;
  var_Sheet_Size_OnePNL.Three_PNLA_Long_Number:=Aarray_Rectangle_onePNL1.Calculate_Result[0].Three_Section_Long_NumberA; // 5;
  var_Sheet_Size_OnePNL.Three_PNLA_Width_Number:=Aarray_Rectangle_onePNL1.Calculate_Result[0].Three_Section_Width_NumberA;//  1;
  var_Sheet_Size_OnePNL.Three_PNLB_Long:=Aarray_Rectangle_onePNL1.Calculate_Result[0].Three_Section_Longb;//280;
  var_Sheet_Size_OnePNL.Three_PNLB_Width:=Aarray_Rectangle_onePNL1.Calculate_Result[0].Three_Section_Widthb;//190;
  var_Sheet_Size_OnePNL.Three_PNLB_Long_Number:=Aarray_Rectangle_onePNL1.Calculate_Result[0].Three_Section_Long_Numberb; //4;
  var_Sheet_Size_OnePNL.Three_PNLB_Width_Number:=Aarray_Rectangle_onePNL1.Calculate_Result[0].Three_Section_Width_Numberb;//1;
  var_Sheet_Size_OnePNL.Sheet_Long:=Aarray_Rectangle_onePNL1.Calculate_Result[0].Sheet_Long;//  1220;
  var_Sheet_Size_OnePNL.Sheet_Width:=Aarray_Rectangle_onePNL1.Calculate_Result[0].Sheet_Width;//  1040;
  var_Sheet_Size_OnePNL.One_Section_Array_type:=Aarray_Rectangle_onePNL1.Calculate_Result[0].One_Section_Array_type;
  var_Sheet_Size_OnePNL.Three_Section_Array_type:=Aarray_Rectangle_onePNL1.Calculate_Result[0].Three_Section_Array_type;
  var_Sheet_Size_OnePNL.Draw_type:=Aarray_Rectangle_onePNL1.Calculate_Result[0].Draw_type;

  Draw_Picture1.Sheet_Size_OnePNL:=var_Sheet_Size_OnePNL;//输入计算结果,用于画开料图
  Image3.Canvas.Rectangle(0,0,Image3.Width,Image3.Height);//清除内容
  Draw_Picture1.Draw_Sheet_onePNL_Picture(image3.Canvas ,image3.Width ,image3.Height);

   //Aarray_Rectangle_OnePNL1.Calculate_Result[0].One_Section_Long_Number

   //showmessage(currtostr(Aarray_Rectangle_OnePNL1.Calculate_Result[0].Unit_Using_Rate));
   //showmessage(inttostr(Aarray_Rectangle_OnePNL1.Calculate_Result[0].One_Section_Long_Number)+'*'+inttostr(Aarray_Rectangle_OnePNL1.Calculate_Result[0].One_Section_Width_Number));
   //showmessage(inttostr(Aarray_Rectangle_OnePNL1.Calculate_Result[0].One_Section_Long_NumberA)+'*'+inttostr(Aarray_Rectangle_OnePNL1.Calculate_Result[0].One_Section_Width_NumberA));
   //showmessage(inttostr(Aarray_Rectangle_OnePNL1.Calculate_Result[0].Three_Section_Long_NumberA)+'*'+inttostr(Aarray_Rectangle_OnePNL1.Calculate_Result[0].Three_Section_Width_NumberA));
          //  Aarray_Rectangle_OnePNL1.Calculate_Result[0].One_Section_LongA

  // Label50.Caption:='长:'+currtostr(Aarray_Rectangle_onePNL1.Calculate_Result[0].One_Section_Long)+'x'+
  // inttostr(Aarray_Rectangle_onePNL1.Calculate_Result[0].One_Section_Long_Number)+
  // '宽:'+currtostr(Aarray_Rectangle_onePNL1.Calculate_Result[0].One_Section_Width)+'x'
  // +inttostr(Aarray_Rectangle_onePNL1.Calculate_Result[0].One_Section_Width_Number)+'  '+chr(13)+chr(10);

  // Label50.Caption:=Label50.Caption+ '二区长:'+currtostr(Aarray_Rectangle_onePNL1.Calculate_Result[0].One_Section_Longa)+'x'
  //   +  inttostr(Aarray_Rectangle_onePNL1.Calculate_Result[0].One_Section_Long_Numbera)+
  //    '宽:'+currtostr(Aarray_Rectangle_onePNL1.Calculate_Result[0].One_Section_Widtha)+'x'
  //   +  inttostr(Aarray_Rectangle_onePNL1.Calculate_Result[0].One_Section_Width_Numbera);
  // Label50.Caption:=Label50.Caption+ '二区长:'+currtostr(Aarray_Rectangle_onePNL1.Calculate_Result[0].One_Section_Longb)+'x'
  //   +  inttostr(Aarray_Rectangle_onePNL1.Calculate_Result[0].One_Section_Long_Numberb)+
  //    '宽:'+currtostr(Aarray_Rectangle_onePNL1.Calculate_Result[0].One_Section_Widthb)+'x'
  //   +  inttostr(Aarray_Rectangle_onePNL1.Calculate_Result[0].One_Section_Width_Numberb)+'      '+chr(13)+chr(10);

  // Label50.Caption:=Label50.Caption+ '三区长:'+currtostr(Aarray_Rectangle_onePNL1.Calculate_Result[0].three_Section_Longa)+'x'
  //     +inttostr(Aarray_Rectangle_onePNL1.Calculate_Result[0].three_Section_Long_Numbera)+
  //    '宽:'+currtostr(Aarray_Rectangle_onePNL1.Calculate_Result[0].three_Section_Widtha)+'x'
  //     +   inttostr(Aarray_Rectangle_onePNL1.Calculate_Result[0].three_Section_Width_Numbera);
 // Label50.Caption:=Label50.Caption+ '三区长:'+currtostr(Aarray_Rectangle_onePNL1.Calculate_Result[0].three_Section_Longb)+'x'
 //      +inttostr(Aarray_Rectangle_onePNL1.Calculate_Result[0].three_Section_Long_Numberb)+
 //     '宽:'+currtostr(Aarray_Rectangle_onePNL1.Calculate_Result[0].three_Section_Widthb)+'x'
 //      +   inttostr(Aarray_Rectangle_onePNL1.Calculate_Result[0].three_Section_Width_Numberb)+'  '+chr(13)+chr(10);
 //  // Aarray_Rectangle_OnePNL1.Calculate_Result[0].Draw_type
 // Label50.Caption:=Label50.Caption+'类型:'+INTToSTR( Aarray_Rectangle_onePNL1.Calculate_Result[0].Draw_type)
 //      + '利用率:'+currtostr(Aarray_Rectangle_onePNL1.Calculate_Result[0].Using_Rate);

  Aarray_Rectangle_onePNL1.Free; //释放类
  Draw_Picture1.Free; //释放类
end;
使用方法结束}
unit PNL_Aarray_Rectangle_OnePNL_Unit1;

interface
uses
  Messages,SysUtils,StdCtrls,Dialogs,ExtCtrls,math,Graphics,wintypes,ComCtrls;//raFunc,IdTrivialFTPBase


TYPE

   Input_Set_Size_OnePNL_1111=RECORD//输入的SET信息
       Unit_Long:currency;//SET内的单元长
       Unit_Width:currency;//SET内的单元宽
       Unit_Long_Space_ToUnit:currency;//SET内的单元长间距
       Unit_Width_Space_ToUnit:currency;//SET内的单元宽间距
       Unit_Long_Space_Toset_1:currency;//SET内的单元长到SET边距 ,如果2为0则边距相等
       Unit_Width_Space_Toset_1:currency;//SET内的单元宽到SET边距,如果2为0则边距相等
       Unit_Long_Space_Toset_2:currency;//SET内的单元长到SET边距,如果2为0则边距相等
       Unit_Width_Space_Toset_2:currency;//SET内的单元宽到SET边距,如果2为0则边距相等
       Set_Long_Max:currency;//SET长上限
       Set_Long_Min:currency;//SET长下限
       Set_Width_Max:currency;//SET宽上限
       Set_Width_Min:currency;//SET宽下限
   end;

   PNL_Informat3311=record //知道PNL内容
        Unit_Long:currency;//单元长
        Unit_Width:currency;//单元宽
        Unit_Long_Space:currency;//单元长间距
        Unit_Width_Space:currency;//单元宽间距
        Unit_Long_ToPNL:currency;//单元长到边距离
        Unit_Width_ToPNL:currency;//单元宽到边距离
        Unit_Long_Number:integer;//单元长个数
        Unit_Width_Number:integer;//单元宽个数
        PNLA_Long:currency;//PNLA长
        PNLA_Width:currency;//PNLA宽
   end;
   //存入输入的尺寸
   Input_PCB_SIZE_OnePNL_1=record
        Unit_Long:currency;//单元长
        Unit_Width:currency;//单元宽
        Unit_Long_Space:currency;//单元长间距
        Unit_Width_Space:currency;//单元宽间距
        Unit_Long_ToPNL:currency;//单元长到边距离
        Unit_Width_ToPNL:currency;//单元宽到边距离

        PNLA_Long_Max:currency;//PNLA长上限
        PNLA_Width_Max:currency;//PNLA宽上限
        PNLA_Long_Min:currency;//PNLA长下限
        PNLA_Width_Min:currency;//PNLA宽下限

     end;
   //用于存大料数组
   Input_Sheet_Size_OnePNL_1=record
       Sheet_Long:currency;
       Sheet_Width:currency;
     end;
    //存入计算后的结果
   tresult_makeup_using_Sheet_OnePNL_1=record
        //用于存PNLA排版信息
        PNLA_Unit_Long:currency;//PNLA单元长
        PNLA_Unit_Width:currency;//PNLA单元宽
        PNLA_Unit_Long_Space:currency;//PNLA单元长间距
        PNLA_Unit_Width_Space:currency;//PNLA单元宽间距
        PNLA_Unit_Long_ToPNL:currency;//PNLA单元长到边距离
        PNLA_Unit_Width_ToPNL:currency;//PNLA单元宽到边距离
        PNLA_Unit_Long_Number:integer;//PNLA单元长个数
        PNLA_Unit_Width_Number:integer;//PNLA单元宽个数
        PNLA_Long:currency;//PNLA长
        PNLA_Width:currency;//PNLA宽

        //用于存开料信息
        One_Section_Long:currency;//一区板长
        One_Section_Width:currency;//一区板宽
        One_Section_Long_Number:integer;//一区板长个数
        One_Section_Width_Number:integer;//一区板宽个数
        One_Section_Unit_Number:integer;//一区总单元个数

        Two_Section_LongA:currency;//二区板长a
        two_Section_WidthA:currency;//二区板宽a
        two_Section_Long_NumberA:integer;//二区板长个数 a
        two_Section_Width_NumberA:integer;//二区板宽个数 a
        two_Section_LongB:currency;//二区板长 b
        two_Section_WidthB:currency;//二区板宽b
        two_Section_Long_NumberB:integer;//二区板长个数 b
        two_Section_Width_NumberB:integer;//二区板宽个数 b
        two_Section_Longc:currency;//二区板长 c
        two_Section_Widthc:currency;//二区板宽c
        two_Section_Long_Numberc:integer;//二区板长个数 c
        two_Section_Width_Numberc:integer;//二区板宽个数 c
        two_Section_Unit_Number:integer;//二区总单元个数
        two_Section_Array_type:integer;//二区排方式.1,表示PNLA排在长边不变,PNLB与PNLA的X相同,2表示PNLA排在宽边,PNLB与PNLA的Y相同

        Three_Section_LongA:currency;//三区板长a
        Three_Section_WidthA:currency;//三区板宽a
        Three_Section_Long_NumberA:integer;//三区板长个数 a
        Three_Section_Width_NumberA:integer;//三区板宽个数 a
        Three_Section_LongB:currency;//三区板长 b
        Three_Section_WidthB:currency;//三区板宽b
        Three_Section_Long_NumberB:integer;//三区板长个数 b
        Three_Section_Width_NumberB:integer;//三区板宽个数 b
        Three_Section_Longc:currency;//三区板长 c
        Three_Section_Widthc:currency;//三区板宽c
        Three_Section_Long_Numberc:integer;//三区板长个数 c
        Three_Section_Width_Numberc:integer;//三区板宽个数 c

        Three_Section_Unit_Number:integer;//三区总单元个数
        Three_Section_Array_type:integer;//三区排方式

        Sheet_Long:currency;//大料长
        Sheet_Width:currency;//大料宽

        Using_Rate:currency;//计算用利用率
        Unit_Using_Rate:currency;//单元利用率
        Pnl_Using_Rate:currency;//PNL利率

        Unit_Long:currency;//SET内的单元长
        Unit_Width:currency;//SET内的单元宽
        Unit_Long_Space_ToUnit:currency;//SET内的单元长间距
        Unit_Width_Space_ToUnit:currency;//SET内的单元宽间距
        Unit_Long_Space_Toset_1:currency;//SET内的单元长到SET边距 ,如果2为0则边距相等
        Unit_Width_Space_Toset_1:currency;//SET内的单元宽到SET边距,如果2为0则边距相等
        Unit_Long_Space_Toset_2:currency;//SET内的单元长到SET边距,如果2为0则边距相等
        Unit_Width_Space_Toset_2:currency;//SET内的单元宽到SET边距,如果2为0则边距相等
        Long_SET:CURRENCY;//SET长
        Width_SET:CURRENCY;//SET宽


        Draw_type:integer;
      end;
   //临时存放PNL结果,用于存放函数的返回值
    TResult_OnePNL_Information_1=record
        //用于存PNLA排版信息
        PNLA_Unit_Long:currency;//PNLA单元长
        PNLA_Unit_Width:currency;//PNLA单元宽
        PNLA_Unit_Long_Space:currency;//PNLA单元长间距
        PNLA_Unit_Width_Space:currency;//PNLA单元宽间距
        PNLA_Unit_Long_ToPNL:currency;//PNLA单元长到边距离
        PNLA_Unit_Width_ToPNL:currency;//PNLA单元宽到边距离
        PNLA_Unit_Long_Number:integer;//PNLA单元长个数
        PNLA_Unit_Width_Number:integer;//PNLA单元宽个数
        PNLA_Long:currency;//PNLA长
        PNLA_Width:currency;//PNLA宽

      end;
   TAarray_Rectangle_OnePNL1= CLASS(Tobject)
   private
       { Private declarations }
       unit_to_set_pnl_sheet1:integer;//用于计算是否是要计算从单元排SET再排PNL最后排开料图,1时是
       PNL_Informat33:PNL_Informat3311;//用于存知道PNL内容的变量

       Input_Set_Size_OnePNL_1:Input_Set_Size_OnePNL_1111;//用于存SET内容,间距,边距,长宽上下限
       //允许单元长宽间距调换 默认为不调换
       Echange_Unit_To_Unit_Space1:boolean ;
       //允许单元边距调换 默认为不调换
       Echange_Unit_To_PNL_Space1:boolean;
        //tsa:string;
      //剩下开刀数量,=2只允许两个区=3允许三个区
      Leave_Section_falchion_number1:integer;//剩下开刀数量,=2只允许两个区=3允许三个区
      //总利用率
      Summation_rate:real;//总利用率
      Tem_Calculate_Rate_Type1:Integer;//计算利用率的方法,1用单元尺寸计算,单元尺寸乘以单元总数再除以大料尺寸;2用PNL尺寸计算,PNL尺寸乘以PNL总个数再除以大料尺寸

       //存放输入的大料数组
       Input_Sheet_Size_OnePNL:array[0..50] of Input_Sheet_Size_OnePNL_1;  //存放输入的大料数组
       //存放输入的尺寸,为记录型,单元长,宽,间距,边宽,上下限
       Input_PCB_SIZE_OnePNL:Input_PCB_SIZE_OnePNL_1;//存放输入的尺寸,为记录型,单元长,宽,间距,边宽,上下限
       //存放计算后的结果值
       Result_makeup_using_Sheet_OnePNL:ARRAY[0..20] OF tresult_makeup_using_Sheet_OnePNL_1; //存放计算后的结果值

       Tem_TProgressBar1:TProgressBar;//用于存放TProgressBar控件,要显示的进度条
       //
       Tem_Calculate_Array_Complete_Time_Display:boolean;//是否显示计算所要的时间
       Falchion_Number1:INTEGER;//开刀数量
       Calculate_Falchion_Number_Equality_Hold_1:boolean;//用于定义是否保留相等的开刀数量
       Calculate_Flag1:integer;//是否进入计算,即可否可以排出一个及一个以上排版
       //上下限与PNL长宽对应关系
       Change_PNL_Long_Width1:boolean;
       //不计算刀数
       No_Calculate_Falchion_Number1:boolean;
     function Calculate_Unit_To_Set(const Value_Input_Set_Size_OnePNL_1:Input_Set_Size_OnePNL_1111;VAR Value_Input_PCB_SIZE_OnePNL_1:Input_PCB_SIZE_OnePNL_1):boolean;//从单元到SET
     function PNL_To_SHEET_999():Boolean;//用于PNL排开料图,PNL一定,可用于开余料

     //将二区的PNLA的尺寸迟改为与一区的长宽相等的内容
     function Echange_Two_And_Three_Section_Data(var value1:ARRAY OF tresult_makeup_using_Sheet_OnePNL_1):boolean;

     //从单元排PNL,输入单元尺寸与间距,及范围
     function Calculate_Unit_OnePNL(CONST VALUE:Input_PCB_SIZE_OnePNL_1):BOOLEAN; //从单元排PNL


      //从PNL到SHEET,输入排好的PNL数据,Calculate_OnePNL_Sheet_1中调用Calculate_OnePNL_Sheet_2
      function Calculate_OnePNL_Sheet_1(const value2:TResult_OnePNL_Information_1;const value22:Input_Sheet_Size_OnePNL_1):boolean;//从PNL到SHEET
      function Calculate_OnePNL_Sheet_2(const value332,One_Section_PNLvalue33,Three_Section_PNLvalue33:TResult_OnePNL_Information_1;const value333_sheet,Two_Section_value333,Three_Section_value333:Input_Sheet_Size_OnePNL_1;pnl_long_number3331,pnl_width_number3331,type333,Two_Section_Draw_value333,Three_Section_Draw_value333:integer):boolean;//从PNL到SHEET

      //数据转换函数
      function Calculate_OnePNL_result_exchange():boolean;



      //用于返回计算的结果个数
    function Get_Calculate_Result_Number: integer;

    function Get_Input_PCB_SIZE_OnePNL_1: Input_PCB_SIZE_OnePNL_1;

    function Get_Input_Sheet_Size_OnePNL_1(Index: integer): Input_Sheet_Size_OnePNL_1;

    procedure Set_Input_PCB_SIZE_OnePNL_1(const Value: Input_PCB_SIZE_OnePNL_1);

    procedure Set_Input_Sheet_Size_OnePNL_1(Index: integer;const Value: Input_Sheet_Size_OnePNL_1);

    procedure Set_tresult_makeup_using_Sheet_OnePNL_1(index: integer;const Value: tresult_makeup_using_Sheet_OnePNL_1);
    function Get_tresult_makeup_using_Sheet_OnePNL_1(index: integer): tresult_makeup_using_Sheet_OnePNL_1;
    function Get_Leave_Section_falchion_number: integer;
    procedure Set_Leave_Section_falchion_number1(const Value: integer);
    function Get_Echange_Unit_To_Unit_Space: boolean;
    procedure Set_Echange_Unit_To_Unit_Space(const Value: boolean);
    function Get_Echange_Unit_To_PNL_Space: boolean;
    procedure Set_Echange_Unit_To_PNL_Space(const Value: boolean);



    procedure Calculate_Array_Complete_Percent_1(V_ProgressBar1:TProgressBar;V_ProgressBar1_Min,V_ProgressBar1_MAX:INTEGER);
    procedure Calculate_Array_Complete_Percent_2(V_ProgressBar1:TProgressBar;V_ProgressBar1_Position:INTEGER);
    function Get_Calculate_Array_Complete_Percent: TProgressBar;
    procedure Set_Calculate_Array_Complete_Percent(const Value: TProgressBar);
    function Get_Calculate_Array_Complete_Time: boolean;
    procedure Set_Calculate_Array_Complete_Time(const Value: boolean);
    function Get_Tem_Calculate_Rate_Type1: integer;
    procedure Set_Tem_Calculate_Rate_Type1(const Value: integer);
    function Get_Calculate_Falchion_Number_Equality_Hold: boolean;
    procedure Set_Calculate_Falchion_Number_Equality_Hold(const Value: boolean);
    function Get_PNL_Informat3311: PNL_Informat3311;
    procedure Set_PNL_Informat3311(const Value: PNL_Informat3311);
    function Get_Input_Set_Size_OnePNL_1111: Input_Set_Size_OnePNL_1111;
    procedure Set_Input_Set_Size_OnePNL_1111(const Value: Input_Set_Size_OnePNL_1111);
    function Get_Change_PNL_Long_Width: boolean;
    procedure Set_Change_PNL_Long_Width(const Value: boolean);
    function Get_No_Calculate_Falchion_Number: boolean;
    procedure Set_No_Calculate_Falchion_Number(const Value: boolean);
  //  procedure Calculate_PnlToSheet_Array;


   public
      { Public declarations }
      //排好PNL排SHEET,从PNL排大料图
      procedure Calculate_SetToPnlToSheet_Array();//从单元排SET再排PNL最后排SHEET

      procedure Calculate_PnlToSheet_Array();//排好PNL排SHEET,从PNL排大料图

      //计算,调用函数Calculate_Unit_OnePNL
      procedure Calculate_Array();
       //剩下的区域允许分几个区,2:两个区;3:三个区,
       property Leave_Section_falchion_number:integer read Get_Leave_Section_falchion_number write Set_Leave_Section_falchion_number1;
       //大料尺寸属性,最大50,从0开始
       property  Input_Sheet_Size[Index:integer]:Input_Sheet_Size_OnePNL_1 Read Get_Input_Sheet_Size_OnePNL_1 Write Set_Input_Sheet_Size_OnePNL_1;
       //存放输入的尺寸,为记录型,单元长,宽,间距,边宽,上下限
       property Input_PCB_SIZE:Input_PCB_SIZE_OnePNL_1 read Get_Input_PCB_SIZE_OnePNL_1 WRITE Set_Input_PCB_SIZE_OnePNL_1;
       //用于返回计算结果
       property Calculate_Result[index:integer]:tresult_makeup_using_Sheet_OnePNL_1 Read Get_tresult_makeup_using_Sheet_OnePNL_1 Write Set_tresult_makeup_using_Sheet_OnePNL_1;
       //用于返回计算的结果个数
       property Calculate_Result_Number:integer read Get_Calculate_Result_Number;

       //允许单元长宽间距调换 默认为不调换  将单元间距交换再调用上面的函数
       property Echange_Unit_To_Unit_Space:boolean Read Get_Echange_Unit_To_Unit_Space write Set_Echange_Unit_To_Unit_Space;
       //允许单元边距调换 默认为不调换   将边距调换再调用上面的函数
       property Echange_Unit_To_PNL_Space:boolean   read Get_Echange_Unit_To_PNL_Space write Set_Echange_Unit_To_PNL_Space;

       //所要显示的进度条,用于显示进度信息
       property  Calculate_Array_Complete_Percent:TProgressBar read Get_Calculate_Array_Complete_Percent write Set_Calculate_Array_Complete_Percent;
       //是否显示计算需时
       property  Calculate_Array_Complete_Time_Display:boolean read Get_Calculate_Array_Complete_Time WRITE Set_Calculate_Array_Complete_Time;

       //计算利用率的方法;1用单元计算;2用PNL计算
       PROPerty Calculate_Rate_Type:integer read Get_Tem_Calculate_Rate_Type1 write Set_Tem_Calculate_Rate_Type1;
       //是否保存刀数相等的
       property   Calculate_Falchion_Number_Equality_Hold:boolean READ Get_Calculate_Falchion_Number_Equality_Hold write Set_Calculate_Falchion_Number_Equality_Hold;
       //得到PNL的内容
       property   PNL_Informat:PNL_Informat3311 read Get_PNL_Informat3311 WRITE Set_PNL_Informat3311;
       //得到SET的要求
       property Input_Set_Size_OnePNL:Input_Set_Size_OnePNL_1111 Read Get_Input_Set_Size_OnePNL_1111 write Set_Input_Set_Size_OnePNL_1111;
       //允许改PNL长宽上下限
       property  Change_PNL_Long_Width:boolean read  Get_Change_PNL_Long_Width write Set_Change_PNL_Long_Width;
       //不计算刀数
       property    No_Calculate_Falchion_Number:boolean  read Get_No_Calculate_Falchion_Number write Set_No_Calculate_Falchion_Number;

   end;
var
  Aarray_Rectangle_OnePNL1:TAarray_Rectangle_OnePNL1;
implementation

{ TAarray_Rectangle_OnePNL1 }




procedure TAarray_Rectangle_OnePNL1.Calculate_Array;//计算排版,调用
var
  function_resule1:boolean;
  tem_Input_PCB_SIZE_OnePNL:Input_PCB_SIZE_OnePNL_1;
  tem_timeTime1,tem_timeTime2,tem_timeTime3: TDateTime;
  TProgressBar1_Position1,tem1:integer;
begin
   //初使化变量
   tem_timeTime1:=Time;
   Summation_rate:=0; //大料利用率,初使化为0
   Falchion_Number1:=100;//开刀数量
   Tem_TProgressBar1.Min:=0;
   Tem_TProgressBar1.max:=100;
   TProgressBar1_Position1:=2;
   if Change_PNL_Long_Width1=false then
   begin
     TProgressBar1_Position1:=1;
   end;
   Calculate_Flag1:=0;
   if Echange_Unit_To_Unit_Space1 then
   begin
      if Change_PNL_Long_Width1=false then
      begin
        TProgressBar1_Position1:=1+TProgressBar1_Position1;
      end
      else
        TProgressBar1_Position1:=2+TProgressBar1_Position1;

   end;
   if Echange_Unit_To_PNL_Space1 then
   begin
      if Change_PNL_Long_Width1=false then
      begin
        TProgressBar1_Position1:=1+TProgressBar1_Position1;
      end
      else
      TProgressBar1_Position1:=2+TProgressBar1_Position1;
   end;
   if (Echange_Unit_To_PNL_Space1) and (Echange_Unit_To_Unit_Space1) then
   begin
      if Change_PNL_Long_Width1=false then
      begin
        TProgressBar1_Position1:=1+TProgressBar1_Position1;
      end
      else
      TProgressBar1_Position1:=2+TProgressBar1_Position1;
   end;
   tem1:=0;
   if Leave_Section_falchion_number1=0 then Leave_Section_falchion_number1:=2; //没有输入排版方法时,默认为:2,二三区只可以有两部分
   //没有输入是否计算开刀数量一样要计算时
   //if Calculate_Falchion_Number_Equality_Hold_1 then
   //  showmessage(booltostr(Calculate_Falchion_Number_Equality_Hold_1));
   Tem_TProgressBar1.Position:=1;
   //if Tem_Calculate_Rate_Type1=0 then Tem_Calculate_Rate_Type1:=1;//没有输入计算利用率的方法时,默认为:1,以单元计算.
   tem_Input_PCB_SIZE_OnePNL:=Input_PCB_SIZE_OnePNL;
   function_resule1:=Calculate_Unit_OnePNL(tem_Input_PCB_SIZE_OnePNL);
   tem1:=tem1+1;
   Tem_TProgressBar1.Position:=trunc(tem1*100/TProgressBar1_Position1);





   if Change_PNL_Long_Width1 then
   begin
     //交换长宽上下限
     tem_Input_PCB_SIZE_OnePNL:=Input_PCB_SIZE_OnePNL;
     tem_Input_PCB_SIZE_OnePNL.PNLA_Long_Max :=Input_PCB_SIZE_OnePNL.PNLA_Width_Max;
     tem_Input_PCB_SIZE_OnePNL.PNLA_long_Min :=Input_PCB_SIZE_OnePNL.PNLA_width_Min;
     tem_Input_PCB_SIZE_OnePNL.PNLA_width_Max :=Input_PCB_SIZE_OnePNL.PNLA_long_Max;
     tem_Input_PCB_SIZE_OnePNL.PNLA_width_Min :=Input_PCB_SIZE_OnePNL.PNLA_long_Min;
     function_resule1:=Calculate_Unit_OnePNL(tem_Input_PCB_SIZE_OnePNL);
     tem1:=tem1+1;
     Tem_TProgressBar1.Position:=trunc(tem1*100/TProgressBar1_Position1);
   end;
   //允许单元长宽间距调换 默认为不调换  将单元间距交换再调用上面的函数
   if Echange_Unit_To_Unit_Space1 then
   begin
     tem_Input_PCB_SIZE_OnePNL:=Input_PCB_SIZE_OnePNL;
     tem_Input_PCB_SIZE_OnePNL.Unit_Long_Space:=Input_PCB_SIZE_OnePNL.Unit_Width_Space;
     tem_Input_PCB_SIZE_OnePNL.Unit_Width_Space:=Input_PCB_SIZE_OnePNL.Unit_Long_Space;
     function_resule1:=Calculate_Unit_OnePNL(tem_Input_PCB_SIZE_OnePNL);
     tem1:=tem1+1;
    Tem_TProgressBar1.Position:=trunc(tem1*100/TProgressBar1_Position1);
     if Change_PNL_Long_Width1 then
     begin
       //交换长宽上下限
       tem_Input_PCB_SIZE_OnePNL:=Input_PCB_SIZE_OnePNL;
       tem_Input_PCB_SIZE_OnePNL.Unit_Long_Space:=Input_PCB_SIZE_OnePNL.Unit_Width_Space;
       tem_Input_PCB_SIZE_OnePNL.Unit_Width_Space:=Input_PCB_SIZE_OnePNL.Unit_Long_Space;
       tem_Input_PCB_SIZE_OnePNL.PNLA_Long_Max :=Input_PCB_SIZE_OnePNL.PNLA_Width_Max;
       tem_Input_PCB_SIZE_OnePNL.PNLA_long_Min :=Input_PCB_SIZE_OnePNL.PNLA_width_Min;
       tem_Input_PCB_SIZE_OnePNL.PNLA_width_Max :=Input_PCB_SIZE_OnePNL.PNLA_long_Max;
       tem_Input_PCB_SIZE_OnePNL.PNLA_width_Min :=Input_PCB_SIZE_OnePNL.PNLA_long_Min;
       function_resule1:=Calculate_Unit_OnePNL(tem_Input_PCB_SIZE_OnePNL);
       tem1:=tem1+1;
       Tem_TProgressBar1.Position:=trunc(tem1*100/TProgressBar1_Position1);
     end;
   end;
   //允许单元边距调换 默认为不调换   将边距调换再调用上面的函数
   if Echange_Unit_To_PNL_Space1 then
   begin
     tem_Input_PCB_SIZE_OnePNL:=Input_PCB_SIZE_OnePNL;
     tem_Input_PCB_SIZE_OnePNL.Unit_Long_ToPNL:=Input_PCB_SIZE_OnePNL.Unit_Width_ToPNL ;
     tem_Input_PCB_SIZE_OnePNL.Unit_Width_ToPNL:=Input_PCB_SIZE_OnePNL.Unit_Long_ToPNL;
     function_resule1:=Calculate_Unit_OnePNL(tem_Input_PCB_SIZE_OnePNL);
     tem1:=tem1+1;
     Tem_TProgressBar1.Position:=trunc(tem1*100/TProgressBar1_Position1);
     if Change_PNL_Long_Width1 then
     begin
       //交换长宽上下限
       tem_Input_PCB_SIZE_OnePNL:=Input_PCB_SIZE_OnePNL;
       tem_Input_PCB_SIZE_OnePNL.Unit_Long_ToPNL:=Input_PCB_SIZE_OnePNL.Unit_Width_ToPNL ;
       tem_Input_PCB_SIZE_OnePNL.Unit_Width_ToPNL:=Input_PCB_SIZE_OnePNL.Unit_Long_ToPNL;
       tem_Input_PCB_SIZE_OnePNL.PNLA_Long_Max :=Input_PCB_SIZE_OnePNL.PNLA_Width_Max;
       tem_Input_PCB_SIZE_OnePNL.PNLA_long_Min :=Input_PCB_SIZE_OnePNL.PNLA_width_Min;
       tem_Input_PCB_SIZE_OnePNL.PNLA_width_Max :=Input_PCB_SIZE_OnePNL.PNLA_long_Max;
       tem_Input_PCB_SIZE_OnePNL.PNLA_width_Min :=Input_PCB_SIZE_OnePNL.PNLA_long_Min;
       function_resule1:=Calculate_Unit_OnePNL(tem_Input_PCB_SIZE_OnePNL);
       tem1:=tem1+1;
       Tem_TProgressBar1.Position:=trunc(tem1*100/TProgressBar1_Position1);
     end;
   end;
   //允许单元边距调换与允许单元长宽间距调换
   if Echange_Unit_To_Unit_Space1 and Echange_Unit_To_PNL_Space1 then //两个都选中时
   begin
     tem_Input_PCB_SIZE_OnePNL:=Input_PCB_SIZE_OnePNL;
     tem_Input_PCB_SIZE_OnePNL.Unit_Long_Space:=Input_PCB_SIZE_OnePNL.Unit_Width_Space;
     tem_Input_PCB_SIZE_OnePNL.Unit_Width_Space:=Input_PCB_SIZE_OnePNL.Unit_Long_Space;
     tem_Input_PCB_SIZE_OnePNL.Unit_Long_ToPNL:=Input_PCB_SIZE_OnePNL.Unit_Width_ToPNL ;
     tem_Input_PCB_SIZE_OnePNL.Unit_Width_ToPNL:=Input_PCB_SIZE_OnePNL.Unit_Long_ToPNL;
     function_resule1:=Calculate_Unit_OnePNL(tem_Input_PCB_SIZE_OnePNL);
     tem1:=tem1+1;
     Tem_TProgressBar1.Position:=trunc(tem1*100/TProgressBar1_Position1);
     if Change_PNL_Long_Width1 then
     begin
     //交换长宽上下限
     tem_Input_PCB_SIZE_OnePNL:=Input_PCB_SIZE_OnePNL;
     tem_Input_PCB_SIZE_OnePNL.Unit_Long_Space:=Input_PCB_SIZE_OnePNL.Unit_Width_Space;
     tem_Input_PCB_SIZE_OnePNL.Unit_Width_Space:=Input_PCB_SIZE_OnePNL.Unit_Long_Space;
     tem_Input_PCB_SIZE_OnePNL.Unit_Long_ToPNL:=Input_PCB_SIZE_OnePNL.Unit_Width_ToPNL ;
     tem_Input_PCB_SIZE_OnePNL.Unit_Width_ToPNL:=Input_PCB_SIZE_OnePNL.Unit_Long_ToPNL;
     tem_Input_PCB_SIZE_OnePNL.PNLA_Long_Max :=Input_PCB_SIZE_OnePNL.PNLA_Width_Max;
     tem_Input_PCB_SIZE_OnePNL.PNLA_long_Min :=Input_PCB_SIZE_OnePNL.PNLA_width_Min;
     tem_Input_PCB_SIZE_OnePNL.PNLA_width_Max :=Input_PCB_SIZE_OnePNL.PNLA_long_Max;
     tem_Input_PCB_SIZE_OnePNL.PNLA_width_Min :=Input_PCB_SIZE_OnePNL.PNLA_long_Min;
     function_resule1:=Calculate_Unit_OnePNL(tem_Input_PCB_SIZE_OnePNL);
     tem1:=tem1+1;
     Tem_TProgressBar1.Position:=trunc(tem1*100/TProgressBar1_Position1);
     end;
   end;


   function_resule1:=Echange_Two_And_Three_Section_Data(Result_makeup_using_Sheet_OnePNL);
   //Tem_TProgressBar1.Position:=0; //清除进度条内容
   tem_timeTime3:= Time;
   tem_timeTime2:=tem_timeTime3-tem_timeTime1;
   if Calculate_Flag1=0 then
           showmessage('请改大上下限范围!请检查!');


end;




procedure TAarray_Rectangle_OnePNL1.Calculate_Array_Complete_Percent_2(
  V_ProgressBar1: TProgressBar; V_ProgressBar1_Position: INTEGER);
begin
  V_ProgressBar1.Position:=V_ProgressBar1_Position;
end;

procedure TAarray_Rectangle_OnePNL1.Calculate_Array_Complete_Percent_1(
  V_ProgressBar1: TProgressBar; V_ProgressBar1_Min,
  V_ProgressBar1_MAX: INTEGER);
begin
  V_ProgressBar1.Min:=V_ProgressBar1_Min;
  V_ProgressBar1.Max:=V_ProgressBar1_MAX;
end;

function TAarray_Rectangle_OnePNL1.Calculate_OnePNL_result_exchange: boolean;//计算结果交换函数
var
  ii,jj:integer;
begin
  Result:=false;//函数返回假
  jj:=high(Result_makeup_using_Sheet_OnePNL)-low(Result_makeup_using_Sheet_OnePNL);
  if jj>1 then
  begin
     for ii:=high(Result_makeup_using_Sheet_OnePNL) downto low(Result_makeup_using_Sheet_OnePNL)+1 do
     begin
        Result_makeup_using_Sheet_OnePNL[ii]:=Result_makeup_using_Sheet_OnePNL[ii-1];

     end;
    Result:=true;//函数返回假
  end;
end;

function TAarray_Rectangle_OnePNL1.Calculate_OnePNL_Sheet_1(const value2: TResult_OnePNL_Information_1;//PNLA与PNLB值
                      const value22:Input_Sheet_Size_OnePNL_1  //大料长宽
                      ): boolean;
var
  i10,j10
     ,n10,n11   //用于记录最大能排PNL个数
     :integer;
   function_result001:boolean;
   tepvalue2,tepvalue3:TResult_OnePNL_Information_1;
  tem_Sheet_Size_OnePNL2,tem_Sheet_Size_OnePNL3:Input_Sheet_Size_OnePNL_1;
begin
  Result:=false;//函数返回假
  if (value2.PNLA_Long<=value22.Sheet_Long) and (value2.PNLA_Width<=value22.Sheet_Width)   then //PNL长宽在大料内,即可排一个以上
  begin
    n10:=trunc(value22.Sheet_Long/value2.PNLA_Long);  //大料长排PNL长个数
    n11:=trunc(value22.Sheet_Width/value2.PNLA_Width);//大料宽排PNL宽个数


 //   if Summation_rate>=0.804 then
  //    showmessage('');
    for i10:=1 to n10 do   //长排大料长边
    //for i10:=n10 downto 1 do
    begin
      for j10:=1 to n11 do //宽排大料宽边
    //  for j10:=n11 downto 1 do
       begin
           //此中分两种排法   type=1 与type=2 ,将剩下的两种尺寸再排 调用函数Calculate_OnePNL_Sheet_2
                                       // |--------|-------|
           //第一种排法,第一刀与宽平行开  |        |       |
//--------------------------              |--------|       |
//                                        |        |       |
           //二区, 三区                   |--------|-------|
           tem_Sheet_Size_OnePNL2.Sheet_Long:=value22.Sheet_Long-i10*value2.PNLA_Long;//二区长
           tem_Sheet_Size_OnePNL2.Sheet_Width:=value22.Sheet_Width ;//二区宽
           tem_Sheet_Size_OnePNL3.Sheet_Long:=i10*value2.PNLA_Long;//三区长
           tem_Sheet_Size_OnePNL3.Sheet_Width:=value22.Sheet_Width-j10*value2.PNLA_Width;//三区宽
           tepvalue2:=value2; //用于对调
           tepvalue3:=value2;
           function_result001:=Calculate_OnePNL_Sheet_2(value2,tepvalue2,tepvalue3,value22,tem_Sheet_Size_OnePNL2,tem_Sheet_Size_OnePNL3,i10,j10,1,1,1);
           //对调二区长宽
           tem_Sheet_Size_OnePNL2.Sheet_Long:=value22.Sheet_Width;//二区长
           tem_Sheet_Size_OnePNL2.Sheet_Width:= value22.Sheet_Long-i10*value2.PNLA_Long;//二区宽
           tem_Sheet_Size_OnePNL3.Sheet_Long:=i10*value2.PNLA_Long;//三区长
           tem_Sheet_Size_OnePNL3.Sheet_Width:=value22.Sheet_Width-j10*value2.PNLA_Width;//三区宽
           tepvalue2:=value2; //用于对调
           tepvalue3:=value2;
           function_result001:=Calculate_OnePNL_Sheet_2(value2,tepvalue2,tepvalue3,value22,tem_Sheet_Size_OnePNL2,tem_Sheet_Size_OnePNL3,i10,j10,1,2,1);
           //对调三区长宽
           tem_Sheet_Size_OnePNL2.Sheet_Long:=value22.Sheet_Long-i10*value2.PNLA_Long;//二区长
           tem_Sheet_Size_OnePNL2.Sheet_Width:=value22.Sheet_Width ;//二区宽
           tem_Sheet_Size_OnePNL3.Sheet_Long:=value22.Sheet_Width-j10*value2.PNLA_Width;//三区长
           tem_Sheet_Size_OnePNL3.Sheet_Width:=i10*value2.PNLA_Long;//三区宽
           tepvalue2:=value2; //用于对调
           tepvalue3:=value2;
           function_result001:=Calculate_OnePNL_Sheet_2(value2,tepvalue2,tepvalue3,value22,tem_Sheet_Size_OnePNL2,tem_Sheet_Size_OnePNL3,i10,j10,1,1,2);
           //对调二区,三区长宽
           tem_Sheet_Size_OnePNL2.Sheet_Long:=value22.Sheet_Width;//二区长
           tem_Sheet_Size_OnePNL2.Sheet_Width:= value22.Sheet_Long-i10*value2.PNLA_Long;//二区宽
           tem_Sheet_Size_OnePNL3.Sheet_Long:=value22.Sheet_Width-j10*value2.PNLA_Width;//三区长
           tem_Sheet_Size_OnePNL3.Sheet_Width:=i10*value2.PNLA_Long;//三区宽
           tepvalue2:=value2; //用于对调
           tepvalue3:=value2;
           function_result001:=Calculate_OnePNL_Sheet_2(value2,tepvalue2,tepvalue3,value22,tem_Sheet_Size_OnePNL2,tem_Sheet_Size_OnePNL3,i10,j10,1,2,2);



           //,以下程序对调二区,三区长宽
//------------------------------------------------
                                              //  |-------------|--------------|
                                              //  |             |              |
                                              //  |             |              |
           //第二种排法,第一刀与长平行开      //  |-------------|--------------|
                                              //  |                            |
                                              //  |                            |
                                              //  |----------------------------|

           tem_Sheet_Size_OnePNL2.Sheet_Long:=value22.Sheet_Long-i10*value2.PNLA_Long;//二区长
           tem_Sheet_Size_OnePNL2.Sheet_Width:=j10*value2.PNLA_Width ;//二区宽 value22.Sheet_Width
           tem_Sheet_Size_OnePNL3.Sheet_Long:=value22.Sheet_Long;//i10*value2.PNLA_Long;//三区长
           tem_Sheet_Size_OnePNL3.Sheet_Width:=value22.Sheet_Width-j10*value2.PNLA_Width;//三区宽
           tepvalue2:=value2; //用于对调
           tepvalue3:=value2;
           function_result001:=Calculate_OnePNL_Sheet_2(value2,tepvalue2,tepvalue3,value22,tem_Sheet_Size_OnePNL2,tem_Sheet_Size_OnePNL3,i10,j10,2,1,1);
           //对调二区长宽
           tem_Sheet_Size_OnePNL2.Sheet_Long:=j10*value2.PNLA_Width;//二区长
           tem_Sheet_Size_OnePNL2.Sheet_Width:=value22.Sheet_Long-i10*value2.PNLA_Long ;//二区宽 value22.Sheet_Width
           tem_Sheet_Size_OnePNL3.Sheet_Long:=value22.Sheet_Long;//i10*value2.PNLA_Long;//三区长
           tem_Sheet_Size_OnePNL3.Sheet_Width:=value22.Sheet_Width-j10*value2.PNLA_Width;//三区宽

           tepvalue2:=value2; //用于对调
           tepvalue3:=value2;
           function_result001:=Calculate_OnePNL_Sheet_2(value2,tepvalue2,tepvalue3,value22,tem_Sheet_Size_OnePNL2,tem_Sheet_Size_OnePNL3,i10,j10,2,2,1);
           //对调三区长宽
           tem_Sheet_Size_OnePNL2.Sheet_Long:=value22.Sheet_Long-i10*value2.PNLA_Long;//二区长
           tem_Sheet_Size_OnePNL2.Sheet_Width:=j10*value2.PNLA_Width ;//二区宽 value22.Sheet_Width
           tem_Sheet_Size_OnePNL3.Sheet_Long:=value22.Sheet_Width-j10*value2.PNLA_Width;//i10*value2.PNLA_Long;//三区长
           tem_Sheet_Size_OnePNL3.Sheet_Width:=value22.Sheet_Long;//三区宽

           tepvalue2:=value2; //用于对调
           tepvalue3:=value2;
           function_result001:=Calculate_OnePNL_Sheet_2(value2,tepvalue2,tepvalue3,value22,tem_Sheet_Size_OnePNL2,tem_Sheet_Size_OnePNL3,i10,j10,2,1,2);
           //对调二区,三区长宽
           tem_Sheet_Size_OnePNL2.Sheet_Long:=j10*value2.PNLA_Width ;//二区长
           tem_Sheet_Size_OnePNL2.Sheet_Width:=value22.Sheet_Long-i10*value2.PNLA_Long;//二区宽 value22.Sheet_Width
           tem_Sheet_Size_OnePNL3.Sheet_Long:=value22.Sheet_Width-j10*value2.PNLA_Width;//i10*value2.PNLA_Long;//三区长
           tem_Sheet_Size_OnePNL3.Sheet_Width:=value22.Sheet_Long;//三区宽

           tepvalue2:=value2; //用于对调
           tepvalue3:=value2;
           function_result001:=Calculate_OnePNL_Sheet_2(value2,tepvalue2,tepvalue3,value22,tem_Sheet_Size_OnePNL2,tem_Sheet_Size_OnePNL3,i10,j10,2,2,2);


//-----------------------------





       end;
    end;
    Result:=true;//函数返回假
  end;

end;



function TAarray_Rectangle_OnePNL1.Calculate_OnePNL_Sheet_2(
  const value332,One_Section_PNLvalue33,Three_Section_PNLvalue33: TResult_OnePNL_Information_1; //value32存放一区的PNLA信息,与PNLB信息,value3存放二,三区的PNLA与PNLB信息
   const  value333_sheet,Two_Section_value333, Three_Section_value333: Input_Sheet_Size_OnePNL_1;  //value33_sheet大料长宽,One_Section_value, Three_Section_value:二,三区长宽
  pnl_long_number3331, pnl_width_number3331,type333,Two_Section_Draw_value333,Three_Section_Draw_value333: integer // pnl_long_number33一区PNLA长个数,pnl_width_number33一区PNLA宽个数,排法
  ): boolean;//调用函数时,value3值中和长宽要对调,One_Section_value长宽要对调
type
  tempnl_sheet333 =record
        Section_LongA:currency;//区板长a
        Section_WidthA:currency;//区板宽a
        Section_Long_NumberA:integer;//区板长个数 a
        Section_Width_NumberA:integer;//区板宽个数 a
        Section_LongB:currency;//区板长 b
        Section_WidthB:currency;//区板宽b
        Section_Long_NumberB:integer;//区板长个数 b
        Section_Width_NumberB:integer;//区板宽个数 b
        Section_LongC:currency;//区板长 C
        Section_WidthC:currency;//区板宽C
        Section_Long_NumberC:integer;//区板长个数 C
        Section_Width_NumberC:integer;//区板宽个数 C
        Section_Unit_Number:integer;//区总单元个数
  end;
var
 j21,i21,i31,j31,pnl_long_number333, pnl_width_number333,i221,t_n
    ,n201,n202,n21,n22,n231,n241,n232,n242,n233,n243
    ,n301,n302,n31,n32,n331,n341,n332,n342,n333,n343
    ,N231A1,N231A2,N232A1,N232A2,N233A1,N233A2,N234A1,N234A2
     ,N231B1,N231B2,N232B1,N232B2,N233B1,N233B2,N234B1,N234B2
    ,N221A1,N221A2,N222A1,N222A2,N223A1,N223A2,N224A1,N224A2
     ,N221B1,N221B2,N222B1,N222B2,N223B1,N223B2,N224B1,N224B2
     ,TEM_Falchion_Number1,TEM_Falchion_Number2:integer;
  rate20,rate21,rate22,rate23,max21,rate30,rate31,rate32,rate33,max31,
   tem_rate3,tem_rate2,rate_10
    ,rate200,rate201,rate202,rate203,rate204,rate205,rate206,rate207,rate208,rate209,rate210,rate211,rate212,rate213
    ,rate221,rate222,rate223,rate224,rate225,rate226,rate227,rate228,rate229,rate230,rate231,rate232,rate233
   :real	;//用于计算总单元个数
  function_result,result_1:boolean;//调用函数是否成功
  array_type2,array_type3:integer;//用于记录是哪种排法,2,3代表23区
  tempnl_sheet22,tempnl_sheet33:tempnl_sheet333;
  t_c:currency;
begin
   unit_to_set_pnl_sheet1:=0;
   rate20:=0;
   rate21:=0;//初使化单元总数
   rate22:=0;
   rate23:=0;
   pnl_long_number333:=pnl_long_number3331;
   pnl_width_number333:=pnl_width_number3331;
  //二区可排PNKB与PNLA       二区从A开始排
  tempnl_sheet22.Section_LongA:=0;
  tempnl_sheet22.Section_WidthA:=0;
  tempnl_sheet22.Section_Long_NumberA:=0;
  tempnl_sheet22.Section_Width_NumberA:=0;
  tempnl_sheet22.Section_LongB:=0;
  tempnl_sheet22.Section_WidthB:=0;
  tempnl_sheet22.Section_Long_NumberB:=0;
  tempnl_sheet22.Section_Width_NumberB:=0;
  tempnl_sheet22.Section_Unit_Number:=0;
  array_type2:=-1;
  tem_rate2:=0;
  if (Two_Section_value333.Sheet_Long>=One_Section_PNLvalue33.PNLA_Long) and (Two_Section_value333.Sheet_Width >=One_Section_PNLvalue33.PNLA_Width)   then
  begin  //1
     if Leave_Section_falchion_number1=2 then //只分两个区,排法只有AB的一边固定个数
     begin //2
       n21:=trunc(Two_Section_value333.Sheet_Long/One_Section_PNLvalue33.PNLA_Long);//排A,最大长个数
       n22:=trunc(Two_Section_value333.Sheet_Width/One_Section_PNLvalue33.PNLA_Width);//排A,最大宽个数

       n201:=n21; //PNLA最大个数为n201*n202
       n202:=n22;
       rate20:=n201*n202*One_Section_PNLvalue33.PNLA_Unit_Long_Number*One_Section_PNLvalue33.PNLA_Unit_Width_Number;
       if Tem_Calculate_Rate_Type1=1 then  //用单元计算
       begin //
          rate20:=n201*n202*One_Section_PNLvalue33.PNLA_Unit_Long_Number*One_Section_PNLvalue33.PNLA_Unit_Width_Number*One_Section_PNLvalue33.PNLA_Unit_Long*One_Section_PNLvalue33.PNLA_Unit_Width;
          rate20:=rate20/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
       end; //
       if Tem_Calculate_Rate_Type1=2 then //用PNL计算
       begin //
         rate20:=n201*n202*One_Section_PNLvalue33.PNLA_Long*One_Section_PNLvalue33.PNLA_Width;//PNL长宽个数与长宽
         rate20:=rate20/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
       end; //
       for j21:=1 to n22 do //宽从1到最大
       begin  //3
          //剩下部分排A,则方向可调换
           n231:=0;
           n241:=0;
           rate21:=0;
           if (Two_Section_value333.Sheet_Long>=One_Section_PNLvalue33.PNLA_Width) and
              ((Two_Section_value333.Sheet_Width-j21*One_Section_PNLvalue33.PNLA_Width)>=One_Section_PNLvalue33.PNLA_Long) then//剩下部分是否可排A,
           begin //
              n231:=trunc(Two_Section_value333.Sheet_Long/One_Section_PNLvalue33.PNLA_Width);
              n241:=trunc((Two_Section_value333.Sheet_Width-j21*One_Section_PNLvalue33.PNLA_Width)/One_Section_PNLvalue33.PNLA_Long);
              rate21:=(n21*j21+n231*n241)*One_Section_PNLvalue33.PNLA_Unit_Long_Number*One_Section_PNLvalue33.PNLA_Unit_Width_Number;
              if Tem_Calculate_Rate_Type1=1 then  //用单元计算
              begin //
                 rate21:=(n21*j21+n231*n241)*One_Section_PNLvalue33.PNLA_Unit_Long_Number*One_Section_PNLvalue33.PNLA_Unit_Width_Number*One_Section_PNLvalue33.PNLA_Unit_Long*One_Section_PNLvalue33.PNLA_Unit_Width;
                 rate21:=rate21/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
              end; //

              if Tem_Calculate_Rate_Type1=2 then //用PNL计算
              begin //
                 rate21:=(n21*j21+n231*n241)*One_Section_PNLvalue33.PNLA_Width*One_Section_PNLvalue33.PNLA_Long;
                 rate21:=rate21/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
               end; //
           end; //
            n232:=0;
            n242:=0;
            rate22:=0;
            n233:=0;
            n243:=0;
            rate23:=0;

           //从 rate1,rate2,rate3中找出最大的
            max21:=max(rate20,rate21);
            if (max21>=tem_rate2)  then
            begin //
             tem_rate2:=max21;
             if rate21=max21 then
             begin //
              array_type2:=1;  //排PNLA后还可排PNLA,宽放长边
              tempnl_sheet22.Section_LongA:=One_Section_PNLvalue33.PNLA_Long;
              tempnl_sheet22.Section_WidthA:=One_Section_PNLvalue33.PNLA_Width;
              tempnl_sheet22.Section_Long_NumberA:=n21;
              tempnl_sheet22.Section_Width_NumberA:=j21;
              tempnl_sheet22.Section_LongB:=One_Section_PNLvalue33.PNLA_Width;
              tempnl_sheet22.Section_WidthB:=One_Section_PNLvalue33.PNLA_Long;
              tempnl_sheet22.Section_Long_NumberB:=n231;
              tempnl_sheet22.Section_Width_NumberB:=n241;
              tempnl_sheet22.Section_Unit_Number:=(n21*j21+n231*n241)*One_Section_PNLvalue33.PNLA_Unit_Long_Number*One_Section_PNLvalue33.PNLA_Unit_Width_Number;
             end; //
             if rate20=max21 then
             begin //
              array_type2:=0;  //只排PNLA
              tempnl_sheet22.Section_LongA:=One_Section_PNLvalue33.PNLA_Long;
              tempnl_sheet22.Section_WidthA:=One_Section_PNLvalue33.PNLA_Width;
              tempnl_sheet22.Section_Long_NumberA:=n201;
              tempnl_sheet22.Section_Width_NumberA:=n202;
              tempnl_sheet22.Section_LongB:=0;
              tempnl_sheet22.Section_WidthB:=0;
              tempnl_sheet22.Section_Long_NumberB:=0;
              tempnl_sheet22.Section_Width_NumberB:=0;
              tempnl_sheet22.Section_Unit_Number:=n201*n202*One_Section_PNLvalue33.PNLA_Unit_Long_Number*One_Section_PNLvalue33.PNLA_Unit_Width_Number ;
             end; //
           end; //4
       end; //3
     end;  //2
//3333333
    { if Leave_Section_falchion_number1=3 then  //分三个区
     begin
       n21:=trunc(Two_Section_value333.Sheet_Long/One_Section_PNLvalue33.PNLA_Long);//排A,最大长个数
       n22:=trunc(Two_Section_value333.Sheet_Width/One_Section_PNLvalue33.PNLA_Width);//排A,最大宽个数

       n201:=n21; //PNLA最大个数为n201*n202
       n202:=n22;
       rate200:=n201*n202*One_Section_PNLvalue33.PNLA_Unit_Long_Number*One_Section_PNLvalue33.PNLA_Unit_Width_Number;
       if Tem_Calculate_Rate_Type1=1 then  //用单元计算
       begin
          rate200:=n201*n202*One_Section_PNLvalue33.PNLA_Unit_Long_Number
                   *One_Section_PNLvalue33.PNLA_Unit_Width_Number
                   *One_Section_PNLvalue33.PNLA_Unit_Long
                   *One_Section_PNLvalue33.PNLA_Unit_Width;
          rate200:=rate200/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
       end;
       if Tem_Calculate_Rate_Type1=2 then //用PNL计算
       begin
         rate200:=n201*N202*One_Section_PNLvalue33.PNLA_Long*One_Section_PNLvalue33.PNLA_Width;//PNL长宽个数与长宽
         rate200:=rate200/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
       end;
        for i21:=1 to n21 do
        begin
          for j21:=1 to n22 do //宽从1到最大 ,小一区排PNLA,长排长边,宽排宽边
          begin  //3   有待加
                                       // |--------|-------|
           //第一种排法,第一刀与宽平行开  | 小一区 |       |
//--------------------------              |--------|小二区 |
         //                               |小三区  |       |
           //二区, 三区                   |--------|-------|

             //此处分多种情况1:小二区排PNLA,小三区也排PNLA;2:小二区排PNLA,小三区排PNLB;3:小二区排PNLB,小三区排PNLA;4:小二区,小三区排PNLB
             //1:小二区排PNLA,小三区也排PNLA,分多种情况:小二区长边排宽,小三区长边排长;小二区长边排宽,小三区长边排长宽;小二区长边排长,小三区长边排宽

             //Two_Section_value333.Sheet_long-i21*One_Section_PNLvalue33.PNLA_Long
             //Two_Section_value333.Sheet_Width-j21*One_Section_PNLvalue33.PNLA_Width
             //小二区PNLA宽排长边
             n221A1:=0;
             n222A1:=0;
             if (Two_Section_value333.Sheet_long-i21*One_Section_PNLvalue33.PNLA_Long>=One_Section_PNLvalue33.PNLA_Width)
               and (Two_Section_value333.Sheet_Width>=One_Section_PNLvalue33.PNLA_Long) then
               begin
                 n221A1:=trunc((Two_Section_value333.Sheet_long-i21*One_Section_PNLvalue33.PNLA_Long)/One_Section_PNLvalue33.PNLA_Width);
                 n222A1:=trunc(Two_Section_value333.Sheet_Width/One_Section_PNLvalue33.PNLA_Long);
              end;
              //小三区PNLA宽排长边
               n231A1:=0;
               n232A1:=0;
              if (i21*One_Section_PNLvalue33.PNLA_Long>=One_Section_PNLvalue33.PNLA_Width)
               and ((Two_Section_value333.Sheet_Width-j21*One_Section_PNLvalue33.PNLA_Width)>=One_Section_PNLvalue33.PNLA_Long) then
               begin
                 n231A1:=trunc(i21*One_Section_PNLvalue33.PNLA_Long/One_Section_PNLvalue33.PNLA_Width);
                 n232A1:=trunc((Two_Section_value333.Sheet_Width-j21*One_Section_PNLvalue33.PNLA_Width)/One_Section_PNLvalue33.PNLA_Long);
              end;
              //小三区PNLA宽排长边
              n233A1:=0;
              n234A1:=0;
              if (i21*One_Section_PNLvalue33.PNLA_Long>=One_Section_PNLvalue33.PNLA_Long)
               and ((Two_Section_value333.Sheet_Width-j21*One_Section_PNLvalue33.PNLA_Width)>=One_Section_PNLvalue33.PNLA_Width) then
               begin
                 n233A1:=trunc(i21*One_Section_PNLvalue33.PNLA_Long/One_Section_PNLvalue33.PNLA_Long);
                 n234A1:=trunc((Two_Section_value333.Sheet_Width-j21*One_Section_PNLvalue33.PNLA_Width)/One_Section_PNLvalue33.PNLA_Width);
              end;
              //小二区PNLA长排长边
              n223A1:=0;
              n224A1:=0;
              if (Two_Section_value333.Sheet_long-i21*One_Section_PNLvalue33.PNLA_Long>=One_Section_PNLvalue33.PNLA_Long)
               and (Two_Section_value333.Sheet_Width>=One_Section_PNLvalue33.PNLA_Width) then
               begin
                 n223A1:=trunc((Two_Section_value333.Sheet_long-i21*One_Section_PNLvalue33.PNLA_Long)/One_Section_PNLvalue33.PNLA_Long);
                 n224A1:=trunc(Two_Section_value333.Sheet_Width/One_Section_PNLvalue33.PNLA_Width);
              end;


              //小二区PNLB宽排长边
              n221B1:=0;
              n222B1:=0;
              if (Two_Section_value333.Sheet_long-i21*One_Section_PNLvalue33.PNLA_Long>=One_Section_PNLvalue33.PNLB_Width)
               and (Two_Section_value333.Sheet_Width>=One_Section_PNLvalue33.PNLB_Long) then
               begin
                 n221B1:=trunc((Two_Section_value333.Sheet_long-i21*One_Section_PNLvalue33.PNLA_Long)/One_Section_PNLvalue33.PNLB_Width);
                 n222B1:=trunc(Two_Section_value333.Sheet_Width/One_Section_PNLvalue33.PNLB_Long);
              end;
              //小三区PNLB宽排长边
              n231B1:=0;
              n232B1:=0;
              if (i21*One_Section_PNLvalue33.PNLA_Long>=One_Section_PNLvalue33.PNLB_Width)
               and ((Two_Section_value333.Sheet_Width-j21*One_Section_PNLvalue33.PNLA_Width)>=One_Section_PNLvalue33.PNLB_Long) then
               begin
                 n231B1:=trunc(i21*One_Section_PNLvalue33.PNLA_Long/One_Section_PNLvalue33.PNLB_Width);
                 n232B1:=trunc((Two_Section_value333.Sheet_Width-j21*One_Section_PNLvalue33.PNLA_Width)/One_Section_PNLvalue33.PNLB_Long);
              end;

              //小三区PNLB宽排长边
              n233B1:=0;
              n234B1:=0;

              if (i21*One_Section_PNLvalue33.PNLA_Long>=One_Section_PNLvalue33.PNLB_Long)
               and ((Two_Section_value333.Sheet_Width-j21*One_Section_PNLvalue33.PNLA_Width)>=One_Section_PNLvalue33.PNLB_Width) then
               begin
                 n233B1:=trunc(i21*One_Section_PNLvalue33.PNLA_Long/One_Section_PNLvalue33.PNLB_Long);
                 n234B1:=trunc((Two_Section_value333.Sheet_Width-j21*One_Section_PNLvalue33.PNLA_Width)/One_Section_PNLvalue33.PNLB_Width);
              end;
              //小二区PNLB长排长边
              n223B1:=0;
              n224B1:=0;
              if (Two_Section_value333.Sheet_long-i21*One_Section_PNLvalue33.PNLA_Long>=One_Section_PNLvalue33.PNLB_Long)
               and (Two_Section_value333.Sheet_Width>=One_Section_PNLvalue33.PNLB_Width) then
               begin
                 n223B1:=trunc((Two_Section_value333.Sheet_long-i21*One_Section_PNLvalue33.PNLA_Long)/One_Section_PNLvalue33.PNLB_Long);
                 n224B1:=trunc(Two_Section_value333.Sheet_Width/One_Section_PNLvalue33.PNLB_Width);
              end;
              //小二区长排PNLA长,小三区可排PNLA,则只一种

               rate201:=(n221A1*N222A1+N233A1*N234a1)*One_Section_PNLvalue33.PNLA_Unit_Long_Number*One_Section_PNLvalue33.PNLA_Unit_Width_Number;
               if Tem_Calculate_Rate_Type1=1 then  //用单元计算
               begin
                  rate201:=(n221A1*N222A1+N233A1*N234a1)*One_Section_PNLvalue33.PNLA_Unit_Long_Number*One_Section_PNLvalue33.PNLA_Unit_Width_Number
                         *One_Section_PNLvalue33.PNLA_Unit_Long*One_Section_PNLvalue33.PNLA_Unit_Width;
                  rate201:=rate201/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
               end;
               if Tem_Calculate_Rate_Type1=2 then //用PNL计算
               begin
                  rate201:=(n221A1*N222A1+N233A1*N234a1)
                         *One_Section_PNLvalue33.PNLA_Long *One_Section_PNLvalue33.PNLA_Width;
                  rate201:=rate201/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
               END;
              //小二区长排PNLA宽,小三区可排PNLA,则只一种
              rate202:=(n223A1*N224A1+N231A1*N232a1)*One_Section_PNLvalue33.PNLA_Unit_Long_Number*One_Section_PNLvalue33.PNLA_Unit_Width_Number;
              if Tem_Calculate_Rate_Type1=1 then  //用单元计算
               begin
                  rate202:=(n223A1*N224A1+N231A1*N232a1)*One_Section_PNLvalue33.PNLA_Unit_Long_Number*One_Section_PNLvalue33.PNLA_Unit_Width_Number
                         *One_Section_PNLvalue33.PNLA_Unit_Long*One_Section_PNLvalue33.PNLA_Unit_Width;
                  rate202:=rate202/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
               end;
               if Tem_Calculate_Rate_Type1=2 then //用PNL计算
               begin
                  rate202:=(n223A1*N224A1+N231A1*N232a1)
                         *One_Section_PNLvalue33.PNLA_Long *One_Section_PNLvalue33.PNLA_Width;
                  rate202:=rate203/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
               END;
              rate203:=(n223A1*N224A1+N233A1*N234a1)*One_Section_PNLvalue33.PNLA_Unit_Long_Number*One_Section_PNLvalue33.PNLA_Unit_Width_Number;
              if Tem_Calculate_Rate_Type1=1 then  //用单元计算
               begin
                  rate203:=(n223A1*N224A1+N233A1*N234a1)*One_Section_PNLvalue33.PNLA_Unit_Long_Number*One_Section_PNLvalue33.PNLA_Unit_Width_Number
                         *One_Section_PNLvalue33.PNLA_Unit_Long*One_Section_PNLvalue33.PNLA_Unit_Width;
                  rate203:=rate203/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
               end;
               if Tem_Calculate_Rate_Type1=2 then //用PNL计算
               begin
                  rate203:=(n223A1*N224A1+N233A1*N234a1)
                         *One_Section_PNLvalue33.PNLA_Long *One_Section_PNLvalue33.PNLA_Width;
                  rate203:=rate203/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
               END;
               //小二区长排PNLA长,小三区可排PNLb,则只两种
               {
              rate204:=n221A1*N222A1*One_Section_PNLvalue33.PNLA_Unit_Long_Number*One_Section_PNLvalue33.PNLA_Unit_Width_Number
                       +N231B1*N232B1*One_Section_PNLvalue33.PNLB_Unit_Long_Number*One_Section_PNLvalue33.PNLB_Unit_Width_Number;

              if Tem_Calculate_Rate_Type1=1 then  //用单元计算
               begin
                  rate204:=n221A1*N222A1*One_Section_PNLvalue33.PNLA_Unit_Long_Number*One_Section_PNLvalue33.PNLA_Unit_Width_Number
                                          *One_Section_PNLvalue33.PNLA_Unit_Long*One_Section_PNLvalue33.PNLA_Unit_Width
                         +N231B1*N232B1*One_Section_PNLvalue33.PNLb_Unit_Long_Number*One_Section_PNLvalue33.PNLb_Unit_Width_Number
                                        *One_Section_PNLvalue33.PNLb_Unit_Long*One_Section_PNLvalue33.PNLb_Unit_Width;
                  rate204:=rate204/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
               end;
               if Tem_Calculate_Rate_Type1=2 then //用PNL计算
               begin
                  rate204:=n221A1*N222A1*One_Section_PNLvalue33.PNLA_Long *One_Section_PNLvalue33.PNLA_Width
                           +N231B1*N232B1*One_Section_PNLvalue33.PNLb_Long *One_Section_PNLvalue33.PNLb_Width;
                  rate204:=rate204/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
               END;

              rate205:=n221A1*N222A1*One_Section_PNLvalue33.PNLA_Unit_Long_Number*One_Section_PNLvalue33.PNLA_Unit_Width_Number
                      +N233B1*N234B1*One_Section_PNLvalue33.PNLB_Unit_Long_Number*One_Section_PNLvalue33.PNLB_Unit_Width_Number;

               if Tem_Calculate_Rate_Type1=1 then  //用单元计算
               begin
                  rate205:=n221A1*N222A1*One_Section_PNLvalue33.PNLA_Unit_Long_Number*One_Section_PNLvalue33.PNLA_Unit_Width_Number
                                          *One_Section_PNLvalue33.PNLA_Unit_Long*One_Section_PNLvalue33.PNLA_Unit_Width
                         +N233B1*N234B1*One_Section_PNLvalue33.PNLb_Unit_Long_Number*One_Section_PNLvalue33.PNLb_Unit_Width_Number
                                        *One_Section_PNLvalue33.PNLb_Unit_Long*One_Section_PNLvalue33.PNLb_Unit_Width;
                  rate205:=rate205/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
               end;
               if Tem_Calculate_Rate_Type1=2 then //用PNL计算
               begin
                  rate205:=n221A1*N222A1*One_Section_PNLvalue33.PNLA_Long *One_Section_PNLvalue33.PNLA_Width
                           +N233B1*N234B1*One_Section_PNLvalue33.PNLb_Long *One_Section_PNLvalue33.PNLb_Width;
                  rate205:=rate205/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
               END;
              //小二区长排PNLB长,小三区可排PNLA,则只两种
              rate206:=n221B1*N222B1*One_Section_PNLvalue33.PNLB_Unit_Long_Number*One_Section_PNLvalue33.PNLB_Unit_Width_NumbeR
                      +N231A1*N232A1*One_Section_PNLvalue33.PNLA_Unit_Long_Number*One_Section_PNLvalue33.PNLA_Unit_Width_Number;
               if Tem_Calculate_Rate_Type1=1 then  //用单元计算
               begin
                  rate206:=N231A1*N232A1*One_Section_PNLvalue33.PNLA_Unit_Long_Number*One_Section_PNLvalue33.PNLA_Unit_Width_Number
                                          *One_Section_PNLvalue33.PNLA_Unit_Long*One_Section_PNLvalue33.PNLA_Unit_Width
                         +n221B1*N222B1*One_Section_PNLvalue33.PNLb_Unit_Long_Number*One_Section_PNLvalue33.PNLb_Unit_Width_Number
                                        *One_Section_PNLvalue33.PNLb_Unit_Long*One_Section_PNLvalue33.PNLb_Unit_Width;
                  rate206:=rate206/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
               end;
               if Tem_Calculate_Rate_Type1=2 then //用PNL计算
               begin
                  rate206:=N231A1*N232A1*One_Section_PNLvalue33.PNLA_Long *One_Section_PNLvalue33.PNLA_Width
                           +n221B1*N222B1*One_Section_PNLvalue33.PNLb_Long *One_Section_PNLvalue33.PNLb_Width;
                  rate206:=rate206/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
               END;
              rate207:=n221B1*N222B1*One_Section_PNLvalue33.PNLB_Unit_Long_Number*One_Section_PNLvalue33.PNLB_Unit_Width_NumbeR
                       +N233A1*N234A1*One_Section_PNLvalue33.PNLA_Unit_Long_Number*One_Section_PNLvalue33.PNLA_Unit_Width_NumbeR;
              if Tem_Calculate_Rate_Type1=1 then  //用单元计算
               begin
                  rate207:=N233A1*N234A1*One_Section_PNLvalue33.PNLA_Unit_Long_Number*One_Section_PNLvalue33.PNLA_Unit_Width_Number
                                          *One_Section_PNLvalue33.PNLA_Unit_Long*One_Section_PNLvalue33.PNLA_Unit_Width
                         +n221B1*N222B1*One_Section_PNLvalue33.PNLb_Unit_Long_Number*One_Section_PNLvalue33.PNLb_Unit_Width_Number
                                        *One_Section_PNLvalue33.PNLb_Unit_Long*One_Section_PNLvalue33.PNLb_Unit_Width;
                  rate207:=rate207/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
               end;
               if Tem_Calculate_Rate_Type1=2 then //用PNL计算
               begin
                  rate207:=N233A1*N234A1*One_Section_PNLvalue33.PNLA_Long *One_Section_PNLvalue33.PNLA_Width
                           +n221B1*N222B1*One_Section_PNLvalue33.PNLb_Long *One_Section_PNLvalue33.PNLb_Width;
                  rate207:=rate207/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
               END;
              //小二区长排PNLB宽,小三区可排PNLA,则只两种
              rate208:=n223B1*N224B1*One_Section_PNLvalue33.PNLB_Unit_Long_Number*One_Section_PNLvalue33.PNLB_Unit_Width_Number
                       +N231A1*N232A1*One_Section_PNLvalue33.PNLA_Unit_Long_Number*One_Section_PNLvalue33.PNLA_Unit_Width_NumbeR;

              if Tem_Calculate_Rate_Type1=1 then  //用单元计算
               begin
                  rate208:=N231A1*N232A1*One_Section_PNLvalue33.PNLA_Unit_Long_Number*One_Section_PNLvalue33.PNLA_Unit_Width_Number
                                          *One_Section_PNLvalue33.PNLA_Unit_Long*One_Section_PNLvalue33.PNLA_Unit_Width
                         +n223B1*N224B1*One_Section_PNLvalue33.PNLb_Unit_Long_Number*One_Section_PNLvalue33.PNLb_Unit_Width_Number
                                        *One_Section_PNLvalue33.PNLb_Unit_Long*One_Section_PNLvalue33.PNLb_Unit_Width;
                  rate208:=rate208/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
               end;
               if Tem_Calculate_Rate_Type1=2 then //用PNL计算
               begin
                  rate208:=N231A1*N232A1*One_Section_PNLvalue33.PNLA_Long *One_Section_PNLvalue33.PNLA_Width
                           +n223B1*N224B1*One_Section_PNLvalue33.PNLb_Long *One_Section_PNLvalue33.PNLb_Width;
                  rate208:=rate208/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
               END;


              rate209:=n223B1*N224B1*One_Section_PNLvalue33.PNLB_Unit_Long_Number*One_Section_PNLvalue33.PNLB_Unit_Width_Number
                       +N233A1*N234A1*One_Section_PNLvalue33.PNLA_Unit_Long_Number*One_Section_PNLvalue33.PNLA_Unit_Width_NumbeR;

              if Tem_Calculate_Rate_Type1=1 then  //用单元计算
               begin
                  rate209:=N233A1*N234A1*One_Section_PNLvalue33.PNLA_Unit_Long_Number*One_Section_PNLvalue33.PNLA_Unit_Width_Number
                                          *One_Section_PNLvalue33.PNLA_Unit_Long*One_Section_PNLvalue33.PNLA_Unit_Width
                         +n223B1*N224B1*One_Section_PNLvalue33.PNLb_Unit_Long_Number*One_Section_PNLvalue33.PNLb_Unit_Width_Number
                                        *One_Section_PNLvalue33.PNLb_Unit_Long*One_Section_PNLvalue33.PNLb_Unit_Width;
                  rate209:=rate209/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
               end;
               if Tem_Calculate_Rate_Type1=2 then //用PNL计算
               begin
                  rate209:=N233A1*N234A1*One_Section_PNLvalue33.PNLA_Long *One_Section_PNLvalue33.PNLA_Width
                           +n223B1*N224B1*One_Section_PNLvalue33.PNLb_Long *One_Section_PNLvalue33.PNLb_Width;
                  rate209:=rate209/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
               END;
              //小二区长排PNLB长,小三区可排PNLB,则只两种
              rate210:=(n221B1*N222B1+N231B1*N232B1)*One_Section_PNLvalue33.PNLB_Unit_Long_Number*One_Section_PNLvalue33.PNLB_Unit_Width_Number;
              if Tem_Calculate_Rate_Type1=1 then  //用单元计算
               begin
                  rate210:=(n221B1*N222B1+N231B1*N232B1)*One_Section_PNLvalue33.PNLb_Unit_Long_Number*One_Section_PNLvalue33.PNLb_Unit_Width_Number
                         *One_Section_PNLvalue33.PNLb_Unit_Long*One_Section_PNLvalue33.PNLb_Unit_Width;
                  rate210:=rate210/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
               end;
               if Tem_Calculate_Rate_Type1=2 then //用PNL计算
               begin
                  rate210:=(n221B1*N222B1+N231B1*N232B1)
                         *One_Section_PNLvalue33.PNLb_Long *One_Section_PNLvalue33.PNLb_Width;
                  rate210:=rate210/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
               END;
              rate211:=(n221B1*N222B1+N233B1*N234B1)*One_Section_PNLvalue33.PNLB_Unit_Long_Number*One_Section_PNLvalue33.PNLB_Unit_Width_Number;
              if Tem_Calculate_Rate_Type1=1 then  //用单元计算
               begin
                  rate211:=(n221B1*N222B1+N233B1*N234B1)*One_Section_PNLvalue33.PNLb_Unit_Long_Number*One_Section_PNLvalue33.PNLb_Unit_Width_Number
                         *One_Section_PNLvalue33.PNLb_Unit_Long*One_Section_PNLvalue33.PNLb_Unit_Width;
                  rate211:=rate211/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
               end;
               if Tem_Calculate_Rate_Type1=2 then //用PNL计算
               begin
                  rate211:=(n221B1*N222B1+N233B1*N234B1)
                         *One_Section_PNLvalue33.PNLb_Long *One_Section_PNLvalue33.PNLb_Width;
                  rate211:=rate211/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
               END;
              //小二区长排PNLB宽,小三区可排PNLB,则只两种
              rate212:=(n223B1*N224B1+N231B1*N232B1)*One_Section_PNLvalue33.PNLB_Unit_Long_Number*One_Section_PNLvalue33.PNLB_Unit_Width_Number;
              if Tem_Calculate_Rate_Type1=1 then  //用单元计算
               begin
                  rate212:=(n223B1*N224B1+N231B1*N232B1)*One_Section_PNLvalue33.PNLb_Unit_Long_Number*One_Section_PNLvalue33.PNLb_Unit_Width_Number
                         *One_Section_PNLvalue33.PNLb_Unit_Long*One_Section_PNLvalue33.PNLb_Unit_Width;
                  rate212:=rate212/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
               end;
               if Tem_Calculate_Rate_Type1=2 then //用PNL计算
               begin
                  rate212:=(n223B1*N224B1+N231B1*N232B1)
                         *One_Section_PNLvalue33.PNLb_Long *One_Section_PNLvalue33.PNLb_Width;
                  rate212:=rate212/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
               END;

              rate213:=(n223B1*N224B1+N233B1*N234B1)*One_Section_PNLvalue33.PNLB_Unit_Long_Number*One_Section_PNLvalue33.PNLB_Unit_Width_Number;

              if Tem_Calculate_Rate_Type1=1 then  //用单元计算
               begin
                  rate213:=(n223B1*N224B1+N233B1*N234B1)*One_Section_PNLvalue33.PNLb_Unit_Long_Number*One_Section_PNLvalue33.PNLb_Unit_Width_Number
                         *One_Section_PNLvalue33.PNLb_Unit_Long*One_Section_PNLvalue33.PNLb_Unit_Width;
                  rate213:=rate213/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
               end;
               if Tem_Calculate_Rate_Type1=2 then //用PNL计算
               begin
                  rate213:=(n223B1*N224B1+N233B1*N234B1)
                         *One_Section_PNLvalue33.PNLb_Long *One_Section_PNLvalue33.PNLb_Width;
                  rate213:=rate213/value333_sheet.Shet_Long/value333_sheet.Sheet_Width;
               END;

             //2:小二区排PNLA,小三区排PNLB;分多种情况:小二区长边排宽,小三区长边排长;小二区长边排宽,小三区长边排宽;

             //3:小二区排PNLB,小三区排PNLA;

             //4:小二区,小三区排PNLB

//---------------------------
            //                            |--------|-------|
           //第一种排法,第一刀与宽平行开  |小一区  |小二区 |
            //                            |----------------|
           //                             | 小三区         |
           //                             |----------------|

           //小二区PNLA宽排长边   Two_Section_value333.Sheet_Width
             n221A2:=0;
             n222A2:=0;
             if (Two_Section_value333.Sheet_long-i21*One_Section_PNLvalue33.PNLA_Long>=One_Section_PNLvalue33.PNLA_Width)
               and (J21*One_Section_PNLvalue33.PNLA_Width>=One_Section_PNLvalue33.PNLA_Long) then
               begin
                 n221A2:=trunc((Two_Section_value333.Sheet_long-i21*One_Section_PNLvalue33.PNLA_Long)/One_Section_PNLvalue33.PNLA_Width);
                 n222A2:=trunc(J21*One_Section_PNLvalue33.PNLA_Width/One_Section_PNLvalue33.PNLA_Long);
              end;
              //小三区PNLA宽排长边  i21*One_Section_PNLvalue33.PNLA_Long
              n231A2:=0;
              n232A2:=0;
              if (Two_Section_value333.Sheet_long>=One_Section_PNLvalue33.PNLA_Width)
               and ((Two_Section_value333.Sheet_Width-j21*One_Section_PNLvalue33.PNLA_Width)>=One_Section_PNLvalue33.PNLA_Long) then
               begin
                 n231A2:=trunc(Two_Section_value333.Sheet_long/One_Section_PNLvalue33.PNLA_Width);
                 n232A2:=trunc((Two_Section_value333.Sheet_Width-j21*One_Section_PNLvalue33.PNLA_Width)/One_Section_PNLvalue33.PNLA_Long);
              end;
              //小三区PNLA宽排长边
              n233A2:=0;
              n234A2:=0;
              if (Two_Section_value333.Sheet_long>=One_Section_PNLvalue33.PNLA_Long)
               and ((Two_Section_value333.Sheet_Width-j21*One_Section_PNLvalue33.PNLA_Width)>=One_Section_PNLvalue33.PNLA_Width) then
               begin
                 n233A2:=trunc(Two_Section_value333.Sheet_long/One_Section_PNLvalue33.PNLA_Long);
                 n234A2:=trunc((Two_Section_value333.Sheet_Width-j21*One_Section_PNLvalue33.PNLA_Width)/One_Section_PNLvalue33.PNLA_Width);
              end;
              //小二区PNLA长排长边
              n223A2:=0;
              n224A2:=0;
              if (Two_Section_value333.Sheet_long-i21*One_Section_PNLvalue33.PNLA_Long>=One_Section_PNLvalue33.PNLA_Long)
               and (J21*One_Section_PNLvalue33.PNLA_Width>=One_Section_PNLvalue33.PNLA_Width) then
               begin
                 n223A2:=trunc((Two_Section_value333.Sheet_long-i21*One_Section_PNLvalue33.PNLA_Long)/One_Section_PNLvalue33.PNLA_Long);
                 n224A2:=trunc(J21*One_Section_PNLvalue33.PNLA_Width/One_Section_PNLvalue33.PNLA_Width);
              end;

              {
              //小二区PNLB宽排长边



              rate221:=(n221A2*N222A2+N233A2*N234a2)*One_Section_PNLvalue33.PNLA_Unit_Long_Number*One_Section_PNLvalue33.PNLA_Unit_Width_Number;
              if Tem_Calculate_Rate_Type1=1 then  //用单元计算
               begin
                  rate221:=(n221A2*N222A2+N233A2*N234a2)*One_Section_PNLvalue33.PNLA_Unit_Long_Number*One_Section_PNLvalue33.PNLA_Unit_Width_Number
                                          *One_Section_PNLvalue33.PNLA_Unit_Long*One_Section_PNLvalue33.PNLA_Unit_Width ;
                  rate221:=rate221/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
               end;
               if Tem_Calculate_Rate_Type1=2 then //用PNL计算
               begin
                  rate221:=(n221A2*N222A2+N233A2*N234a2)*One_Section_PNLvalue33.PNLA_Long *One_Section_PNLvalue33.PNLA_Width;
                  rate221:=rate221/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
               END;
                //小二区长排PNLA宽,小三区可排PNLA,则有两种
              rate222:=(n223A2*N224A2+N231A2*N232a2)*One_Section_PNLvalue33.PNLA_Unit_Long_Number*One_Section_PNLvalue33.PNLA_Unit_Width_Number;
              if Tem_Calculate_Rate_Type1=1 then  //用单元计算
               begin
                  rate222:=(n223A2*N224A2+N231A2*N232a2)*One_Section_PNLvalue33.PNLA_Unit_Long_Number*One_Section_PNLvalue33.PNLA_Unit_Width_Number
                                          *One_Section_PNLvalue33.PNLA_Unit_Long*One_Section_PNLvalue33.PNLA_Unit_Width;
                  rate222:=rate222/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
               end;
               if Tem_Calculate_Rate_Type1=2 then //用PNL计算
               begin
                  rate222:=(n223A2*N224A2+N231A2*N232a2)*One_Section_PNLvalue33.PNLA_Long *One_Section_PNLvalue33.PNLA_Width ;
                  rate222:=rate222/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
               END;
              rate223:=(n223A2*N224A2+N233A2*N234a2)*One_Section_PNLvalue33.PNLA_Unit_Long_Number*One_Section_PNLvalue33.PNLA_Unit_Width_Number;
              if Tem_Calculate_Rate_Type1=1 then  //用单元计算
               begin
                  rate223:=(n223A2*N224A2+N233A2*N234a2)*One_Section_PNLvalue33.PNLA_Unit_Long_Number*One_Section_PNLvalue33.PNLA_Unit_Width_Number
                                          *One_Section_PNLvalue33.PNLA_Unit_Long*One_Section_PNLvalue33.PNLA_Unit_Width ;
                  rate223:=rate223/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
               end;
               if Tem_Calculate_Rate_Type1=2 then //用PNL计算
               begin
                  rate223:=(n223A2*N224A2+N233A2*N234a2)*One_Section_PNLvalue33.PNLA_Long *One_Section_PNLvalue33.PNLA_Width;
                  rate223:=rate223/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
               END;




               //小二区长排PNLA长,小三区可排PNLb,则只两种
              rate224:=n221A2*N222A2*One_Section_PNLvalue33.PNLA_Unit_Long_Number*One_Section_PNLvalue33.PNLA_Unit_Width_Number
                     +N231B2*N232B2*One_Section_PNLvalue33.PNLb_Unit_Long_Number*One_Section_PNLvalue33.PNLb_Unit_Width_Number;
               if Tem_Calculate_Rate_Type1=1 then  //用单元计算
               begin
                  rate224:=n221A2*N222A2*One_Section_PNLvalue33.PNLA_Unit_Long_Number*One_Section_PNLvalue33.PNLA_Unit_Width_Number
                                          *One_Section_PNLvalue33.PNLA_Unit_Long*One_Section_PNLvalue33.PNLA_Unit_Width
                         +N231B2*N232B2*One_Section_PNLvalue33.PNLb_Unit_Long_Number*One_Section_PNLvalue33.PNLb_Unit_Width_Number
                                        *One_Section_PNLvalue33.PNLb_Unit_Long*One_Section_PNLvalue33.PNLb_Unit_Width;
                  rate224:=rate224/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
               end;
               if Tem_Calculate_Rate_Type1=2 then //用PNL计算
               begin
                  rate224:=n221A2*N222A2*One_Section_PNLvalue33.PNLA_Long *One_Section_PNLvalue33.PNLA_Width
                           +N231B2*N232B2*One_Section_PNLvalue33.PNLb_Long *One_Section_PNLvalue33.PNLb_Width;
                  rate224:=rate224/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
               END;

              rate225:=n221A2*N222A2*One_Section_PNLvalue33.PNLA_Unit_Long_Number*One_Section_PNLvalue33.PNLA_Unit_Width_Number
                     +N233B2*N234B2*One_Section_PNLvalue33.PNLb_Unit_Long_Number*One_Section_PNLvalue33.PNLb_Unit_Width_Number;
              if Tem_Calculate_Rate_Type1=1 then  //用单元计算
               begin
                  rate225:=n221A2*N222A2*One_Section_PNLvalue33.PNLA_Unit_Long_Number*One_Section_PNLvalue33.PNLA_Unit_Width_Number
                                          *One_Section_PNLvalue33.PNLA_Unit_Long*One_Section_PNLvalue33.PNLA_Unit_Width
                         +N233B2*N234B2*One_Section_PNLvalue33.PNLb_Unit_Long_Number*One_Section_PNLvalue33.PNLb_Unit_Width_Number
                                        *One_Section_PNLvalue33.PNLb_Unit_Long*One_Section_PNLvalue33.PNLb_Unit_Width;
                  rate225:=rate225/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
               end;
               if Tem_Calculate_Rate_Type1=2 then //用PNL计算
               begin
                  rate225:=n221A2*N222A2*One_Section_PNLvalue33.PNLA_Long *One_Section_PNLvalue33.PNLA_Width
                           +N233B2*N234B2*One_Section_PNLvalue33.PNLb_Long *One_Section_PNLvalue33.PNLb_Width;
                  rate225:=rate225/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
               END;




              //小二区长排PNLB长,小三区可排PNLA,则只两种
              rate226:=n221B2*N222B2*One_Section_PNLvalue33.PNLb_Unit_Long_Number*One_Section_PNLvalue33.PNLb_Unit_Width_Number
                       +N231A2*N232A2*One_Section_PNLvalue33.PNLA_Unit_Long_Number*One_Section_PNLvalue33.PNLA_Unit_Width_Number;
               if Tem_Calculate_Rate_Type1=1 then  //用单元计算
               begin
                  rate226:=N231A2*N232A2*One_Section_PNLvalue33.PNLA_Unit_Long_Number*One_Section_PNLvalue33.PNLA_Unit_Width_Number
                                          *One_Section_PNLvalue33.PNLA_Unit_Long*One_Section_PNLvalue33.PNLA_Unit_Width
                         +n221B2*N222B2*One_Section_PNLvalue33.PNLb_Unit_Long_Number*One_Section_PNLvalue33.PNLb_Unit_Width_Number
                                        *One_Section_PNLvalue33.PNLb_Unit_Long*One_Section_PNLvalue33.PNLb_Unit_Width;
                  rate226:=rate226/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
               end;
               if Tem_Calculate_Rate_Type1=2 then //用PNL计算
               begin
                  rate226:=N231A2*N232A2*One_Section_PNLvalue33.PNLA_Long *One_Section_PNLvalue33.PNLA_Width
                           +n221B2*N222B2*One_Section_PNLvalue33.PNLb_Long *One_Section_PNLvalue33.PNLb_Width;
                  rate226:=rate226/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
               END;

              rate227:=n221B2*N222B2*One_Section_PNLvalue33.PNLb_Unit_Long_Number*One_Section_PNLvalue33.PNLb_Unit_Width_Number
                       +N233A2*N234A2*One_Section_PNLvalue33.PNLA_Unit_Long_Number*One_Section_PNLvalue33.PNLA_Unit_Width_Number;
              if Tem_Calculate_Rate_Type1=1 then  //用单元计算
               begin
                  rate227:=N233A2*N234A2*One_Section_PNLvalue33.PNLA_Unit_Long_Number*One_Section_PNLvalue33.PNLA_Unit_Width_Number
                                          *One_Section_PNLvalue33.PNLA_Unit_Long*One_Section_PNLvalue33.PNLA_Unit_Width
                         +n221B2*N222B2*One_Section_PNLvalue33.PNLb_Unit_Long_Number*One_Section_PNLvalue33.PNLb_Unit_Width_Number
                                        *One_Section_PNLvalue33.PNLb_Unit_Long*One_Section_PNLvalue33.PNLb_Unit_Width;
                  rate227:=rate227/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
               end;
               if Tem_Calculate_Rate_Type1=2 then //用PNL计算
               begin
                  rate227:=N233A2*N234A2*One_Section_PNLvalue33.PNLA_Long *One_Section_PNLvalue33.PNLA_Width
                           +n221B2*N222B2*One_Section_PNLvalue33.PNLb_Long *One_Section_PNLvalue33.PNLb_Width;
                  rate227:=rate227/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
               END;

              //小二区长排PNLB宽,小三区可排PNLA,则只两种
              rate228:=n223B2*N224B2*One_Section_PNLvalue33.PNLb_Unit_Long_Number*One_Section_PNLvalue33.PNLb_Unit_Width_Number
                       +N231A2*N232A2*One_Section_PNLvalue33.PNLA_Unit_Long_Number*One_Section_PNLvalue33.PNLA_Unit_Width_Number;
              if Tem_Calculate_Rate_Type1=1 then  //用单元计算
               begin
                  rate228:=N231A2*N232A2*One_Section_PNLvalue33.PNLA_Unit_Long_Number*One_Section_PNLvalue33.PNLA_Unit_Width_Number
                                          *One_Section_PNLvalue33.PNLA_Unit_Long*One_Section_PNLvalue33.PNLA_Unit_Width
                         +n223B2*N224B2*One_Section_PNLvalue33.PNLb_Unit_Long_Number*One_Section_PNLvalue33.PNLb_Unit_Width_Number
                                        *One_Section_PNLvalue33.PNLb_Unit_Long*One_Section_PNLvalue33.PNLb_Unit_Width;
                  rate228:=rate228/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
               end;
               if Tem_Calculate_Rate_Type1=2 then //用PNL计算
               begin
                  rate228:=N231A2*N232A2*One_Section_PNLvalue33.PNLA_Long *One_Section_PNLvalue33.PNLA_Width
                           +n223B2*N224B2*One_Section_PNLvalue33.PNLb_Long *One_Section_PNLvalue33.PNLb_Width;
                  rate228:=rate228/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
               END;

              rate229:=n223B2*N224B2*One_Section_PNLvalue33.PNLb_Unit_Long_Number*One_Section_PNLvalue33.PNLb_Unit_Width_Number
                       +N233A2*N234A2*One_Section_PNLvalue33.PNLA_Unit_Long_Number*One_Section_PNLvalue33.PNLA_Unit_Width_Number;
              if Tem_Calculate_Rate_Type1=1 then  //用单元计算
               begin
                  rate229:=N233A2*N234A2*One_Section_PNLvalue33.PNLA_Unit_Long_Number*One_Section_PNLvalue33.PNLA_Unit_Width_Number
                                          *One_Section_PNLvalue33.PNLA_Unit_Long*One_Section_PNLvalue33.PNLA_Unit_Width
                         +n223B2*N224B2*One_Section_PNLvalue33.PNLb_Unit_Long_Number*One_Section_PNLvalue33.PNLb_Unit_Width_Number
                                        *One_Section_PNLvalue33.PNLb_Unit_Long*One_Section_PNLvalue33.PNLb_Unit_Width;
                  rate229:=rate229/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
               end;
               if Tem_Calculate_Rate_Type1=2 then //用PNL计算
               begin
                  rate229:=N233A2*N234A2*One_Section_PNLvalue33.PNLA_Long *One_Section_PNLvalue33.PNLA_Width
                           +n223B2*N224B2*One_Section_PNLvalue33.PNLb_Long *One_Section_PNLvalue33.PNLb_Width;
                  rate229:=rate229/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
               END;

              //小二区长排PNLB长,小三区可排PNLB,则只两种
              rate230:=(n221B2*N222B2+N231B2*N232B2)*One_Section_PNLvalue33.PNLB_Unit_Long_Number*One_Section_PNLvalue33.PNLB_Unit_Width_Number;
              if Tem_Calculate_Rate_Type1=1 then  //用单元计算
               begin
                  rate230:=(n221B2*N222B2+N231B2*N232B2)*One_Section_PNLvalue33.PNLb_Unit_Long_Number*One_Section_PNLvalue33.PNLb_Unit_Width_Number
                                        *One_Section_PNLvalue33.PNLb_Unit_Long*One_Section_PNLvalue33.PNLb_Unit_Width;
                  rate230:=rate230/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
               end;
               if Tem_Calculate_Rate_Type1=2 then //用PNL计算
               begin
                  rate230:=(n221B2*N222B2+N231B2*N232B2)*One_Section_PNLvalue33.PNLb_Long *One_Section_PNLvalue33.PNLb_Width;
                  rate230:=rate230/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
               END;

              rate231:=(n221B2*N222B2+N233B2*N234B2)*One_Section_PNLvalue33.PNLB_Unit_Long_Number*One_Section_PNLvalue33.PNLB_Unit_Width_Number;
              if Tem_Calculate_Rate_Type1=1 then  //用单元计算
               begin
                  rate231:=(n221B2*N222B2+N233B2*N234B2)*One_Section_PNLvalue33.PNLb_Unit_Long_Number*One_Section_PNLvalue33.PNLb_Unit_Width_Number
                                        *One_Section_PNLvalue33.PNLb_Unit_Long*One_Section_PNLvalue33.PNLb_Unit_Width;
                  rate231:=rate231/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
               end;
               if Tem_Calculate_Rate_Type1=2 then //用PNL计算
               begin
                  rate231:=(n221B2*N222B2+N233B2*N234B2)*One_Section_PNLvalue33.PNLb_Long *One_Section_PNLvalue33.PNLb_Width;
                  rate231:=rate231/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
               END;

              //小二区长排PNLB宽,小三区可排PNLB,则只两种
              rate232:=(n223B2*N224B2+N231B2*N232B2)*One_Section_PNLvalue33.PNLB_Unit_Long_Number*One_Section_PNLvalue33.PNLB_Unit_Width_Number;
              if Tem_Calculate_Rate_Type1=1 then  //用单元计算
               begin
                  rate232:=(n223B2*N224B2+N231B2*N232B2)*One_Section_PNLvalue33.PNLb_Unit_Long_Number*One_Section_PNLvalue33.PNLb_Unit_Width_Number
                                        *One_Section_PNLvalue33.PNLb_Unit_Long*One_Section_PNLvalue33.PNLb_Unit_Width;
                  rate232:=rate232/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
               end;
               if Tem_Calculate_Rate_Type1=2 then //用PNL计算
               begin
                  rate223:=(n223B2*N224B2+N231B2*N232B2)*One_Section_PNLvalue33.PNLb_Long *One_Section_PNLvalue33.PNLb_Width;
                  rate232:=rate232/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
               END;

              rate233:=(n223B2*N224B2+N233B2*N234B2)*One_Section_PNLvalue33.PNLB_Unit_Long_Number*One_Section_PNLvalue33.PNLB_Unit_Width_Number;
              if Tem_Calculate_Rate_Type1=1 then  //用单元计算
               begin
                  rate233:=(n223B2*N224B2+N233B2*N234B2)*One_Section_PNLvalue33.PNLb_Unit_Long_Number*One_Section_PNLvalue33.PNLb_Unit_Width_Number
                                        *One_Section_PNLvalue33.PNLb_Unit_Long*One_Section_PNLvalue33.PNLb_Unit_Width;
                  rate233:=rate233/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
               end;
               if Tem_Calculate_Rate_Type1=2 then //用PNL计算
               begin
                  rate233:=(n223B2*N224B2+N233B2*N234B2)*One_Section_PNLvalue33.PNLb_Long *One_Section_PNLvalue33.PNLb_Width;
                  rate233:=rate233/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
               END;
             //2:小二区排PNLA,小三区排PNLB;分多种情况:小二区长边排宽,小三区长边排长;小二区长边排宽,小三区长边排宽;

             //3:小二区排PNLB,小三区排PNLA;

             //4:小二区,小三区排PNLB



            //从找出利用率最大的    200        201   213    221  233
             max21:=MAX(MAX(MAX(MAX(MAX(MAX(MAX(MAX(MAX(MAX(MAX(MAX(MAX(MAX(MAX(MAX(MAX(MAX(MAX(MAX(MAX(MAX(MAX(rate231,rate230),rate229),rate228),rate227),rate226),rate225),rate224),rate223),rate222),rate221),rate213),rate211),rate210),rate209),rate208),rate207),rate206),rate205),rate204),rate203),rate202),rate201),rate200);
             tem_rate2:=max21;

             if  rate233=max21 then //(n223B2*N224B2+N233B2*N234B2)
             begin  //N后的第三位数字表示长宽量是否调换,如为3,4则调换,后面的字母表示是第一种还是第二种排法,A表示第一种排法;B表示第二种排法
                array_type2:=33;   //小二区长排PNLB宽;小三区长排PNLB宽
                tempnl_sheet22.Section_LongA:=One_Section_PNLvalue33.PNLA_Long;
                tempnl_sheet22.Section_WidthA:=One_Section_PNLvalue33.PNLA_Width;
                tempnl_sheet22.Section_Long_NumberA:=i21;
                tempnl_sheet22.Section_Width_NumberA:=j21;
                tempnl_sheet22.Section_LongB:=One_Section_PNLvalue33.PNLb_Width;
                tempnl_sheet22.Section_WidthB:=One_Section_PNLvalue33.PNLb_Long;
                tempnl_sheet22.Section_Long_NumberB:=n223B2;
                tempnl_sheet22.Section_Width_NumberB:=N224B2;
                tempnl_sheet22.Section_LongB:=One_Section_PNLvalue33.PNLb_Width;
                tempnl_sheet22.Section_WidthB:=One_Section_PNLvalue33.PNLb_Long;
                tempnl_sheet22.Section_Long_NumberB:=N233B2;
                tempnl_sheet22.Section_Width_NumberB:=N234B2;
                tempnl_sheet22.Section_Unit_Number:=(n223B2*N224B2+N233B2*N234B2)*One_Section_PNLvalue33.PNLB_Unit_Long_Number*One_Section_PNLvalue33.PNLB_Unit_Width_Number+I21*J21*One_Section_PNLvalue33.PNLA_Unit_Long_Number*One_Section_PNLvalue33.PNLA_Unit_Width_Number;
             end;
             if  rate232=max21 then //(n223B2*N224B2+N231B2*N232B2)
             begin  //N后的第三位数字表示长宽量是否调换,如为3,4则调换,后面的字母表示是第一种还是第二种排法,A表示第一种排法;B表示第二种排法
                array_type2:=32;   //小二区长排PNLB宽;小三区长排PNLB宽
                tempnl_sheet22.Section_LongA:=One_Section_PNLvalue33.PNLA_Long;
                tempnl_sheet22.Section_WidthA:=One_Section_PNLvalue33.PNLA_Width;
                tempnl_sheet22.Section_Long_NumberA:=i21;
                tempnl_sheet22.Section_Width_NumberA:=j21;
                tempnl_sheet22.Section_LongB:=One_Section_PNLvalue33.PNLb_Width;
                tempnl_sheet22.Section_WidthB:=One_Section_PNLvalue33.PNLb_Long;
                tempnl_sheet22.Section_Long_NumberB:=n223B2;
                tempnl_sheet22.Section_Width_NumberB:=N224B2;
                tempnl_sheet22.Section_LongB:=One_Section_PNLvalue33.PNLb_Long;
                tempnl_sheet22.Section_WidthB:=One_Section_PNLvalue33.PNLb_Width;
                tempnl_sheet22.Section_Long_NumberB:=N231B2;
                tempnl_sheet22.Section_Width_NumberB:=N232B2;
                tempnl_sheet22.Section_Unit_Number:=(n223B2*N224B2+N231B2*N232B2)*One_Section_PNLvalue33.PNLB_Unit_Long_Number*One_Section_PNLvalue33.PNLB_Unit_Width_Number+I21*J21*One_Section_PNLvalue33.PNLA_Unit_Long_Number*One_Section_PNLvalue33.PNLA_Unit_Width_Number;
             end;
             //小二区长排PNLB长,小三区可排PNLB,则只两种
             if  rate230=max21 then // rate230:=  (n221B2*N222B2+N231B2*N232B2)
             begin  //N后的第三位数字表示长宽量是否调换,如为3,4则调换,后面的字母表示是第一种还是第二种排法,A表示第一种排法;B表示第二种排法
                array_type2:=30;   //小二区长排PNLB宽;小三区长排PNLB宽
                tempnl_sheet22.Section_LongA:=One_Section_PNLvalue33.PNLA_Long;
                tempnl_sheet22.Section_WidthA:=One_Section_PNLvalue33.PNLA_Width;
                tempnl_sheet22.Section_Long_NumberA:=i21;
                tempnl_sheet22.Section_Width_NumberA:=j21;
                tempnl_sheet22.Section_LongB:=One_Section_PNLvalue33.PNLb_Long;
                tempnl_sheet22.Section_WidthB:=One_Section_PNLvalue33.PNLb_Width;
                tempnl_sheet22.Section_Long_NumberB:=n221B2;
                tempnl_sheet22.Section_Width_NumberB:=N222B2;
                tempnl_sheet22.Section_LongB:=One_Section_PNLvalue33.PNLb_Long;
                tempnl_sheet22.Section_WidthB:=One_Section_PNLvalue33.PNLb_Width;
                tempnl_sheet22.Section_Long_NumberB:=N231B2;
                tempnl_sheet22.Section_Width_NumberB:=N232B2;
                tempnl_sheet22.Section_Unit_Number:=(n221B2*N222B2+N231B2*N232B2)*One_Section_PNLvalue33.PNLB_Unit_Long_Number*One_Section_PNLvalue33.PNLB_Unit_Width_Number+I21*J21*One_Section_PNLvalue33.PNLA_Unit_Long_Number*One_Section_PNLvalue33.PNLA_Unit_Width_Number;
             end;
             if  rate231=max21 then //rate231:=(n221B2*N222B2+N233B2*N234B2)
             begin  //N后的第三位数字表示长宽量是否调换,如为3,4则调换,后面的字母表示是第一种还是第二种排法,A表示第一种排法;B表示第二种排法
                array_type2:=31;   //小二区长排PNLB宽;小三区长排PNLB宽
                tempnl_sheet22.Section_LongA:=One_Section_PNLvalue33.PNLA_Long;
                tempnl_sheet22.Section_WidthA:=One_Section_PNLvalue33.PNLA_Width;
                tempnl_sheet22.Section_Long_NumberA:=i21;
                tempnl_sheet22.Section_Width_NumberA:=j21;
                tempnl_sheet22.Section_LongB:=One_Section_PNLvalue33.PNLb_Long ;
                tempnl_sheet22.Section_WidthB:=One_Section_PNLvalue33.PNLb_Width;
                tempnl_sheet22.Section_Long_NumberB:=n221B2;
                tempnl_sheet22.Section_Width_NumberB:=N222B2;
                tempnl_sheet22.Section_LongB:=One_Section_PNLvalue33.PNLb_Long;
                tempnl_sheet22.Section_WidthB:=One_Section_PNLvalue33.PNLb_Width;
                tempnl_sheet22.Section_Long_NumberB:=N231B2;
                tempnl_sheet22.Section_Width_NumberB:=N232B2;
                tempnl_sheet22.Section_Unit_Number:=(n221B2*N222B2+N233B2*N234B2)*One_Section_PNLvalue33.PNLB_Unit_Long_Number*One_Section_PNLvalue33.PNLB_Unit_Width_Number+I21*J21*One_Section_PNLvalue33.PNLA_Unit_Long_Number*One_Section_PNLvalue33.PNLA_Unit_Width_Number;
             end;
            //小二区长排PNLB宽,小三区可排PNLA,则只两种
            if  rate229=max21 then //rate229:=n223B2*N224B2+N233A2*N234A2
             begin  //N后的第三位数字表示长宽量是否调换,如为3,4则调换,后面的字母表示是第一种还是第二种排法,A表示第一种排法;B表示第二种排法
                array_type2:=29;   //小二区长排PNLB宽;小三区长排PNLB宽
                tempnl_sheet22.Section_LongA:=One_Section_PNLvalue33.PNLA_Long;
                tempnl_sheet22.Section_WidthA:=One_Section_PNLvalue33.PNLA_Width;
                tempnl_sheet22.Section_Long_NumberA:=i21;
                tempnl_sheet22.Section_Width_NumberA:=j21;
                tempnl_sheet22.Section_LongB:=One_Section_PNLvalue33.PNLb_Width;
                tempnl_sheet22.Section_WidthB:=One_Section_PNLvalue33.PNLb_Long;
                tempnl_sheet22.Section_Long_NumberB:=n223B2;
                tempnl_sheet22.Section_Width_NumberB:=N224B2;
                tempnl_sheet22.Section_LongB:=One_Section_PNLvalue33.PNLa_Width;
                tempnl_sheet22.Section_WidthB:=One_Section_PNLvalue33.PNLa_Long;
                tempnl_sheet22.Section_Long_NumberB:=N233A2;
                tempnl_sheet22.Section_Width_NumberB:=N234A2;
               tempnl_sheet22.Section_Unit_Number:=N233A2*N234A2*One_Section_PNLvalue33.PNLa_Unit_Long_Number*One_Section_PNLvalue33.PNLa_Unit_Width_Number+n223B2*N224B2*One_Section_PNLvalue33.PNLB_Unit_Long_Number*One_Section_PNLvalue33.PNLB_Unit_Width_Number+I21*J21*One_Section_PNLvalue33.PNLA_Unit_Long_Number*One_Section_PNLvalue33.PNLA_Unit_Width_Number;
             end;

             if  rate228=max21 then //rate228:=n223B2*N224B2+N231A2*N232A2
             begin  //N后的第三位数字表示长宽量是否调换,如为3,4则调换,后面的字母表示是第一种还是第二种排法,A表示第一种排法;B表示第二种排法
                array_type2:=28;   //小二区长排PNLB宽;小三区长排PNLB宽
                tempnl_sheet22.Section_LongA:=One_Section_PNLvalue33.PNLA_Long;
                tempnl_sheet22.Section_WidthA:=One_Section_PNLvalue33.PNLA_Width;
                tempnl_sheet22.Section_Long_NumberA:=i21;
                tempnl_sheet22.Section_Width_NumberA:=j21;
                tempnl_sheet22.Section_LongB:=One_Section_PNLvalue33.PNLb_Width;
                tempnl_sheet22.Section_WidthB:=One_Section_PNLvalue33.PNLb_Long;
                tempnl_sheet22.Section_Long_NumberB:=n223B2;
                tempnl_sheet22.Section_Width_NumberB:=N224B2;
                tempnl_sheet22.Section_LongB:=One_Section_PNLvalue33.PNLa_Long;
                tempnl_sheet22.Section_WidthB:=One_Section_PNLvalue33.PNLa_Width;
                tempnl_sheet22.Section_Long_NumberB:=N231A2;
                tempnl_sheet22.Section_Width_NumberB:=N232A2;
                tempnl_sheet22.Section_Unit_Number:=N231A2*N232A2*One_Section_PNLvalue33.PNLa_Unit_Long_Number*One_Section_PNLvalue33.PNLa_Unit_Width_Number
                                                   +n223B2*N224B2*One_Section_PNLvalue33.PNLB_Unit_Long_Number*One_Section_PNLvalue33.PNLB_Unit_Width_Number
                                                   +I21*J21*One_Section_PNLvalue33.PNLA_Unit_Long_Number*One_Section_PNLvalue33.PNLA_Unit_Width_Number;
             end;

             //小二区长排PNLB长,小三区可排PNLA,则只两种
             if  rate227=max21 then //rate227:=n221B2*N222B2+N233A2*N234A2
             begin  //N后的第三位数字表示长宽量是否调换,如为3,4则调换,后面的字母表示是第一种还是第二种排法,A表示第一种排法;B表示第二种排法
                array_type2:=27;   //小二区长排PNLB宽;小三区长排PNLB宽
                tempnl_sheet22.Section_LongA:=One_Section_PNLvalue33.PNLA_Long;
                tempnl_sheet22.Section_WidthA:=One_Section_PNLvalue33.PNLA_Width;
                tempnl_sheet22.Section_Long_NumberA:=i21;
                tempnl_sheet22.Section_Width_NumberA:=j21;
                tempnl_sheet22.Section_LongB:=One_Section_PNLvalue33.PNLb_Long;
                tempnl_sheet22.Section_WidthB:=One_Section_PNLvalue33.PNLb_Width;
                tempnl_sheet22.Section_Long_NumberB:=n221B2;
                tempnl_sheet22.Section_Width_NumberB:=N222B2;
                tempnl_sheet22.Section_LongB:=One_Section_PNLvalue33.PNLa_Width;
                tempnl_sheet22.Section_WidthB:=One_Section_PNLvalue33.PNLa_Long;
                tempnl_sheet22.Section_Long_NumberB:=N233A2;
                tempnl_sheet22.Section_Width_NumberB:=N234A2;
                tempnl_sheet22.Section_Unit_Number:=N233A2*N234A2*One_Section_PNLvalue33.PNLa_Unit_Long_Number*One_Section_PNLvalue33.PNLa_Unit_Width_Number
                                                   +n221B2*N222B2*One_Section_PNLvalue33.PNLB_Unit_Long_Number*One_Section_PNLvalue33.PNLB_Unit_Width_Number
                                                   +I21*J21*One_Section_PNLvalue33.PNLA_Unit_Long_Number*One_Section_PNLvalue33.PNLA_Unit_Width_Number;
             end;

             if  rate226=max21 then //rate226:=n221B2*N222B2+N231A2*N232A2
             begin  //N后的第三位数字表示长宽量是否调换,如为3,4则调换,后面的字母表示是第一种还是第二种排法,A表示第一种排法;B表示第二种排法
                array_type2:=26;   //小二区长排PNLB宽;小三区长排PNLB宽
                tempnl_sheet22.Section_LongA:=One_Section_PNLvalue33.PNLA_Long;
                tempnl_sheet22.Section_WidthA:=One_Section_PNLvalue33.PNLA_Width;
                tempnl_sheet22.Section_Long_NumberA:=i21;
                tempnl_sheet22.Section_Width_NumberA:=j21;
                tempnl_sheet22.Section_LongB:=One_Section_PNLvalue33.PNLb_Long;
                tempnl_sheet22.Section_WidthB:=One_Section_PNLvalue33.PNLb_Width;
                tempnl_sheet22.Section_Long_NumberB:=n221B2;
                tempnl_sheet22.Section_Width_NumberB:=N222B2;
                tempnl_sheet22.Section_LongB:=One_Section_PNLvalue33.PNLa_Long;
                tempnl_sheet22.Section_WidthB:=One_Section_PNLvalue33.PNLa_Width;
                tempnl_sheet22.Section_Long_NumberB:=N231A2;
                tempnl_sheet22.Section_Width_NumberB:=N232A2;
                tempnl_sheet22.Section_Unit_Number:=N231A2*N232A2*One_Section_PNLvalue33.PNLa_Unit_Long_Number*One_Section_PNLvalue33.PNLa_Unit_Width_Number
                                                   +n221B2*N222B2*One_Section_PNLvalue33.PNLB_Unit_Long_Number*One_Section_PNLvalue33.PNLB_Unit_Width_Number
                                                   +I21*J21*One_Section_PNLvalue33.PNLA_Unit_Long_Number*One_Section_PNLvalue33.PNLA_Unit_Width_Number;
             end;

             //小二区长排PNLA长,小三区可排PNLb,则只两种
             if  rate225=max21 then // rate225:=n221A2*N222A2+N233B2*N234B2
             begin  //N后的第三位数字表示长宽量是否调换,如为3,4则调换,后面的字母表示是第一种还是第二种排法,A表示第一种排法;B表示第二种排法
                array_type2:=25;   //小二区长排PNLB宽;小三区长排PNLB宽
                tempnl_sheet22.Section_LongA:=One_Section_PNLvalue33.PNLA_Long;
                tempnl_sheet22.Section_WidthA:=One_Section_PNLvalue33.PNLA_Width;
                tempnl_sheet22.Section_Long_NumberA:=i21;
                tempnl_sheet22.Section_Width_NumberA:=j21;
                tempnl_sheet22.Section_LongB:=One_Section_PNLvalue33.PNLa_Long ;
                tempnl_sheet22.Section_WidthB:=One_Section_PNLvalue33.PNLa_Width ;
                tempnl_sheet22.Section_Long_NumberB:=n221A2;
                tempnl_sheet22.Section_Width_NumberB:=N222A2;
                tempnl_sheet22.Section_LongB:=One_Section_PNLvalue33.PNLb_Width;
                tempnl_sheet22.Section_WidthB:=One_Section_PNLvalue33.PNLb_Long;
                tempnl_sheet22.Section_Long_NumberB:=N233B2;
                tempnl_sheet22.Section_Width_NumberB:=N234B2;
                tempnl_sheet22.Section_Unit_Number:=n221A2*N222A2*One_Section_PNLvalue33.PNLa_Unit_Long_Number*One_Section_PNLvalue33.PNLa_Unit_Width_Number
                                                   +N233B2*N234B2*One_Section_PNLvalue33.PNLB_Unit_Long_Number*One_Section_PNLvalue33.PNLB_Unit_Width_Number
                                                   +I21*J21*One_Section_PNLvalue33.PNLA_Unit_Long_Number*One_Section_PNLvalue33.PNLA_Unit_Width_Number;
             end;

             if  rate224=max21 then // rate224:=n221A2*N222A2+N231B2*N232B2
             begin  //N后的第三位数字表示长宽量是否调换,如为3,4则调换,后面的字母表示是第一种还是第二种排法,A表示第一种排法;B表示第二种排法
                array_type2:=24;   //小二区长排PNLB宽;小三区长排PNLB宽
                tempnl_sheet22.Section_LongA:=One_Section_PNLvalue33.PNLA_Long;
                tempnl_sheet22.Section_WidthA:=One_Section_PNLvalue33.PNLA_Width;
                tempnl_sheet22.Section_Long_NumberA:=i21;
                tempnl_sheet22.Section_Width_NumberA:=j21;
                tempnl_sheet22.Section_LongB:=One_Section_PNLvalue33.PNLa_Long;
                tempnl_sheet22.Section_WidthB:=One_Section_PNLvalue33.PNLa_Width;
                tempnl_sheet22.Section_Long_NumberB:=n221A2;
                tempnl_sheet22.Section_Width_NumberB:=N222A2;
                tempnl_sheet22.Section_LongB:=One_Section_PNLvalue33.PNLb_Long;
                tempnl_sheet22.Section_WidthB:=One_Section_PNLvalue33.PNLb_Width;
                tempnl_sheet22.Section_Long_NumberB:=N231B2;
                tempnl_sheet22.Section_Width_NumberB:=N232B2;
                tempnl_sheet22.Section_Unit_Number:=n221A2*N222A2*One_Section_PNLvalue33.PNLa_Unit_Long_Number*One_Section_PNLvalue33.PNLa_Unit_Width_Number
                                                   +N231B2*N232B2*One_Section_PNLvalue33.PNLB_Unit_Long_Number*One_Section_PNLvalue33.PNLB_Unit_Width_Number
                                                   +I21*J21*One_Section_PNLvalue33.PNLA_Unit_Long_Number*One_Section_PNLvalue33.PNLA_Unit_Width_Number;
             end;

             if  rate223=max21 then //rate223:=(n223A2*N224A2+N233A2*N234a2)
             begin  //N后的第三位数字表示长宽量是否调换,如为3,4则调换,后面的字母表示是第一种还是第二种排法,A表示第一种排法;B表示第二种排法
                array_type2:=23;   //小二区长排PNLB宽;小三区长排PNLB宽
                tempnl_sheet22.Section_LongA:=One_Section_PNLvalue33.PNLA_Long;
                tempnl_sheet22.Section_WidthA:=One_Section_PNLvalue33.PNLA_Width;
                tempnl_sheet22.Section_Long_NumberA:=i21;
                tempnl_sheet22.Section_Width_NumberA:=j21;
                tempnl_sheet22.Section_LongB:=One_Section_PNLvalue33.PNLa_Width;
                tempnl_sheet22.Section_WidthB:=One_Section_PNLvalue33.PNLa_Long;
                tempnl_sheet22.Section_Long_NumberB:=n223A2;
                tempnl_sheet22.Section_Width_NumberB:=N224A2;
                tempnl_sheet22.Section_LongB:=One_Section_PNLvalue33.PNLa_Width;
                tempnl_sheet22.Section_WidthB:=One_Section_PNLvalue33.PNLa_Long;
                tempnl_sheet22.Section_Long_NumberB:=N233A2;
                tempnl_sheet22.Section_Width_NumberB:=N234a2;
                tempnl_sheet22.Section_Unit_Number:=(n223A2*N224A2+N233A2*N234a2)*One_Section_PNLvalue33.PNLa_Unit_Long_Number*One_Section_PNLvalue33.PNLa_Unit_Width_Number
                                                 //  +n223B2*N224B2*One_Section_PNLvalue33.PNLB_Unit_Long_Number*One_Section_PNLvalue33.PNLB_Unit_Width_Number
                                                   +I21*J21*One_Section_PNLvalue33.PNLA_Unit_Long_Number*One_Section_PNLvalue33.PNLA_Unit_Width_Number;
             end;

             if  rate222=max21 then //rate222:=(n223A2*N224A2+N231A2*N232a2)
             begin  //N后的第三位数字表示长宽量是否调换,如为3,4则调换,后面的字母表示是第一种还是第二种排法,A表示第一种排法;B表示第二种排法
                array_type2:=22;   //小二区长排PNLB宽;小三区长排PNLB宽
                tempnl_sheet22.Section_LongA:=One_Section_PNLvalue33.PNLA_Long;
                tempnl_sheet22.Section_WidthA:=One_Section_PNLvalue33.PNLA_Width;
                tempnl_sheet22.Section_Long_NumberA:=i21;
                tempnl_sheet22.Section_Width_NumberA:=j21;
                tempnl_sheet22.Section_LongB:=One_Section_PNLvalue33.PNLa_Width;
                tempnl_sheet22.Section_WidthB:=One_Section_PNLvalue33.PNLa_Long;
                tempnl_sheet22.Section_Long_NumberB:=n223A2;
                tempnl_sheet22.Section_Width_NumberB:=N224A2;
                tempnl_sheet22.Section_LongB:=One_Section_PNLvalue33.PNLa_Long;
                tempnl_sheet22.Section_WidthB:=One_Section_PNLvalue33.PNLa_Width;
                tempnl_sheet22.Section_Long_NumberB:=N231A2;
                tempnl_sheet22.Section_Width_NumberB:=N232a2;
                tempnl_sheet22.Section_Unit_Number:=(n223A2*N224A2+N231A2*N232a2)*One_Section_PNLvalue33.PNLa_Unit_Long_Number*One_Section_PNLvalue33.PNLa_Unit_Width_Number
                                                  // +n223B2*N224B2*One_Section_PNLvalue33.PNLB_Unit_Long_Number*One_Section_PNLvalue33.PNLB_Unit_Width_Number
                                                   +I21*J21*One_Section_PNLvalue33.PNLA_Unit_Long_Number*One_Section_PNLvalue33.PNLA_Unit_Width_Number;
             end;

             if  rate221=max21 then //rate221:=(n221A2*N222A2+N233A2*N234a2)
             begin  //N后的第三位数字表示长宽量是否调换,如为3,4则调换,后面的字母表示是第一种还是第二种排法,A表示第一种排法;B表示第二种排法
                array_type2:=21;   //小二区长排PNLB宽;小三区长排PNLB宽
                tempnl_sheet22.Section_LongA:=One_Section_PNLvalue33.PNLA_Long;
                tempnl_sheet22.Section_WidthA:=One_Section_PNLvalue33.PNLA_Width;
                tempnl_sheet22.Section_Long_NumberA:=i21;
                tempnl_sheet22.Section_Width_NumberA:=j21;
                tempnl_sheet22.Section_LongB:=One_Section_PNLvalue33.PNLa_Long;
                tempnl_sheet22.Section_WidthB:=One_Section_PNLvalue33.PNLa_Width;
                tempnl_sheet22.Section_Long_NumberB:=n221A2;
                tempnl_sheet22.Section_Width_NumberB:=N222A2;
                tempnl_sheet22.Section_LongB:=One_Section_PNLvalue33.PNLa_Width;
                tempnl_sheet22.Section_WidthB:=One_Section_PNLvalue33.PNLa_Long;
                tempnl_sheet22.Section_Long_NumberB:=N233A2;
                tempnl_sheet22.Section_Width_NumberB:=N234a2;
                tempnl_sheet22.Section_Unit_Number:=(n221A2*N222A2+N233A2*N234a2)*One_Section_PNLvalue33.PNLa_Unit_Long_Number*One_Section_PNLvalue33.PNLa_Unit_Width_Number
                                                   //+n223B2*N224B2*One_Section_PNLvalue33.PNLB_Unit_Long_Number*One_Section_PNLvalue33.PNLB_Unit_Width_Number
                                                   +I21*J21*One_Section_PNLvalue33.PNLA_Unit_Long_Number*One_Section_PNLvalue33.PNLA_Unit_Width_Number;
             end;
             //以下第一种排法,以上第二种排法
             if  rate213=max21 then // rate213:=(n223B1*N224B1+N233B1*N234B1)
             begin  //N后的第三位数字表示长宽量是否调换,如为3,4则调换,后面的字母表示是第一种还是第二种排法,A表示第一种排法;B表示第二种排法
                array_type2:=13;   //小二区长排PNLB宽;小三区长排PNLB宽
                tempnl_sheet22.Section_LongA:=One_Section_PNLvalue33.PNLA_Long;
                tempnl_sheet22.Section_WidthA:=One_Section_PNLvalue33.PNLA_Width;
                tempnl_sheet22.Section_Long_NumberA:=i21;
                tempnl_sheet22.Section_Width_NumberA:=j21;
                tempnl_sheet22.Section_LongB:=One_Section_PNLvalue33.PNLb_Width;
                tempnl_sheet22.Section_WidthB:=One_Section_PNLvalue33.PNLb_Long;
                tempnl_sheet22.Section_Long_NumberB:=n223B1;
                tempnl_sheet22.Section_Width_NumberB:=N224B1;
                tempnl_sheet22.Section_LongB:=One_Section_PNLvalue33.PNLb_Width;
                tempnl_sheet22.Section_WidthB:=One_Section_PNLvalue33.PNLb_Long;
                tempnl_sheet22.Section_Long_NumberB:=N233B1;
                tempnl_sheet22.Section_Width_NumberB:=N234B1;
                tempnl_sheet22.Section_Unit_Number:=//(n221A2*N222A2+N233A2*N234a2)*One_Section_PNLvalue33.PNLa_Unit_Long_Number*One_Section_PNLvalue33.PNLa_Unit_Width_Number
                                                   (n223B1*N224B1+N233B1*N234B1)*One_Section_PNLvalue33.PNLB_Unit_Long_Number*One_Section_PNLvalue33.PNLB_Unit_Width_Number
                                                   +I21*J21*One_Section_PNLvalue33.PNLA_Unit_Long_Number*One_Section_PNLvalue33.PNLA_Unit_Width_Number;
             end;

             if  rate212=max21 then //  rate212:=(n223B1*N224B1+N231B1*N232B1)
             begin  //N后的第三位数字表示长宽量是否调换,如为3,4则调换,后面的字母表示是第一种还是第二种排法,A表示第一种排法;B表示第二种排法
                array_type2:=12;   //小二区长排PNLB宽;小三区长排PNLB宽
                tempnl_sheet22.Section_LongA:=One_Section_PNLvalue33.PNLA_Long;
                tempnl_sheet22.Section_WidthA:=One_Section_PNLvalue33.PNLA_Width;
                tempnl_sheet22.Section_Long_NumberA:=i21;
                tempnl_sheet22.Section_Width_NumberA:=j21;
                tempnl_sheet22.Section_LongB:=One_Section_PNLvalue33.PNLb_Width;
                tempnl_sheet22.Section_WidthB:=One_Section_PNLvalue33.PNLb_Long;
                tempnl_sheet22.Section_Long_NumberB:=n223B1;
                tempnl_sheet22.Section_Width_NumberB:=N224B1;
                tempnl_sheet22.Section_LongB:=One_Section_PNLvalue33.PNLb_Long;
                tempnl_sheet22.Section_WidthB:=One_Section_PNLvalue33.PNLb_Width;
                tempnl_sheet22.Section_Long_NumberB:=N231B1;
                tempnl_sheet22.Section_Width_NumberB:=N232B1;
                tempnl_sheet22.Section_Unit_Number:=//(n221A2*N222A2+N233A2*N234a2)*One_Section_PNLvalue33.PNLa_Unit_Long_Number*One_Section_PNLvalue33.PNLa_Unit_Width_Number
                                                   (n223B1*N224B1+N231B1*N232B1)*One_Section_PNLvalue33.PNLB_Unit_Long_Number*One_Section_PNLvalue33.PNLB_Unit_Width_Number
                                                   +I21*J21*One_Section_PNLvalue33.PNLA_Unit_Long_Number*One_Section_PNLvalue33.PNLA_Unit_Width_Number;
             end;

             if  rate211=max21 then // rate211:=(n221B1*N222B1+N233B1*N234B1)
             begin  //N后的第三位数字表示长宽量是否调换,如为3,4则调换,后面的字母表示是第一种还是第二种排法,A表示第一种排法;B表示第二种排法
                array_type2:=11;   //小二区长排PNLB宽;小三区长排PNLB宽
                tempnl_sheet22.Section_LongA:=One_Section_PNLvalue33.PNLA_Long;
                tempnl_sheet22.Section_WidthA:=One_Section_PNLvalue33.PNLA_Width;
                tempnl_sheet22.Section_Long_NumberA:=i21;
                tempnl_sheet22.Section_Width_NumberA:=j21;
                tempnl_sheet22.Section_LongB:=One_Section_PNLvalue33.PNLb_Long;
                tempnl_sheet22.Section_WidthB:=One_Section_PNLvalue33.PNLb_Width;
                tempnl_sheet22.Section_Long_NumberB:=n221B1;
                tempnl_sheet22.Section_Width_NumberB:=N222B1;
                tempnl_sheet22.Section_LongB:=One_Section_PNLvalue33.PNLb_Width;
                tempnl_sheet22.Section_WidthB:=One_Section_PNLvalue33.PNLb_Long;
                tempnl_sheet22.Section_Long_NumberB:=N233B1;
                tempnl_sheet22.Section_Width_NumberB:=N234B1;
                tempnl_sheet22.Section_Unit_Number:=//(n221A2*N222A2+N233A2*N234a2)*One_Section_PNLvalue33.PNLa_Unit_Long_Number*One_Section_PNLvalue33.PNLa_Unit_Width_Number
                                                   (n221B1*N222B1+N233B1*N234B1)*One_Section_PNLvalue33.PNLB_Unit_Long_Number*One_Section_PNLvalue33.PNLB_Unit_Width_Number
                                                   +I21*J21*One_Section_PNLvalue33.PNLA_Unit_Long_Number*One_Section_PNLvalue33.PNLA_Unit_Width_Number;
             end;

             if  rate210=max21 then // rate210:=(n221B1*N222B1+N231B1*N232B1)
             begin  //N后的第三位数字表示长宽量是否调换,如为3,4则调换,后面的字母表示是第一种还是第二种排法,A表示第一种排法;B表示第二种排法
                array_type2:=10;   //小二区长排PNLB宽;小三区长排PNLB宽
                tempnl_sheet22.Section_LongA:=One_Section_PNLvalue33.PNLA_Long;
                tempnl_sheet22.Section_WidthA:=One_Section_PNLvalue33.PNLA_Width;
                tempnl_sheet22.Section_Long_NumberA:=i21;
                tempnl_sheet22.Section_Width_NumberA:=j21;
                tempnl_sheet22.Section_LongB:=One_Section_PNLvalue33.PNLb_Width;
                tempnl_sheet22.Section_WidthB:=One_Section_PNLvalue33.PNLb_Long;
                tempnl_sheet22.Section_Long_NumberB:=n221B1;
                tempnl_sheet22.Section_Width_NumberB:=N222B1;
                tempnl_sheet22.Section_LongB:=One_Section_PNLvalue33.PNLb_Width;
                tempnl_sheet22.Section_WidthB:=One_Section_PNLvalue33.PNLb_Long;
                tempnl_sheet22.Section_Long_NumberB:=N231B1;
                tempnl_sheet22.Section_Width_NumberB:=N232B1;
                tempnl_sheet22.Section_Unit_Number:=//(n221A2*N222A2+N233A2*N234a2)*One_Section_PNLvalue33.PNLa_Unit_Long_Number*One_Section_PNLvalue33.PNLa_Unit_Width_Number
                                                   (n221B1*N222B1+N231B1*N232B1)*One_Section_PNLvalue33.PNLB_Unit_Long_Number*One_Section_PNLvalue33.PNLB_Unit_Width_Number
                                                   +I21*J21*One_Section_PNLvalue33.PNLA_Unit_Long_Number*One_Section_PNLvalue33.PNLA_Unit_Width_Number;
             end;

             if  rate209=max21 then //   rate209:=n223B1*N224B1+N233A1*N234A1
             begin  //N后的第三位数字表示长宽量是否调换,如为3,4则调换,后面的字母表示是第一种还是第二种排法,A表示第一种排法;B表示第二种排法
                array_type2:=9;   //小二区长排PNLB宽;小三区长排PNLB宽
                tempnl_sheet22.Section_LongA:=One_Section_PNLvalue33.PNLA_Long;
                tempnl_sheet22.Section_WidthA:=One_Section_PNLvalue33.PNLA_Width;
                tempnl_sheet22.Section_Long_NumberA:=i21;
                tempnl_sheet22.Section_Width_NumberA:=j21;
                tempnl_sheet22.Section_LongB:=One_Section_PNLvalue33.PNLb_Width;
                tempnl_sheet22.Section_WidthB:=One_Section_PNLvalue33.PNLb_Long;
                tempnl_sheet22.Section_Long_NumberB:=n223B1;
                tempnl_sheet22.Section_Width_NumberB:=N224B1;
                tempnl_sheet22.Section_LongB:=One_Section_PNLvalue33.PNLa_Width;
                tempnl_sheet22.Section_WidthB:=One_Section_PNLvalue33.PNLa_Long;
                tempnl_sheet22.Section_Long_NumberB:=N233A2;
                tempnl_sheet22.Section_Width_NumberB:=N234a2;
                tempnl_sheet22.Section_Unit_Number:=N233A1*N234A1*One_Section_PNLvalue33.PNLa_Unit_Long_Number*One_Section_PNLvalue33.PNLa_Unit_Width_Number
                                                   +n223B1*N224B1*One_Section_PNLvalue33.PNLB_Unit_Long_Number*One_Section_PNLvalue33.PNLB_Unit_Width_Number
                                                   +I21*J21*One_Section_PNLvalue33.PNLA_Unit_Long_Number*One_Section_PNLvalue33.PNLA_Unit_Width_Number;
             end;

             if  rate208=max21 then //   rate208:=n223B1*N224B1+N231A1*N232A1
             begin  //N后的第三位数字表示长宽量是否调换,如为3,4则调换,后面的字母表示是第一种还是第二种排法,A表示第一种排法;B表示第二种排法
                array_type2:=8;   //小二区长排PNLB宽;小三区长排PNLB宽
                tempnl_sheet22.Section_LongA:=One_Section_PNLvalue33.PNLA_Long;
                tempnl_sheet22.Section_WidthA:=One_Section_PNLvalue33.PNLA_Width;
                tempnl_sheet22.Section_Long_NumberA:=i21;
                tempnl_sheet22.Section_Width_NumberA:=j21;
                tempnl_sheet22.Section_LongB:=One_Section_PNLvalue33.PNLb_Width;
                tempnl_sheet22.Section_WidthB:=One_Section_PNLvalue33.PNLb_Long;
                tempnl_sheet22.Section_Long_NumberB:=n223B1;
                tempnl_sheet22.Section_Width_NumberB:=N224B1;
                tempnl_sheet22.Section_LongB:=One_Section_PNLvalue33.PNLa_Long;
                tempnl_sheet22.Section_WidthB:=One_Section_PNLvalue33.PNLa_Width;
                tempnl_sheet22.Section_Long_NumberB:=N231A1;
                tempnl_sheet22.Section_Width_NumberB:=N232A1;
                tempnl_sheet22.Section_Unit_Number:=N231A1*N232A1*One_Section_PNLvalue33.PNLa_Unit_Long_Number*One_Section_PNLvalue33.PNLa_Unit_Width_Number
                                                   +n223B1*N224B1*One_Section_PNLvalue33.PNLB_Unit_Long_Number*One_Section_PNLvalue33.PNLB_Unit_Width_Number
                                                   +I21*J21*One_Section_PNLvalue33.PNLA_Unit_Long_Number*One_Section_PNLvalue33.PNLA_Unit_Width_Number;
             end;

             if  rate207=max21 then // rate207:=n221B1*N222B1+N233A1*N234A1
             begin  //N后的第三位数字表示长宽量是否调换,如为3,4则调换,后面的字母表示是第一种还是第二种排法,A表示第一种排法;B表示第二种排法
                array_type2:=7;   //小二区长排PNLB宽;小三区长排PNLB宽
                tempnl_sheet22.Section_LongA:=One_Section_PNLvalue33.PNLA_Long;
                tempnl_sheet22.Section_WidthA:=One_Section_PNLvalue33.PNLA_Width;
                tempnl_sheet22.Section_Long_NumberA:=i21;
                tempnl_sheet22.Section_Width_NumberA:=j21;
                tempnl_sheet22.Section_LongB:=One_Section_PNLvalue33.PNLb_Long;
                tempnl_sheet22.Section_WidthB:=One_Section_PNLvalue33.PNLb_Width;
                tempnl_sheet22.Section_Long_NumberB:=n221B1;
                tempnl_sheet22.Section_Width_NumberB:=N222B1;
                tempnl_sheet22.Section_LongB:=One_Section_PNLvalue33.PNLa_Width;
                tempnl_sheet22.Section_WidthB:=One_Section_PNLvalue33.PNLa_Long;
                tempnl_sheet22.Section_Long_NumberB:=N233A2;
                tempnl_sheet22.Section_Width_NumberB:=N234a2;
                tempnl_sheet22.Section_Unit_Number:=N233A1*N234A1*One_Section_PNLvalue33.PNLa_Unit_Long_Number*One_Section_PNLvalue33.PNLa_Unit_Width_Number
                                                   +n221B1*N222B1*One_Section_PNLvalue33.PNLB_Unit_Long_Number*One_Section_PNLvalue33.PNLB_Unit_Width_Number
                                                   +I21*J21*One_Section_PNLvalue33.PNLA_Unit_Long_Number*One_Section_PNLvalue33.PNLA_Unit_Width_Number;
             end;


             if  rate206=max21 then //  rate206:=n221B1*N222B1+N231A1*N232A1
             begin  //N后的第三位数字表示长宽量是否调换,如为3,4则调换,后面的字母表示是第一种还是第二种排法,A表示第一种排法;B表示第二种排法
                array_type2:=6;   //小二区长排PNLB宽;小三区长排PNLB宽
                tempnl_sheet22.Section_LongA:=One_Section_PNLvalue33.PNLA_Long;
                tempnl_sheet22.Section_WidthA:=One_Section_PNLvalue33.PNLA_Width;
                tempnl_sheet22.Section_Long_NumberA:=i21;
                tempnl_sheet22.Section_Width_NumberA:=j21;
                tempnl_sheet22.Section_LongB:=One_Section_PNLvalue33.PNLb_Long;
                tempnl_sheet22.Section_WidthB:=One_Section_PNLvalue33.PNLb_Width;
                tempnl_sheet22.Section_Long_NumberB:=n221B1;
                tempnl_sheet22.Section_Width_NumberB:=N222B1;
                tempnl_sheet22.Section_LongB:=One_Section_PNLvalue33.PNLa_Long;
                tempnl_sheet22.Section_WidthB:=One_Section_PNLvalue33.PNLa_Width;
                tempnl_sheet22.Section_Long_NumberB:=N231A1;
                tempnl_sheet22.Section_Width_NumberB:=N232A1;
                tempnl_sheet22.Section_Unit_Number:=N231A1*N232A1*One_Section_PNLvalue33.PNLa_Unit_Long_Number*One_Section_PNLvalue33.PNLa_Unit_Width_Number
                                                   +n221B1*N222B1*One_Section_PNLvalue33.PNLB_Unit_Long_Number*One_Section_PNLvalue33.PNLB_Unit_Width_Number
                                                   +I21*J21*One_Section_PNLvalue33.PNLA_Unit_Long_Number*One_Section_PNLvalue33.PNLA_Unit_Width_Number;
             end;

              if  rate205=max21 then //  rate205:=n221A1*N222A1+N233B1*N234B1
             begin  //N后的第三位数字表示长宽量是否调换,如为3,4则调换,后面的字母表示是第一种还是第二种排法,A表示第一种排法;B表示第二种排法
                array_type2:=5;   //小二区长排PNLB宽;小三区长排PNLB宽
                tempnl_sheet22.Section_LongA:=One_Section_PNLvalue33.PNLA_Long;
                tempnl_sheet22.Section_WidthA:=One_Section_PNLvalue33.PNLA_Width;
                tempnl_sheet22.Section_Long_NumberA:=i21;
                tempnl_sheet22.Section_Width_NumberA:=j21;
                tempnl_sheet22.Section_LongB:=One_Section_PNLvalue33.PNLa_Long;
                tempnl_sheet22.Section_WidthB:=One_Section_PNLvalue33.PNLa_Width;
                tempnl_sheet22.Section_Long_NumberB:=n221A2;
                tempnl_sheet22.Section_Width_NumberB:=N222A2;
                tempnl_sheet22.Section_LongB:=One_Section_PNLvalue33.PNLb_Width;
                tempnl_sheet22.Section_WidthB:=One_Section_PNLvalue33.PNLb_Long;
                tempnl_sheet22.Section_Long_NumberB:=N233B1;
                tempnl_sheet22.Section_Width_NumberB:=N234B1;
                tempnl_sheet22.Section_Unit_Number:=n221A1*N222A1*One_Section_PNLvalue33.PNLa_Unit_Long_Number*One_Section_PNLvalue33.PNLa_Unit_Width_Number
                                                   +N233B1*N234B1*One_Section_PNLvalue33.PNLB_Unit_Long_Number*One_Section_PNLvalue33.PNLB_Unit_Width_Number
                                                   +I21*J21*One_Section_PNLvalue33.PNLA_Unit_Long_Number*One_Section_PNLvalue33.PNLA_Unit_Width_Number;
             end;

             if  rate204=max21 then //  rate204:=n221A1*N222A1+N231B1*N232B1
             begin  //N后的第三位数字表示长宽量是否调换,如为3,4则调换,后面的字母表示是第一种还是第二种排法,A表示第一种排法;B表示第二种排法
                array_type2:=4;   //小二区长排PNLB宽;小三区长排PNLB宽
                tempnl_sheet22.Section_LongA:=One_Section_PNLvalue33.PNLA_Long;
                tempnl_sheet22.Section_WidthA:=One_Section_PNLvalue33.PNLA_Width;
                tempnl_sheet22.Section_Long_NumberA:=i21;
                tempnl_sheet22.Section_Width_NumberA:=j21;
                tempnl_sheet22.Section_LongB:=One_Section_PNLvalue33.PNLa_Long;
                tempnl_sheet22.Section_WidthB:=One_Section_PNLvalue33.PNLa_Width;
                tempnl_sheet22.Section_Long_NumberB:=n221A2;
                tempnl_sheet22.Section_Width_NumberB:=N222A2;
                tempnl_sheet22.Section_LongB:=One_Section_PNLvalue33.PNLb_Long;
                tempnl_sheet22.Section_WidthB:=One_Section_PNLvalue33.PNLb_Width;
                tempnl_sheet22.Section_Long_NumberB:=N231B1;
                tempnl_sheet22.Section_Width_NumberB:=N232B1;
                tempnl_sheet22.Section_Unit_Number:=n221A1*N222A1*One_Section_PNLvalue33.PNLa_Unit_Long_Number*One_Section_PNLvalue33.PNLa_Unit_Width_Number
                                                   +N231B1*N232B1*One_Section_PNLvalue33.PNLB_Unit_Long_Number*One_Section_PNLvalue33.PNLB_Unit_Width_Number
                                                   +I21*J21*One_Section_PNLvalue33.PNLA_Unit_Long_Number*One_Section_PNLvalue33.PNLA_Unit_Width_Number;
             end;

             if  rate203=max21 then // rate203:=(n223A1*N224A1+N233A1*N234a1)
             begin  //N后的第三位数字表示长宽量是否调换,如为3,4则调换,后面的字母表示是第一种还是第二种排法,A表示第一种排法;B表示第二种排法
                array_type2:=3;   //小二区长排PNLB宽;小三区长排PNLB宽
                tempnl_sheet22.Section_LongA:=One_Section_PNLvalue33.PNLA_Long;
                tempnl_sheet22.Section_WidthA:=One_Section_PNLvalue33.PNLA_Width;
                tempnl_sheet22.Section_Long_NumberA:=i21;
                tempnl_sheet22.Section_Width_NumberA:=j21;
                tempnl_sheet22.Section_LongB:=One_Section_PNLvalue33.PNLa_Width;
                tempnl_sheet22.Section_WidthB:=One_Section_PNLvalue33.PNLa_Long;
                tempnl_sheet22.Section_Long_NumberB:=n223A1;
                tempnl_sheet22.Section_Width_NumberB:=N224A1;
                tempnl_sheet22.Section_LongB:=One_Section_PNLvalue33.PNLa_Width;
                tempnl_sheet22.Section_WidthB:=One_Section_PNLvalue33.PNLa_Long;
                tempnl_sheet22.Section_Long_NumberB:=N233A1;
                tempnl_sheet22.Section_Width_NumberB:=N234a1;
                tempnl_sheet22.Section_Unit_Number:=(n223A1*N224A1+N233A1*N234a1)*One_Section_PNLvalue33.PNLa_Unit_Long_Number*One_Section_PNLvalue33.PNLa_Unit_Width_Number
                                                   //+n223B2*N224B2*One_Section_PNLvalue33.PNLB_Unit_Long_Number*One_Section_PNLvalue33.PNLB_Unit_Width_Number
                                                   +I21*J21*One_Section_PNLvalue33.PNLA_Unit_Long_Number*One_Section_PNLvalue33.PNLA_Unit_Width_Number;
             end;

            if  rate202=max21 then //rate202:=(n223A1*N224A1+N231A1*N232a1)
             begin  //N后的第三位数字表示长宽量是否调换,如为3,4则调换,后面的字母表示是第一种还是第二种排法,A表示第一种排法;B表示第二种排法
                array_type2:=2;   //小二区长排PNLB宽;小三区长排PNLB宽
                tempnl_sheet22.Section_LongA:=One_Section_PNLvalue33.PNLA_Long;
                tempnl_sheet22.Section_WidthA:=One_Section_PNLvalue33.PNLA_Width;
                tempnl_sheet22.Section_Long_NumberA:=i21;
                tempnl_sheet22.Section_Width_NumberA:=j21;
                tempnl_sheet22.Section_LongB:=One_Section_PNLvalue33.PNLa_Width;
                tempnl_sheet22.Section_WidthB:=One_Section_PNLvalue33.PNLa_Long;
                tempnl_sheet22.Section_Long_NumberB:=n223A1;
                tempnl_sheet22.Section_Width_NumberB:=N224A1;
                tempnl_sheet22.Section_LongB:=One_Section_PNLvalue33.PNLa_Width;
                tempnl_sheet22.Section_WidthB:=One_Section_PNLvalue33.PNLa_Long;
                tempnl_sheet22.Section_Long_NumberB:=N231A1;
                tempnl_sheet22.Section_Width_NumberB:=N232a1;
                tempnl_sheet22.Section_Unit_Number:=(n223A1*N224A1+N231A1*N232a1)*One_Section_PNLvalue33.PNLa_Unit_Long_Number*One_Section_PNLvalue33.PNLa_Unit_Width_Number
                                                   //+n223B2*N224B2*One_Section_PNLvalue33.PNLB_Unit_Long_Number*One_Section_PNLvalue33.PNLB_Unit_Width_Number
                                                   +I21*J21*One_Section_PNLvalue33.PNLA_Unit_Long_Number*One_Section_PNLvalue33.PNLA_Unit_Width_Number;
             end;

            if  rate201=max21 then //rate201:=(n221A1*N222A1+N233A1*N234a1)
             begin  //N后的第三位数字表示长宽量是否调换,如为3,4则调换,后面的字母表示是第一种还是第二种排法,A表示第一种排法;B表示第二种排法
                array_type2:=1;   //小二区长排PNLB宽;小三区长排PNLB宽
                tempnl_sheet22.Section_LongA:=One_Section_PNLvalue33.PNLA_Long;
                tempnl_sheet22.Section_WidthA:=One_Section_PNLvalue33.PNLA_Width;
                tempnl_sheet22.Section_Long_NumberA:=i21;
                tempnl_sheet22.Section_Width_NumberA:=j21;
                tempnl_sheet22.Section_LongB:=One_Section_PNLvalue33.PNLa_Long;
                tempnl_sheet22.Section_WidthB:=One_Section_PNLvalue33.PNLa_Width;
                tempnl_sheet22.Section_Long_NumberB:=n221A1;
                tempnl_sheet22.Section_Width_NumberB:=N222A1;
                tempnl_sheet22.Section_LongB:=One_Section_PNLvalue33.PNLa_Long ;
                tempnl_sheet22.Section_WidthB:=One_Section_PNLvalue33.PNLa_Width;
                tempnl_sheet22.Section_Long_NumberB:=N233A1;
                tempnl_sheet22.Section_Width_NumberB:=N234a1;
                tempnl_sheet22.Section_Unit_Number:=(n221A1*N222A1+N233A1*N234a1)*One_Section_PNLvalue33.PNLa_Unit_Long_Number*One_Section_PNLvalue33.PNLa_Unit_Width_Number
                                                   //+n223B2*N224B2*One_Section_PNLvalue33.PNLB_Unit_Long_Number*One_Section_PNLvalue33.PNLB_Unit_Width_Number
                                                   +I21*J21*One_Section_PNLvalue33.PNLA_Unit_Long_Number*One_Section_PNLvalue33.PNLA_Unit_Width_Number;
             end;
             if  rate200=max21 then //
             begin  //N后的第三位数字表示长宽量是否调换,如为3,4则调换,后面的字母表示是第一种还是第二种排法,A表示第一种排法;B表示第二种排法
                array_type2:=0;   //小二区长排PNLB宽;小三区长排PNLB宽
                tempnl_sheet22.Section_LongA:=One_Section_PNLvalue33.PNLA_Long;
                tempnl_sheet22.Section_WidthA:=One_Section_PNLvalue33.PNLA_Width;
                tempnl_sheet22.Section_Long_NumberA:=n201;
                tempnl_sheet22.Section_Width_NumberA:=n202;
                tempnl_sheet22.Section_LongB:=0;
                tempnl_sheet22.Section_WidthB:=0;
                tempnl_sheet22.Section_Long_NumberB:=0;
                tempnl_sheet22.Section_Width_NumberB:=0;
                tempnl_sheet22.Section_LongB:=0;
                tempnl_sheet22.Section_WidthB:=0;
                tempnl_sheet22.Section_Long_NumberB:=0;
                tempnl_sheet22.Section_Width_NumberB:=0;
                tempnl_sheet22.Section_Unit_Number:=//(n201*n202)*One_Section_PNLvalue33.PNLa_Unit_Long_Number*One_Section_PNLvalue33.PNLa_Unit_Width_Number
                                                   //+n223B2*N224B2*One_Section_PNLvalue33.PNLB_Unit_Long_Number*One_Section_PNLvalue33.PNLB_Unit_Width_Number
                                                   n201*n202*One_Section_PNLvalue33.PNLA_Unit_Long_Number*One_Section_PNLvalue33.PNLA_Unit_Width_Number;
             end;





          end;
        end;
     end;    {}
//333333333
  end;//1
//--------------二区
//三区
   rate30:=0;
   rate31:=0;//初使化单元总数
   rate32:=0;
   rate33:=0;
   //三区可排PNKB与PNLA       三区从A开始排
   tempnl_sheet33.Section_LongA:=0;
   tempnl_sheet33.Section_WidthA:=0;
   tempnl_sheet33.Section_Long_NumberA:=0;
   tempnl_sheet33.Section_Width_NumberA:=0;
   tempnl_sheet33.Section_LongB:=0;
   tempnl_sheet33.Section_WidthB:=0;
   tempnl_sheet33.Section_Long_NumberB:=0;
   tempnl_sheet33.Section_Width_NumberB:=0;
   tempnl_sheet33.Section_Unit_Number:=0;
   array_type3:=-1;
   tem_rate3:=0;
  if (Three_Section_value333.Sheet_Long>=Three_Section_PNLvalue33.PNLA_Long) and (Three_Section_value333.Sheet_Width >=Three_Section_PNLvalue33.PNLA_Width)   then
  begin   //
     if Leave_Section_falchion_number1=2 then //只分两个区,排法只有AB的一边固定个数
     begin //
       n31:=trunc(Three_Section_value333.Sheet_Long/Three_Section_PNLvalue33.PNLA_Long);//排A个数
       n32:=trunc(Three_Section_value333.Sheet_Width/Three_Section_PNLvalue33.PNLA_Width);//排A个数
       n301:=n31;
       n302:=n32;
       rate30:=n301*n302*Three_Section_PNLvalue33.PNLA_Unit_Long_Number*Three_Section_PNLvalue33.PNLA_Unit_Width_Number;
       if Tem_Calculate_Rate_Type1=1 then  //用单元计算
       begin //
         rate30:=n301*n302*Three_Section_PNLvalue33.PNLA_Unit_Long_Number*Three_Section_PNLvalue33.PNLA_Unit_Width_Number*Three_Section_PNLvalue33.PNLA_Unit_Long*Three_Section_PNLvalue33.PNLA_Unit_Width;
         rate30:=rate30/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
       end; //

       if Tem_Calculate_Rate_Type1=2 then //用PNL计算
       begin //
         rate30:=n301*n302*Three_Section_PNLvalue33.PNLA_Long*Three_Section_PNLvalue33.PNLA_Width;
         rate30:=rate30/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
       end; //
      // rate30:=rate30*Three_Section_PNLvalue33.PNLA_Width*Three_Section_PNLvalue33.PNLA_Long/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width ;
       for j31:=1 to n32 do //
       begin //
          //剩下部分排A,则方向可调换
           n331:=0;
           n341:=0;
           rate31:=0;
           if (Three_Section_value333.Sheet_Long>=Three_Section_PNLvalue33.PNLA_Width) and
              ((Three_Section_value333.Sheet_Width-j31*Three_Section_PNLvalue33.PNLA_Width)>=Three_Section_PNLvalue33.PNLA_Long) then//剩下部分是否可排A,
           begin //
              n331:=trunc(Three_Section_value333.Sheet_Long/Three_Section_PNLvalue33.PNLA_Width);
              n341:=trunc((Three_Section_value333.Sheet_Width-j31*Three_Section_PNLvalue33.PNLA_Width)/Three_Section_PNLvalue33.PNLA_Long);
              rate31:=(n31*j31+n331*n341)*Three_Section_PNLvalue33.PNLA_Unit_Long_Number*Three_Section_PNLvalue33.PNLA_Unit_Width_Number;
              if Tem_Calculate_Rate_Type1=1 then  //用单元计算
              begin //
                 rate31:=(n31*j31+n331*n341)*Three_Section_PNLvalue33.PNLA_Unit_Long_Number*Three_Section_PNLvalue33.PNLA_Unit_Width_Number*Three_Section_PNLvalue33.PNLA_Unit_Long*Three_Section_PNLvalue33.PNLA_Unit_Width;
                 rate31:=rate31/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
              end;  //

              if Tem_Calculate_Rate_Type1=2 then //用PNL计算
              begin //
                  rate31:=(n31*j31+n331*n341)*Three_Section_PNLvalue33.PNLA_Long*Three_Section_PNLvalue33.PNLA_Width;
                  rate31:=rate31/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
              end  //
        //      rate31:=rate31*Three_Section_PNLvalue33.PNLA_Width*Three_Section_PNLvalue33.PNLA_Long/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width ;
           end;  //
          {
          //剩下部分排B,有两种情况,即方向会调换
            n332:=0;
            n342:=0;
            rate32:=0;
           n333:=0;
           n343:=0;
           rate33:=0;
           }
           max31:=max(rate30,rate31);

           if (max31>=tem_rate3)  then
           begin
             tem_rate3:=max31;



             if rate31=max31 then
             begin
              array_type3:=1;
              tempnl_sheet33.Section_LongA:=Three_Section_PNLvalue33.PNLA_Long;
              tempnl_sheet33.Section_WidthA:=Three_Section_PNLvalue33.PNLA_Width;
              tempnl_sheet33.Section_Long_NumberA:=n31;
              tempnl_sheet33.Section_Width_NumberA:=j31;
              tempnl_sheet33.Section_LongB:=Three_Section_PNLvalue33.PNLA_Width;
              tempnl_sheet33.Section_WidthB:=Three_Section_PNLvalue33.PNLA_Long;
              tempnl_sheet33.Section_Long_NumberB:=n331;
              tempnl_sheet33.Section_Width_NumberB:=n341;
              tempnl_sheet33.Section_Unit_Number:=(n31*j31+n331*n341)*Three_Section_PNLvalue33.PNLA_Unit_Long_Number*Three_Section_PNLvalue33.PNLA_Unit_Width_Number;
             end;
             if rate30=max31 then
             begin
              array_type3:=0;
              tempnl_sheet33.Section_LongA:=Three_Section_PNLvalue33.PNLA_Long;
              tempnl_sheet33.Section_WidthA:=Three_Section_PNLvalue33.PNLA_Width;
              tempnl_sheet33.Section_Long_NumberA:=n301;
              tempnl_sheet33.Section_Width_NumberA:=n302;
              tempnl_sheet33.Section_LongB:=0;
              tempnl_sheet33.Section_WidthB:=0;
              tempnl_sheet33.Section_Long_NumberB:=0;
              tempnl_sheet33.Section_Width_NumberB:=0;
              tempnl_sheet33.Section_Unit_Number:=n301*n302*Three_Section_PNLvalue33.PNLA_Unit_Long_Number*Three_Section_PNLvalue33.PNLA_Unit_Width_Number ;
             end;

           end; //
       end;//
     end; //
    //3333333
   {
     if Leave_Section_falchion_number1=3 then  //分三个区
     begin
       n21:=trunc(three_Section_value333.Sheet_Long/three_Section_PNLvalue33.PNLA_Long);//排A,最大长个数
       n22:=trunc(three_Section_value333.Sheet_Width/three_Section_PNLvalue33.PNLA_Width);//排A,最大宽个数

       n201:=n21; //PNLA最大个数为n201*n202
       n202:=n22;
       rate200:=n201*n202*three_Section_PNLvalue33.PNLA_Unit_Long_Number*three_Section_PNLvalue33.PNLA_Unit_Width_Number;
       if Tem_Calculate_Rate_Type1=1 then  //用单元计算
       begin
          rate200:=n201*n202*three_Section_PNLvalue33.PNLA_Unit_Long_Number
                   *three_Section_PNLvalue33.PNLA_Unit_Width_Number
                   *three_Section_PNLvalue33.PNLA_Unit_Long
                   *three_Section_PNLvalue33.PNLA_Unit_Width;
          rate200:=rate200/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
       end;
       if Tem_Calculate_Rate_Type1=2 then //用PNL计算
       begin
         rate200:=n201*N202*three_Section_PNLvalue33.PNLA_Long*three_Section_PNLvalue33.PNLA_Width;//PNL长宽个数与长宽
         rate200:=rate200/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
       end;
        for i21:=1 to n21 do
        begin
          for j21:=1 to n22 do //宽从1到最大 ,小一区排PNLA,长排长边,宽排宽边
          begin  //3   有待加
                                       // |--------|-------|
           //第一种排法,第一刀与宽平行开  | 小一区 |       |
//--------------------------              |--------|小二区 |
         //                               |小三区  |       |
           //二区, 三区                   |--------|-------|

             //此处分多种情况1:小二区排PNLA,小三区也排PNLA;2:小二区排PNLA,小三区排PNLB;3:小二区排PNLB,小三区排PNLA;4:小二区,小三区排PNLB
             //1:小二区排PNLA,小三区也排PNLA,分多种情况:小二区长边排宽,小三区长边排长;小二区长边排宽,小三区长边排长宽;小二区长边排长,小三区长边排宽

             //three_Section_value333.Sheet_long-i21*three_Section_PNLvalue33.PNLA_Long
             //three_Section_value333.Sheet_Width-j21*three_Section_PNLvalue33.PNLA_Width
             //小二区PNLA宽排长边
             n221A1:=0;
             n222A1:=0;
             if (three_Section_value333.Sheet_long-i21*three_Section_PNLvalue33.PNLA_Long>=three_Section_PNLvalue33.PNLA_Width)
               and (three_Section_value333.Sheet_Width>=three_Section_PNLvalue33.PNLA_Long) then
               begin
                 n221A1:=trunc((three_Section_value333.Sheet_long-i21*three_Section_PNLvalue33.PNLA_Long)/three_Section_PNLvalue33.PNLA_Width);
                 n222A1:=trunc(three_Section_value333.Sheet_Width/three_Section_PNLvalue33.PNLA_Long);
              end;
              //小三区PNLA宽排长边
               n231A1:=0;
               n232A1:=0;
              if (i21*three_Section_PNLvalue33.PNLA_Long>=three_Section_PNLvalue33.PNLA_Width)
               and ((three_Section_value333.Sheet_Width-j21*three_Section_PNLvalue33.PNLA_Width)>=three_Section_PNLvalue33.PNLA_Long) then
               begin
                 n231A1:=trunc(i21*three_Section_PNLvalue33.PNLA_Long/three_Section_PNLvalue33.PNLA_Width);
                 n232A1:=trunc((three_Section_value333.Sheet_Width-j21*three_Section_PNLvalue33.PNLA_Width)/three_Section_PNLvalue33.PNLA_Long);
              end;
              //小三区PNLA宽排长边
              n233A1:=0;
              n234A1:=0;
              if (i21*three_Section_PNLvalue33.PNLA_Long>=three_Section_PNLvalue33.PNLA_Long)
               and ((three_Section_value333.Sheet_Width-j21*three_Section_PNLvalue33.PNLA_Width)>=three_Section_PNLvalue33.PNLA_Width) then
               begin
                 n233A1:=trunc(i21*three_Section_PNLvalue33.PNLA_Long/three_Section_PNLvalue33.PNLA_Long);
                 n234A1:=trunc((three_Section_value333.Sheet_Width-j21*three_Section_PNLvalue33.PNLA_Width)/three_Section_PNLvalue33.PNLA_Width);
              end;
              //小二区PNLA长排长边
              n223A1:=0;
              n224A1:=0;
              if (three_Section_value333.Sheet_long-i21*three_Section_PNLvalue33.PNLA_Long>=three_Section_PNLvalue33.PNLA_Long)
               and (three_Section_value333.Sheet_Width>=three_Section_PNLvalue33.PNLA_Width) then
               begin
                 n223A1:=trunc((three_Section_value333.Sheet_long-i21*three_Section_PNLvalue33.PNLA_Long)/three_Section_PNLvalue33.PNLA_Long);
                 n224A1:=trunc(three_Section_value333.Sheet_Width/three_Section_PNLvalue33.PNLA_Width);
              end;


              //小二区PNLB宽排长边
              n221B1:=0;
              n222B1:=0;
              if (three_Section_value333.Sheet_long-i21*three_Section_PNLvalue33.PNLA_Long>=three_Section_PNLvalue33.PNLB_Width)
               and (three_Section_value333.Sheet_Width>=three_Section_PNLvalue33.PNLB_Long) then
               begin
                 n221B1:=trunc((three_Section_value333.Sheet_long-i21*three_Section_PNLvalue33.PNLA_Long)/three_Section_PNLvalue33.PNLB_Width);
                 n222B1:=trunc(three_Section_value333.Sheet_Width/three_Section_PNLvalue33.PNLB_Long);
              end;
              //小三区PNLB宽排长边
              n231B1:=0;
              n232B1:=0;
              if (i21*three_Section_PNLvalue33.PNLA_Long>=three_Section_PNLvalue33.PNLB_Width)
               and ((three_Section_value333.Sheet_Width-j21*three_Section_PNLvalue33.PNLA_Width)>=three_Section_PNLvalue33.PNLB_Long) then
               begin
                 n231B1:=trunc(i21*three_Section_PNLvalue33.PNLA_Long/three_Section_PNLvalue33.PNLB_Width);
                 n232B1:=trunc((three_Section_value333.Sheet_Width-j21*three_Section_PNLvalue33.PNLA_Width)/three_Section_PNLvalue33.PNLB_Long);
              end;
              //小三区PNLB宽排长边
              n233B1:=0;
              n234B1:=0;
              if (i21*three_Section_PNLvalue33.PNLA_Long>=three_Section_PNLvalue33.PNLB_Long)
               and ((three_Section_value333.Sheet_Width-j21*three_Section_PNLvalue33.PNLA_Width)>=three_Section_PNLvalue33.PNLB_Width) then
               begin
                 n233B1:=trunc(i21*three_Section_PNLvalue33.PNLA_Long/three_Section_PNLvalue33.PNLB_Long);
                 n234B1:=trunc((three_Section_value333.Sheet_Width-j21*three_Section_PNLvalue33.PNLA_Width)/three_Section_PNLvalue33.PNLB_Width);
              end;
              //小二区PNLB长排长边
              n223B1:=0;
              n224B1:=0;
              if (three_Section_value333.Sheet_long-i21*three_Section_PNLvalue33.PNLA_Long>=three_Section_PNLvalue33.PNLB_Long)
               and (three_Section_value333.Sheet_Width>=three_Section_PNLvalue33.PNLB_Width) then
               begin
                 n223B1:=trunc((three_Section_value333.Sheet_long-i21*three_Section_PNLvalue33.PNLA_Long)/three_Section_PNLvalue33.PNLB_Long);
                 n224B1:=trunc(three_Section_value333.Sheet_Width/three_Section_PNLvalue33.PNLB_Width);
              end;
              //小二区长排PNLA长,小三区可排PNLA,则只一种

               rate201:=(n221A1*N222A1+N233A1*N234a1)*three_Section_PNLvalue33.PNLA_Unit_Long_Number*three_Section_PNLvalue33.PNLA_Unit_Width_Number;
               if Tem_Calculate_Rate_Type1=1 then  //用单元计算
               begin
                  rate201:=(n221A1*N222A1+N233A1*N234a1)*three_Section_PNLvalue33.PNLA_Unit_Long_Number*three_Section_PNLvalue33.PNLA_Unit_Width_Number
                         *three_Section_PNLvalue33.PNLA_Unit_Long*three_Section_PNLvalue33.PNLA_Unit_Width;
                  rate201:=rate201/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
               end;
               if Tem_Calculate_Rate_Type1=2 then //用PNL计算
               begin
                  rate201:=(n221A1*N222A1+N233A1*N234a1)
                         *three_Section_PNLvalue33.PNLA_Long *three_Section_PNLvalue33.PNLA_Width;
                  rate201:=rate201/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
               END;
              //小二区长排PNLA宽,小三区可排PNLA,则只一种
              rate202:=(n223A1*N224A1+N231A1*N232a1)*three_Section_PNLvalue33.PNLA_Unit_Long_Number*three_Section_PNLvalue33.PNLA_Unit_Width_Number;
              if Tem_Calculate_Rate_Type1=1 then  //用单元计算
               begin
                  rate202:=(n223A1*N224A1+N231A1*N232a1)*three_Section_PNLvalue33.PNLA_Unit_Long_Number*three_Section_PNLvalue33.PNLA_Unit_Width_Number
                         *three_Section_PNLvalue33.PNLA_Unit_Long*three_Section_PNLvalue33.PNLA_Unit_Width;
                  rate202:=rate202/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
               end;
               if Tem_Calculate_Rate_Type1=2 then //用PNL计算
               begin
                  rate202:=(n223A1*N224A1+N231A1*N232a1)
                         *three_Section_PNLvalue33.PNLA_Long *three_Section_PNLvalue33.PNLA_Width;
                  rate202:=rate203/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
               END;
              rate203:=(n223A1*N224A1+N233A1*N234a1)*three_Section_PNLvalue33.PNLA_Unit_Long_Number*three_Section_PNLvalue33.PNLA_Unit_Width_Number;
              if Tem_Calculate_Rate_Type1=1 then  //用单元计算
               begin
                  rate203:=(n223A1*N224A1+N233A1*N234a1)*three_Section_PNLvalue33.PNLA_Unit_Long_Number*three_Section_PNLvalue33.PNLA_Unit_Width_Number
                         *three_Section_PNLvalue33.PNLA_Unit_Long*three_Section_PNLvalue33.PNLA_Unit_Width;
                  rate203:=rate203/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
               end;
               if Tem_Calculate_Rate_Type1=2 then //用PNL计算
               begin
                  rate203:=(n223A1*N224A1+N233A1*N234a1)
                         *three_Section_PNLvalue33.PNLA_Long *three_Section_PNLvalue33.PNLA_Width;
                  rate203:=rate203/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
               END;
               //小二区长排PNLA长,小三区可排PNLb,则只两种
              rate204:=n221A1*N222A1*three_Section_PNLvalue33.PNLA_Unit_Long_Number*three_Section_PNLvalue33.PNLA_Unit_Width_Number
                       +N231B1*N232B1*three_Section_PNLvalue33.PNLB_Unit_Long_Number*three_Section_PNLvalue33.PNLB_Unit_Width_Number;
              if Tem_Calculate_Rate_Type1=1 then  //用单元计算
               begin
                  rate204:=n221A1*N222A1*three_Section_PNLvalue33.PNLA_Unit_Long_Number*three_Section_PNLvalue33.PNLA_Unit_Width_Number
                                          *three_Section_PNLvalue33.PNLA_Unit_Long*three_Section_PNLvalue33.PNLA_Unit_Width
                         +N231B1*N232B1*three_Section_PNLvalue33.PNLb_Unit_Long_Number*three_Section_PNLvalue33.PNLb_Unit_Width_Number
                                        *three_Section_PNLvalue33.PNLb_Unit_Long*three_Section_PNLvalue33.PNLb_Unit_Width;
                  rate204:=rate204/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
               end;
               if Tem_Calculate_Rate_Type1=2 then //用PNL计算
               begin
                  rate204:=n221A1*N222A1*three_Section_PNLvalue33.PNLA_Long *three_Section_PNLvalue33.PNLA_Width
                           +N231B1*N232B1*three_Section_PNLvalue33.PNLb_Long *three_Section_PNLvalue33.PNLb_Width;
                  rate204:=rate204/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
               END;

              rate205:=n221A1*N222A1*three_Section_PNLvalue33.PNLA_Unit_Long_Number*three_Section_PNLvalue33.PNLA_Unit_Width_Number
                      +N233B1*N234B1*three_Section_PNLvalue33.PNLB_Unit_Long_Number*three_Section_PNLvalue33.PNLB_Unit_Width_Number;

               if Tem_Calculate_Rate_Type1=1 then  //用单元计算
               begin
                  rate205:=n221A1*N222A1*three_Section_PNLvalue33.PNLA_Unit_Long_Number*three_Section_PNLvalue33.PNLA_Unit_Width_Number
                                          *three_Section_PNLvalue33.PNLA_Unit_Long*three_Section_PNLvalue33.PNLA_Unit_Width
                         +N233B1*N234B1*three_Section_PNLvalue33.PNLb_Unit_Long_Number*three_Section_PNLvalue33.PNLb_Unit_Width_Number
                                        *three_Section_PNLvalue33.PNLb_Unit_Long*three_Section_PNLvalue33.PNLb_Unit_Width;
                  rate205:=rate205/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
               end;
               if Tem_Calculate_Rate_Type1=2 then //用PNL计算
               begin
                  rate205:=n221A1*N222A1*three_Section_PNLvalue33.PNLA_Long *three_Section_PNLvalue33.PNLA_Width
                           +N233B1*N234B1*three_Section_PNLvalue33.PNLb_Long *three_Section_PNLvalue33.PNLb_Width;
                  rate205:=rate205/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
               END;
              //小二区长排PNLB长,小三区可排PNLA,则只两种
              rate206:=n221B1*N222B1*three_Section_PNLvalue33.PNLB_Unit_Long_Number*three_Section_PNLvalue33.PNLB_Unit_Width_NumbeR
                      +N231A1*N232A1*three_Section_PNLvalue33.PNLA_Unit_Long_Number*three_Section_PNLvalue33.PNLA_Unit_Width_Number;
               if Tem_Calculate_Rate_Type1=1 then  //用单元计算
               begin
                  rate206:=N231A1*N232A1*three_Section_PNLvalue33.PNLA_Unit_Long_Number*three_Section_PNLvalue33.PNLA_Unit_Width_Number
                                          *three_Section_PNLvalue33.PNLA_Unit_Long*three_Section_PNLvalue33.PNLA_Unit_Width
                         +n221B1*N222B1*three_Section_PNLvalue33.PNLb_Unit_Long_Number*three_Section_PNLvalue33.PNLb_Unit_Width_Number
                                        *three_Section_PNLvalue33.PNLb_Unit_Long*three_Section_PNLvalue33.PNLb_Unit_Width;
                  rate206:=rate206/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
               end;
               if Tem_Calculate_Rate_Type1=2 then //用PNL计算
               begin
                  rate206:=N231A1*N232A1*three_Section_PNLvalue33.PNLA_Long *three_Section_PNLvalue33.PNLA_Width
                           +n221B1*N222B1*three_Section_PNLvalue33.PNLb_Long *three_Section_PNLvalue33.PNLb_Width;
                  rate206:=rate206/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
               END;
              rate207:=n221B1*N222B1*three_Section_PNLvalue33.PNLB_Unit_Long_Number*three_Section_PNLvalue33.PNLB_Unit_Width_NumbeR
                       +N233A1*N234A1*three_Section_PNLvalue33.PNLA_Unit_Long_Number*three_Section_PNLvalue33.PNLA_Unit_Width_NumbeR;
              if Tem_Calculate_Rate_Type1=1 then  //用单元计算
               begin
                  rate207:=N233A1*N234A1*three_Section_PNLvalue33.PNLA_Unit_Long_Number*three_Section_PNLvalue33.PNLA_Unit_Width_Number
                                          *three_Section_PNLvalue33.PNLA_Unit_Long*three_Section_PNLvalue33.PNLA_Unit_Width
                         +n221B1*N222B1*three_Section_PNLvalue33.PNLb_Unit_Long_Number*three_Section_PNLvalue33.PNLb_Unit_Width_Number
                                        *three_Section_PNLvalue33.PNLb_Unit_Long*three_Section_PNLvalue33.PNLb_Unit_Width;
                  rate207:=rate207/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
               end;
               if Tem_Calculate_Rate_Type1=2 then //用PNL计算
               begin
                  rate207:=N233A1*N234A1*three_Section_PNLvalue33.PNLA_Long *three_Section_PNLvalue33.PNLA_Width
                           +n221B1*N222B1*three_Section_PNLvalue33.PNLb_Long *three_Section_PNLvalue33.PNLb_Width;
                  rate207:=rate207/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
               END;
              //小二区长排PNLB宽,小三区可排PNLA,则只两种
              rate208:=n223B1*N224B1*three_Section_PNLvalue33.PNLB_Unit_Long_Number*three_Section_PNLvalue33.PNLB_Unit_Width_Number
                       +N231A1*N232A1*three_Section_PNLvalue33.PNLA_Unit_Long_Number*three_Section_PNLvalue33.PNLA_Unit_Width_NumbeR;

              if Tem_Calculate_Rate_Type1=1 then  //用单元计算
               begin
                  rate208:=N231A1*N232A1*three_Section_PNLvalue33.PNLA_Unit_Long_Number*three_Section_PNLvalue33.PNLA_Unit_Width_Number
                                          *three_Section_PNLvalue33.PNLA_Unit_Long*three_Section_PNLvalue33.PNLA_Unit_Width
                         +n223B1*N224B1*three_Section_PNLvalue33.PNLb_Unit_Long_Number*three_Section_PNLvalue33.PNLb_Unit_Width_Number
                                        *three_Section_PNLvalue33.PNLb_Unit_Long*three_Section_PNLvalue33.PNLb_Unit_Width;
                  rate208:=rate208/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
               end;
               if Tem_Calculate_Rate_Type1=2 then //用PNL计算
               begin
                  rate208:=N231A1*N232A1*three_Section_PNLvalue33.PNLA_Long *three_Section_PNLvalue33.PNLA_Width
                           +n223B1*N224B1*three_Section_PNLvalue33.PNLb_Long *three_Section_PNLvalue33.PNLb_Width;
                  rate208:=rate208/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
               END;


              rate209:=n223B1*N224B1*three_Section_PNLvalue33.PNLB_Unit_Long_Number*three_Section_PNLvalue33.PNLB_Unit_Width_Number
                       +N233A1*N234A1*three_Section_PNLvalue33.PNLA_Unit_Long_Number*three_Section_PNLvalue33.PNLA_Unit_Width_NumbeR;

              if Tem_Calculate_Rate_Type1=1 then  //用单元计算
               begin
                  rate209:=N233A1*N234A1*three_Section_PNLvalue33.PNLA_Unit_Long_Number*three_Section_PNLvalue33.PNLA_Unit_Width_Number
                                          *three_Section_PNLvalue33.PNLA_Unit_Long*three_Section_PNLvalue33.PNLA_Unit_Width
                         +n223B1*N224B1*three_Section_PNLvalue33.PNLb_Unit_Long_Number*three_Section_PNLvalue33.PNLb_Unit_Width_Number
                                        *three_Section_PNLvalue33.PNLb_Unit_Long*three_Section_PNLvalue33.PNLb_Unit_Width;
                  rate209:=rate209/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
               end;
               if Tem_Calculate_Rate_Type1=2 then //用PNL计算
               begin
                  rate209:=N233A1*N234A1*three_Section_PNLvalue33.PNLA_Long *three_Section_PNLvalue33.PNLA_Width
                           +n223B1*N224B1*three_Section_PNLvalue33.PNLb_Long *three_Section_PNLvalue33.PNLb_Width;
                  rate209:=rate209/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
               END;
              //小二区长排PNLB长,小三区可排PNLB,则只两种
              rate210:=(n221B1*N222B1+N231B1*N232B1)*three_Section_PNLvalue33.PNLB_Unit_Long_Number*three_Section_PNLvalue33.PNLB_Unit_Width_Number;
              if Tem_Calculate_Rate_Type1=1 then  //用单元计算
               begin
                  rate210:=(n221B1*N222B1+N231B1*N232B1)*three_Section_PNLvalue33.PNLb_Unit_Long_Number*three_Section_PNLvalue33.PNLb_Unit_Width_Number
                         *three_Section_PNLvalue33.PNLb_Unit_Long*three_Section_PNLvalue33.PNLb_Unit_Width;
                  rate210:=rate210/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
               end;
               if Tem_Calculate_Rate_Type1=2 then //用PNL计算
               begin
                  rate210:=(n221B1*N222B1+N231B1*N232B1)
                         *three_Section_PNLvalue33.PNLb_Long *three_Section_PNLvalue33.PNLb_Width;
                  rate210:=rate210/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
               END;
              rate211:=(n221B1*N222B1+N233B1*N234B1)*three_Section_PNLvalue33.PNLB_Unit_Long_Number*three_Section_PNLvalue33.PNLB_Unit_Width_Number;
              if Tem_Calculate_Rate_Type1=1 then  //用单元计算
               begin
                  rate211:=(n221B1*N222B1+N233B1*N234B1)*three_Section_PNLvalue33.PNLb_Unit_Long_Number*three_Section_PNLvalue33.PNLb_Unit_Width_Number
                         *three_Section_PNLvalue33.PNLb_Unit_Long*three_Section_PNLvalue33.PNLb_Unit_Width;
                  rate211:=rate211/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
               end;
               if Tem_Calculate_Rate_Type1=2 then //用PNL计算
               begin
                  rate211:=(n221B1*N222B1+N233B1*N234B1)
                         *three_Section_PNLvalue33.PNLb_Long *three_Section_PNLvalue33.PNLb_Width;
                  rate211:=rate211/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
               END;
              //小二区长排PNLB宽,小三区可排PNLB,则只两种
              rate212:=(n223B1*N224B1+N231B1*N232B1)*three_Section_PNLvalue33.PNLB_Unit_Long_Number*three_Section_PNLvalue33.PNLB_Unit_Width_Number;
              if Tem_Calculate_Rate_Type1=1 then  //用单元计算
               begin
                  rate212:=(n223B1*N224B1+N231B1*N232B1)*three_Section_PNLvalue33.PNLb_Unit_Long_Number*three_Section_PNLvalue33.PNLb_Unit_Width_Number
                         *three_Section_PNLvalue33.PNLb_Unit_Long*three_Section_PNLvalue33.PNLb_Unit_Width;
                  rate212:=rate212/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
               end;
               if Tem_Calculate_Rate_Type1=2 then //用PNL计算
               begin
                  rate212:=(n223B1*N224B1+N231B1*N232B1)
                         *three_Section_PNLvalue33.PNLb_Long *three_Section_PNLvalue33.PNLb_Width;
                  rate212:=rate212/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
               END;

              rate213:=(n223B1*N224B1+N233B1*N234B1)*three_Section_PNLvalue33.PNLB_Unit_Long_Number*three_Section_PNLvalue33.PNLB_Unit_Width_Number;

              if Tem_Calculate_Rate_Type1=1 then  //用单元计算
               begin
                  rate213:=(n223B1*N224B1+N233B1*N234B1)*three_Section_PNLvalue33.PNLb_Unit_Long_Number*three_Section_PNLvalue33.PNLb_Unit_Width_Number
                         *three_Section_PNLvalue33.PNLb_Unit_Long*three_Section_PNLvalue33.PNLb_Unit_Width;
                  rate213:=rate213/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
               end;
               if Tem_Calculate_Rate_Type1=2 then //用PNL计算
               begin
                  rate213:=(n223B1*N224B1+N233B1*N234B1)
                         *three_Section_PNLvalue33.PNLb_Long *three_Section_PNLvalue33.PNLb_Width;
                  rate213:=rate213/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
               END;

             //2:小二区排PNLA,小三区排PNLB;分多种情况:小二区长边排宽,小三区长边排长;小二区长边排宽,小三区长边排宽;

             //3:小二区排PNLB,小三区排PNLA;

             //4:小二区,小三区排PNLB

//---------------------------
            //                            |--------|-------|
           //第一种排法,第一刀与宽平行开  |小一区  |小二区 |
            //                            |----------------|
           //                             | 小三区         |
           //                             |----------------|

           //小二区PNLA宽排长边   three_Section_value333.Sheet_Width
             n221A2:=0;
             n222A2:=0;
             if (three_Section_value333.Sheet_long-i21*three_Section_PNLvalue33.PNLA_Long>=three_Section_PNLvalue33.PNLA_Width)
               and (J21*three_Section_PNLvalue33.PNLA_Width>=three_Section_PNLvalue33.PNLA_Long) then
               begin
                 n221A2:=trunc((three_Section_value333.Sheet_long-i21*three_Section_PNLvalue33.PNLA_Long)/three_Section_PNLvalue33.PNLA_Width);
                 n222A2:=trunc(J21*three_Section_PNLvalue33.PNLA_Width/three_Section_PNLvalue33.PNLA_Long);
              end;
              //小三区PNLA宽排长边  i21*three_Section_PNLvalue33.PNLA_Long
              n231A2:=0;
              n232A2:=0;
              if (three_Section_value333.Sheet_long>=three_Section_PNLvalue33.PNLA_Width)
               and ((three_Section_value333.Sheet_Width-j21*three_Section_PNLvalue33.PNLA_Width)>=three_Section_PNLvalue33.PNLA_Long) then
               begin
                 n231A2:=trunc(three_Section_value333.Sheet_long/three_Section_PNLvalue33.PNLA_Width);
                 n232A2:=trunc((three_Section_value333.Sheet_Width-j21*three_Section_PNLvalue33.PNLA_Width)/three_Section_PNLvalue33.PNLA_Long);
              end;
              //小三区PNLA宽排长边
              n233A2:=0;
              n234A2:=0;
              if (three_Section_value333.Sheet_long>=three_Section_PNLvalue33.PNLA_Long)
               and ((three_Section_value333.Sheet_Width-j21*three_Section_PNLvalue33.PNLA_Width)>=three_Section_PNLvalue33.PNLA_Width) then
               begin
                 n233A2:=trunc(three_Section_value333.Sheet_long/three_Section_PNLvalue33.PNLA_Long);
                 n234A2:=trunc((three_Section_value333.Sheet_Width-j21*three_Section_PNLvalue33.PNLA_Width)/three_Section_PNLvalue33.PNLA_Width);
              end;
              //小二区PNLA长排长边
              n223A2:=0;
              n224A2:=0;
              if (three_Section_value333.Sheet_long-i21*three_Section_PNLvalue33.PNLA_Long>=three_Section_PNLvalue33.PNLA_Long)
               and (J21*three_Section_PNLvalue33.PNLA_Width>=three_Section_PNLvalue33.PNLA_Width) then
               begin
                 n223A2:=trunc((three_Section_value333.Sheet_long-i21*three_Section_PNLvalue33.PNLA_Long)/three_Section_PNLvalue33.PNLA_Long);
                 n224A2:=trunc(J21*three_Section_PNLvalue33.PNLA_Width/three_Section_PNLvalue33.PNLA_Width);
              end;


              //小二区PNLB宽排长边
              n221B2:=0;
              n222B2:=0;
             if (three_Section_value333.Sheet_long-i21*three_Section_PNLvalue33.PNLA_Long>=three_Section_PNLvalue33.PNLB_Width)
               and (J21*three_Section_PNLvalue33.PNLA_Width>=three_Section_PNLvalue33.PNLB_Long) then
               begin
                 n221B2:=trunc((three_Section_value333.Sheet_long-i21*three_Section_PNLvalue33.PNLA_Long)/three_Section_PNLvalue33.PNLB_Width);
                 n222B2:=trunc(J21*three_Section_PNLvalue33.PNLA_Width/three_Section_PNLvalue33.PNLB_Long);
              end;
              //小三区PNLB宽排长边
              n231B2:=0;
              n232B2:=0;
              if (three_Section_value333.Sheet_long>=three_Section_PNLvalue33.PNLB_Width)
               and ((three_Section_value333.Sheet_Width-j21*three_Section_PNLvalue33.PNLA_Width)>=three_Section_PNLvalue33.PNLB_Long) then
               begin
                 n231B2:=trunc(three_Section_value333.Sheet_long/three_Section_PNLvalue33.PNLB_Width);
                 n232B2:=trunc((three_Section_value333.Sheet_Width-j21*three_Section_PNLvalue33.PNLA_Width)/three_Section_PNLvalue33.PNLB_Long);
              end;
              //小三区PNLB宽排长边
              n233B2:=0;
              n234B2:=0;
              if (three_Section_value333.Sheet_long>=three_Section_PNLvalue33.PNLB_Long)
               and ((three_Section_value333.Sheet_Width-j21*three_Section_PNLvalue33.PNLA_Width)>=three_Section_PNLvalue33.PNLB_Width) then
               begin
                 n233B2:=trunc(three_Section_value333.Sheet_long/three_Section_PNLvalue33.PNLB_Long);
                 n234B2:=trunc((three_Section_value333.Sheet_Width-j21*three_Section_PNLvalue33.PNLA_Width)/three_Section_PNLvalue33.PNLB_Width);
              end;
              //小二区PNLB长排长边
              n223B2:=0;
              n224B2:=0;
              if (three_Section_value333.Sheet_long-i21*three_Section_PNLvalue33.PNLA_Long>=three_Section_PNLvalue33.PNLB_Long)
               and (J21*three_Section_PNLvalue33.PNLA_Width>=three_Section_PNLvalue33.PNLB_Width) then
               begin
                 n223B2:=trunc((three_Section_value333.Sheet_long-i21*three_Section_PNLvalue33.PNLA_Long)/three_Section_PNLvalue33.PNLB_Long);
                 n224B2:=trunc(J21*three_Section_PNLvalue33.PNLA_Width/three_Section_PNLvalue33.PNLB_Width);
              end;
              //小二区长排PNLA长,小三区可排PNLA,则只一种

              rate221:=(n221A2*N222A2+N233A2*N234a2)*three_Section_PNLvalue33.PNLA_Unit_Long_Number*three_Section_PNLvalue33.PNLA_Unit_Width_Number;
              if Tem_Calculate_Rate_Type1=1 then  //用单元计算
               begin
                  rate221:=(n221A2*N222A2+N233A2*N234a2)*three_Section_PNLvalue33.PNLA_Unit_Long_Number*three_Section_PNLvalue33.PNLA_Unit_Width_Number
                                          *three_Section_PNLvalue33.PNLA_Unit_Long*three_Section_PNLvalue33.PNLA_Unit_Width ;
                  rate221:=rate221/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
               end;
               if Tem_Calculate_Rate_Type1=2 then //用PNL计算
               begin
                  rate221:=(n221A2*N222A2+N233A2*N234a2)*three_Section_PNLvalue33.PNLA_Long *three_Section_PNLvalue33.PNLA_Width;
                  rate221:=rate221/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
               END;
                //小二区长排PNLA宽,小三区可排PNLA,则有两种
              rate222:=(n223A2*N224A2+N231A2*N232a2)*three_Section_PNLvalue33.PNLA_Unit_Long_Number*three_Section_PNLvalue33.PNLA_Unit_Width_Number;
              if Tem_Calculate_Rate_Type1=1 then  //用单元计算
               begin
                  rate222:=(n223A2*N224A2+N231A2*N232a2)*three_Section_PNLvalue33.PNLA_Unit_Long_Number*three_Section_PNLvalue33.PNLA_Unit_Width_Number
                                          *three_Section_PNLvalue33.PNLA_Unit_Long*three_Section_PNLvalue33.PNLA_Unit_Width;
                  rate222:=rate222/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
               end;
               if Tem_Calculate_Rate_Type1=2 then //用PNL计算
               begin
                  rate222:=(n223A2*N224A2+N231A2*N232a2)*three_Section_PNLvalue33.PNLA_Long *three_Section_PNLvalue33.PNLA_Width ;
                  rate222:=rate222/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
               END;
              rate223:=(n223A2*N224A2+N233A2*N234a2)*three_Section_PNLvalue33.PNLA_Unit_Long_Number*three_Section_PNLvalue33.PNLA_Unit_Width_Number;
              if Tem_Calculate_Rate_Type1=1 then  //用单元计算
               begin
                  rate223:=(n223A2*N224A2+N233A2*N234a2)*three_Section_PNLvalue33.PNLA_Unit_Long_Number*three_Section_PNLvalue33.PNLA_Unit_Width_Number
                                          *three_Section_PNLvalue33.PNLA_Unit_Long*three_Section_PNLvalue33.PNLA_Unit_Width ;
                  rate223:=rate223/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
               end;
               if Tem_Calculate_Rate_Type1=2 then //用PNL计算
               begin
                  rate223:=(n223A2*N224A2+N233A2*N234a2)*three_Section_PNLvalue33.PNLA_Long *three_Section_PNLvalue33.PNLA_Width;
                  rate223:=rate223/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
               END;




               //小二区长排PNLA长,小三区可排PNLb,则只两种
              rate224:=n221A2*N222A2*three_Section_PNLvalue33.PNLA_Unit_Long_Number*three_Section_PNLvalue33.PNLA_Unit_Width_Number
                     +N231B2*N232B2*three_Section_PNLvalue33.PNLb_Unit_Long_Number*three_Section_PNLvalue33.PNLb_Unit_Width_Number;
               if Tem_Calculate_Rate_Type1=1 then  //用单元计算
               begin
                  rate224:=n221A2*N222A2*three_Section_PNLvalue33.PNLA_Unit_Long_Number*three_Section_PNLvalue33.PNLA_Unit_Width_Number
                                          *three_Section_PNLvalue33.PNLA_Unit_Long*three_Section_PNLvalue33.PNLA_Unit_Width
                         +N231B2*N232B2*three_Section_PNLvalue33.PNLb_Unit_Long_Number*three_Section_PNLvalue33.PNLb_Unit_Width_Number
                                        *three_Section_PNLvalue33.PNLb_Unit_Long*three_Section_PNLvalue33.PNLb_Unit_Width;
                  rate224:=rate224/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
               end;
               if Tem_Calculate_Rate_Type1=2 then //用PNL计算
               begin
                  rate224:=n221A2*N222A2*three_Section_PNLvalue33.PNLA_Long *three_Section_PNLvalue33.PNLA_Width
                           +N231B2*N232B2*three_Section_PNLvalue33.PNLb_Long *three_Section_PNLvalue33.PNLb_Width;
                  rate224:=rate224/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
               END;

              rate225:=n221A2*N222A2*three_Section_PNLvalue33.PNLA_Unit_Long_Number*three_Section_PNLvalue33.PNLA_Unit_Width_Number
                     +N233B2*N234B2*three_Section_PNLvalue33.PNLb_Unit_Long_Number*three_Section_PNLvalue33.PNLb_Unit_Width_Number;
              if Tem_Calculate_Rate_Type1=1 then  //用单元计算
               begin
                  rate225:=n221A2*N222A2*three_Section_PNLvalue33.PNLA_Unit_Long_Number*three_Section_PNLvalue33.PNLA_Unit_Width_Number
                                          *three_Section_PNLvalue33.PNLA_Unit_Long*three_Section_PNLvalue33.PNLA_Unit_Width
                         +N233B2*N234B2*three_Section_PNLvalue33.PNLb_Unit_Long_Number*three_Section_PNLvalue33.PNLb_Unit_Width_Number
                                        *three_Section_PNLvalue33.PNLb_Unit_Long*three_Section_PNLvalue33.PNLb_Unit_Width;
                  rate225:=rate225/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
               end;
               if Tem_Calculate_Rate_Type1=2 then //用PNL计算
               begin
                  rate225:=n221A2*N222A2*three_Section_PNLvalue33.PNLA_Long *three_Section_PNLvalue33.PNLA_Width
                           +N233B2*N234B2*three_Section_PNLvalue33.PNLb_Long *three_Section_PNLvalue33.PNLb_Width;
                  rate225:=rate225/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
               END;




              //小二区长排PNLB长,小三区可排PNLA,则只两种
              rate226:=n221B2*N222B2*three_Section_PNLvalue33.PNLb_Unit_Long_Number*three_Section_PNLvalue33.PNLb_Unit_Width_Number
                       +N231A2*N232A2*three_Section_PNLvalue33.PNLA_Unit_Long_Number*three_Section_PNLvalue33.PNLA_Unit_Width_Number;
               if Tem_Calculate_Rate_Type1=1 then  //用单元计算
               begin
                  rate226:=N231A2*N232A2*three_Section_PNLvalue33.PNLA_Unit_Long_Number*three_Section_PNLvalue33.PNLA_Unit_Width_Number
                                          *three_Section_PNLvalue33.PNLA_Unit_Long*three_Section_PNLvalue33.PNLA_Unit_Width
                         +n221B2*N222B2*three_Section_PNLvalue33.PNLb_Unit_Long_Number*three_Section_PNLvalue33.PNLb_Unit_Width_Number
                                        *three_Section_PNLvalue33.PNLb_Unit_Long*three_Section_PNLvalue33.PNLb_Unit_Width;
                  rate226:=rate226/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
               end;
               if Tem_Calculate_Rate_Type1=2 then //用PNL计算
               begin
                  rate226:=N231A2*N232A2*three_Section_PNLvalue33.PNLA_Long *three_Section_PNLvalue33.PNLA_Width
                           +n221B2*N222B2*three_Section_PNLvalue33.PNLb_Long *three_Section_PNLvalue33.PNLb_Width;
                  rate226:=rate226/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
               END;

              rate227:=n221B2*N222B2*three_Section_PNLvalue33.PNLb_Unit_Long_Number*three_Section_PNLvalue33.PNLb_Unit_Width_Number
                       +N233A2*N234A2*three_Section_PNLvalue33.PNLA_Unit_Long_Number*three_Section_PNLvalue33.PNLA_Unit_Width_Number;
              if Tem_Calculate_Rate_Type1=1 then  //用单元计算
               begin
                  rate227:=N233A2*N234A2*three_Section_PNLvalue33.PNLA_Unit_Long_Number*three_Section_PNLvalue33.PNLA_Unit_Width_Number
                                          *three_Section_PNLvalue33.PNLA_Unit_Long*three_Section_PNLvalue33.PNLA_Unit_Width
                         +n221B2*N222B2*three_Section_PNLvalue33.PNLb_Unit_Long_Number*three_Section_PNLvalue33.PNLb_Unit_Width_Number
                                        *three_Section_PNLvalue33.PNLb_Unit_Long*three_Section_PNLvalue33.PNLb_Unit_Width;
                  rate227:=rate227/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
               end;
               if Tem_Calculate_Rate_Type1=2 then //用PNL计算
               begin
                  rate227:=N233A2*N234A2*three_Section_PNLvalue33.PNLA_Long *three_Section_PNLvalue33.PNLA_Width
                           +n221B2*N222B2*three_Section_PNLvalue33.PNLb_Long *three_Section_PNLvalue33.PNLb_Width;
                  rate227:=rate227/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
               END;

              //小二区长排PNLB宽,小三区可排PNLA,则只两种
              rate228:=n223B2*N224B2*three_Section_PNLvalue33.PNLb_Unit_Long_Number*three_Section_PNLvalue33.PNLb_Unit_Width_Number
                       +N231A2*N232A2*three_Section_PNLvalue33.PNLA_Unit_Long_Number*three_Section_PNLvalue33.PNLA_Unit_Width_Number;
              if Tem_Calculate_Rate_Type1=1 then  //用单元计算
               begin
                  rate228:=N231A2*N232A2*three_Section_PNLvalue33.PNLA_Unit_Long_Number*three_Section_PNLvalue33.PNLA_Unit_Width_Number
                                          *three_Section_PNLvalue33.PNLA_Unit_Long*three_Section_PNLvalue33.PNLA_Unit_Width
                         +n223B2*N224B2*three_Section_PNLvalue33.PNLb_Unit_Long_Number*three_Section_PNLvalue33.PNLb_Unit_Width_Number
                                        *three_Section_PNLvalue33.PNLb_Unit_Long*three_Section_PNLvalue33.PNLb_Unit_Width;
                  rate228:=rate228/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
               end;
               if Tem_Calculate_Rate_Type1=2 then //用PNL计算
               begin
                  rate228:=N231A2*N232A2*three_Section_PNLvalue33.PNLA_Long *three_Section_PNLvalue33.PNLA_Width
                           +n223B2*N224B2*three_Section_PNLvalue33.PNLb_Long *three_Section_PNLvalue33.PNLb_Width;
                  rate228:=rate228/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
               END;

              rate229:=n223B2*N224B2*three_Section_PNLvalue33.PNLb_Unit_Long_Number*three_Section_PNLvalue33.PNLb_Unit_Width_Number
                       +N233A2*N234A2*three_Section_PNLvalue33.PNLA_Unit_Long_Number*three_Section_PNLvalue33.PNLA_Unit_Width_Number;
              if Tem_Calculate_Rate_Type1=1 then  //用单元计算
               begin
                  rate229:=N233A2*N234A2*three_Section_PNLvalue33.PNLA_Unit_Long_Number*three_Section_PNLvalue33.PNLA_Unit_Width_Number
                                          *three_Section_PNLvalue33.PNLA_Unit_Long*three_Section_PNLvalue33.PNLA_Unit_Width
                         +n223B2*N224B2*three_Section_PNLvalue33.PNLb_Unit_Long_Number*three_Section_PNLvalue33.PNLb_Unit_Width_Number
                                        *three_Section_PNLvalue33.PNLb_Unit_Long*three_Section_PNLvalue33.PNLb_Unit_Width;
                  rate229:=rate229/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
               end;
               if Tem_Calculate_Rate_Type1=2 then //用PNL计算
               begin
                  rate229:=N233A2*N234A2*three_Section_PNLvalue33.PNLA_Long *three_Section_PNLvalue33.PNLA_Width
                           +n223B2*N224B2*three_Section_PNLvalue33.PNLb_Long *three_Section_PNLvalue33.PNLb_Width;
                  rate229:=rate229/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
               END;

              //小二区长排PNLB长,小三区可排PNLB,则只两种
              rate230:=(n221B2*N222B2+N231B2*N232B2)*three_Section_PNLvalue33.PNLB_Unit_Long_Number*three_Section_PNLvalue33.PNLB_Unit_Width_Number;
              if Tem_Calculate_Rate_Type1=1 then  //用单元计算
               begin
                  rate230:=(n221B2*N222B2+N231B2*N232B2)*three_Section_PNLvalue33.PNLb_Unit_Long_Number*three_Section_PNLvalue33.PNLb_Unit_Width_Number
                                        *three_Section_PNLvalue33.PNLb_Unit_Long*three_Section_PNLvalue33.PNLb_Unit_Width;
                  rate230:=rate230/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
               end;
               if Tem_Calculate_Rate_Type1=2 then //用PNL计算
               begin
                  rate230:=(n221B2*N222B2+N231B2*N232B2)*three_Section_PNLvalue33.PNLb_Long *three_Section_PNLvalue33.PNLb_Width;
                  rate230:=rate230/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
               END;

              rate231:=(n221B2*N222B2+N233B2*N234B2)*three_Section_PNLvalue33.PNLB_Unit_Long_Number*three_Section_PNLvalue33.PNLB_Unit_Width_Number;
              if Tem_Calculate_Rate_Type1=1 then  //用单元计算
               begin
                  rate231:=(n221B2*N222B2+N233B2*N234B2)*three_Section_PNLvalue33.PNLb_Unit_Long_Number*three_Section_PNLvalue33.PNLb_Unit_Width_Number
                                        *three_Section_PNLvalue33.PNLb_Unit_Long*three_Section_PNLvalue33.PNLb_Unit_Width;
                  rate231:=rate231/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
               end;
               if Tem_Calculate_Rate_Type1=2 then //用PNL计算
               begin
                  rate231:=(n221B2*N222B2+N233B2*N234B2)*three_Section_PNLvalue33.PNLb_Long *three_Section_PNLvalue33.PNLb_Width;
                  rate231:=rate231/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
               END;

              //小二区长排PNLB宽,小三区可排PNLB,则只两种
              rate232:=(n223B2*N224B2+N231B2*N232B2)*three_Section_PNLvalue33.PNLB_Unit_Long_Number*three_Section_PNLvalue33.PNLB_Unit_Width_Number;
              if Tem_Calculate_Rate_Type1=1 then  //用单元计算
               begin
                  rate232:=(n223B2*N224B2+N231B2*N232B2)*three_Section_PNLvalue33.PNLb_Unit_Long_Number*three_Section_PNLvalue33.PNLb_Unit_Width_Number
                                        *three_Section_PNLvalue33.PNLb_Unit_Long*three_Section_PNLvalue33.PNLb_Unit_Width;
                  rate232:=rate232/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
               end;
               if Tem_Calculate_Rate_Type1=2 then //用PNL计算
               begin
                  rate223:=(n223B2*N224B2+N231B2*N232B2)*three_Section_PNLvalue33.PNLb_Long *three_Section_PNLvalue33.PNLb_Width;
                  rate232:=rate232/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
               END;

              rate233:=(n223B2*N224B2+N233B2*N234B2)*three_Section_PNLvalue33.PNLB_Unit_Long_Number*three_Section_PNLvalue33.PNLB_Unit_Width_Number;
              if Tem_Calculate_Rate_Type1=1 then  //用单元计算
               begin
                  rate233:=(n223B2*N224B2+N233B2*N234B2)*three_Section_PNLvalue33.PNLb_Unit_Long_Number*three_Section_PNLvalue33.PNLb_Unit_Width_Number
                                        *three_Section_PNLvalue33.PNLb_Unit_Long*three_Section_PNLvalue33.PNLb_Unit_Width;
                  rate233:=rate233/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
               end;
               if Tem_Calculate_Rate_Type1=2 then //用PNL计算
               begin
                  rate233:=(n223B2*N224B2+N233B2*N234B2)*three_Section_PNLvalue33.PNLb_Long *three_Section_PNLvalue33.PNLb_Width;
                  rate233:=rate233/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
               END;
             //2:小二区排PNLA,小三区排PNLB;分多种情况:小二区长边排宽,小三区长边排长;小二区长边排宽,小三区长边排宽;

             //3:小二区排PNLB,小三区排PNLA;

             //4:小二区,小三区排PNLB



            //从找出利用率最大的    200        201   213    221  233
             max21:=MAX(MAX(MAX(MAX(MAX(MAX(MAX(MAX(MAX(MAX(MAX(MAX(MAX(MAX(MAX(MAX(MAX(MAX(MAX(MAX(MAX(MAX(MAX(rate231,rate230),rate229),rate228),rate227),rate226),rate225),rate224),rate223),rate222),rate221),rate213),rate211),rate210),rate209),rate208),rate207),rate206),rate205),rate204),rate203),rate202),rate201),rate200);
             tem_rate2:=max21;
             if  rate233=max21 then //(n223B2*N224B2+N233B2*N234B2)
             begin  //N后的第三位数字表示长宽量是否调换,如为3,4则调换,后面的字母表示是第一种还是第二种排法,A表示第一种排法;B表示第二种排法
                array_type2:=33;   //小二区长排PNLB宽;小三区长排PNLB宽
                tempnl_sheet22.Section_LongA:=three_Section_PNLvalue33.PNLA_Long;
                tempnl_sheet22.Section_WidthA:=three_Section_PNLvalue33.PNLA_Width;
                tempnl_sheet22.Section_Long_NumberA:=i21;
                tempnl_sheet22.Section_Width_NumberA:=j21;
                tempnl_sheet22.Section_LongB:=three_Section_PNLvalue33.PNLb_Width;
                tempnl_sheet22.Section_WidthB:=three_Section_PNLvalue33.PNLb_Long;
                tempnl_sheet22.Section_Long_NumberB:=n223B2;
                tempnl_sheet22.Section_Width_NumberB:=N224B2;
                tempnl_sheet22.Section_LongB:=three_Section_PNLvalue33.PNLb_Width;
                tempnl_sheet22.Section_WidthB:=three_Section_PNLvalue33.PNLb_Long;
                tempnl_sheet22.Section_Long_NumberB:=N233B2;
                tempnl_sheet22.Section_Width_NumberB:=N234B2;
                tempnl_sheet22.Section_Unit_Number:=(n223B2*N224B2+N233B2*N234B2)*three_Section_PNLvalue33.PNLB_Unit_Long_Number*three_Section_PNLvalue33.PNLB_Unit_Width_Number+I21*J21*three_Section_PNLvalue33.PNLA_Unit_Long_Number*three_Section_PNLvalue33.PNLA_Unit_Width_Number;
             end;
             if  rate232=max21 then //(n223B2*N224B2+N231B2*N232B2)
             begin  //N后的第三位数字表示长宽量是否调换,如为3,4则调换,后面的字母表示是第一种还是第二种排法,A表示第一种排法;B表示第二种排法
                array_type2:=32;   //小二区长排PNLB宽;小三区长排PNLB宽
                tempnl_sheet22.Section_LongA:=three_Section_PNLvalue33.PNLA_Long;
                tempnl_sheet22.Section_WidthA:=three_Section_PNLvalue33.PNLA_Width;
                tempnl_sheet22.Section_Long_NumberA:=i21;
                tempnl_sheet22.Section_Width_NumberA:=j21;
                tempnl_sheet22.Section_LongB:=three_Section_PNLvalue33.PNLb_Width;
                tempnl_sheet22.Section_WidthB:=three_Section_PNLvalue33.PNLb_Long;
                tempnl_sheet22.Section_Long_NumberB:=n223B2;
                tempnl_sheet22.Section_Width_NumberB:=N224B2;
                tempnl_sheet22.Section_LongB:=three_Section_PNLvalue33.PNLb_Long;
                tempnl_sheet22.Section_WidthB:=three_Section_PNLvalue33.PNLb_Width;
                tempnl_sheet22.Section_Long_NumberB:=N231B2;
                tempnl_sheet22.Section_Width_NumberB:=N232B2;
                tempnl_sheet22.Section_Unit_Number:=(n223B2*N224B2+N231B2*N232B2)*three_Section_PNLvalue33.PNLB_Unit_Long_Number*three_Section_PNLvalue33.PNLB_Unit_Width_Number+I21*J21*three_Section_PNLvalue33.PNLA_Unit_Long_Number*three_Section_PNLvalue33.PNLA_Unit_Width_Number;
             end;
             //小二区长排PNLB长,小三区可排PNLB,则只两种
             if  rate230=max21 then // rate230:=  (n221B2*N222B2+N231B2*N232B2)
             begin  //N后的第三位数字表示长宽量是否调换,如为3,4则调换,后面的字母表示是第一种还是第二种排法,A表示第一种排法;B表示第二种排法
                array_type2:=30;   //小二区长排PNLB宽;小三区长排PNLB宽
                tempnl_sheet22.Section_LongA:=three_Section_PNLvalue33.PNLA_Long;
                tempnl_sheet22.Section_WidthA:=three_Section_PNLvalue33.PNLA_Width;
                tempnl_sheet22.Section_Long_NumberA:=i21;
                tempnl_sheet22.Section_Width_NumberA:=j21;
                tempnl_sheet22.Section_LongB:=three_Section_PNLvalue33.PNLb_Long;
                tempnl_sheet22.Section_WidthB:=three_Section_PNLvalue33.PNLb_Width;
                tempnl_sheet22.Section_Long_NumberB:=n221B2;
                tempnl_sheet22.Section_Width_NumberB:=N222B2;
                tempnl_sheet22.Section_LongB:=three_Section_PNLvalue33.PNLb_Long;
                tempnl_sheet22.Section_WidthB:=three_Section_PNLvalue33.PNLb_Width;
                tempnl_sheet22.Section_Long_NumberB:=N231B2;
                tempnl_sheet22.Section_Width_NumberB:=N232B2;
                tempnl_sheet22.Section_Unit_Number:=(n221B2*N222B2+N231B2*N232B2)*three_Section_PNLvalue33.PNLB_Unit_Long_Number*three_Section_PNLvalue33.PNLB_Unit_Width_Number+I21*J21*three_Section_PNLvalue33.PNLA_Unit_Long_Number*three_Section_PNLvalue33.PNLA_Unit_Width_Number;
             end;
             if  rate231=max21 then //rate231:=(n221B2*N222B2+N233B2*N234B2)
             begin  //N后的第三位数字表示长宽量是否调换,如为3,4则调换,后面的字母表示是第一种还是第二种排法,A表示第一种排法;B表示第二种排法
                array_type2:=31;   //小二区长排PNLB宽;小三区长排PNLB宽
                tempnl_sheet22.Section_LongA:=three_Section_PNLvalue33.PNLA_Long;
                tempnl_sheet22.Section_WidthA:=three_Section_PNLvalue33.PNLA_Width;
                tempnl_sheet22.Section_Long_NumberA:=i21;
                tempnl_sheet22.Section_Width_NumberA:=j21;
                tempnl_sheet22.Section_LongB:=three_Section_PNLvalue33.PNLb_Long ;
                tempnl_sheet22.Section_WidthB:=three_Section_PNLvalue33.PNLb_Width;
                tempnl_sheet22.Section_Long_NumberB:=n221B2;
                tempnl_sheet22.Section_Width_NumberB:=N222B2;
                tempnl_sheet22.Section_LongB:=three_Section_PNLvalue33.PNLb_Long;
                tempnl_sheet22.Section_WidthB:=three_Section_PNLvalue33.PNLb_Width;
                tempnl_sheet22.Section_Long_NumberB:=N231B2;
                tempnl_sheet22.Section_Width_NumberB:=N232B2;
                tempnl_sheet22.Section_Unit_Number:=(n221B2*N222B2+N233B2*N234B2)*three_Section_PNLvalue33.PNLB_Unit_Long_Number*three_Section_PNLvalue33.PNLB_Unit_Width_Number+I21*J21*three_Section_PNLvalue33.PNLA_Unit_Long_Number*three_Section_PNLvalue33.PNLA_Unit_Width_Number;
             end;
            //小二区长排PNLB宽,小三区可排PNLA,则只两种
            if  rate229=max21 then //rate229:=n223B2*N224B2+N233A2*N234A2
             begin  //N后的第三位数字表示长宽量是否调换,如为3,4则调换,后面的字母表示是第一种还是第二种排法,A表示第一种排法;B表示第二种排法
                array_type2:=29;   //小二区长排PNLB宽;小三区长排PNLB宽
                tempnl_sheet22.Section_LongA:=three_Section_PNLvalue33.PNLA_Long;
                tempnl_sheet22.Section_WidthA:=three_Section_PNLvalue33.PNLA_Width;
                tempnl_sheet22.Section_Long_NumberA:=i21;
                tempnl_sheet22.Section_Width_NumberA:=j21;
                tempnl_sheet22.Section_LongB:=three_Section_PNLvalue33.PNLb_Width;
                tempnl_sheet22.Section_WidthB:=three_Section_PNLvalue33.PNLb_Long;
                tempnl_sheet22.Section_Long_NumberB:=n223B2;
                tempnl_sheet22.Section_Width_NumberB:=N224B2;
                tempnl_sheet22.Section_LongB:=three_Section_PNLvalue33.PNLa_Width;
                tempnl_sheet22.Section_WidthB:=three_Section_PNLvalue33.PNLa_Long;
                tempnl_sheet22.Section_Long_NumberB:=N233A2;
                tempnl_sheet22.Section_Width_NumberB:=N234A2;
               tempnl_sheet22.Section_Unit_Number:=N233A2*N234A2*three_Section_PNLvalue33.PNLa_Unit_Long_Number*three_Section_PNLvalue33.PNLa_Unit_Width_Number+n223B2*N224B2*three_Section_PNLvalue33.PNLB_Unit_Long_Number*three_Section_PNLvalue33.PNLB_Unit_Width_Number+I21*J21*three_Section_PNLvalue33.PNLA_Unit_Long_Number*three_Section_PNLvalue33.PNLA_Unit_Width_Number;
             end;

             if  rate228=max21 then //rate228:=n223B2*N224B2+N231A2*N232A2
             begin  //N后的第三位数字表示长宽量是否调换,如为3,4则调换,后面的字母表示是第一种还是第二种排法,A表示第一种排法;B表示第二种排法
                array_type2:=28;   //小二区长排PNLB宽;小三区长排PNLB宽
                tempnl_sheet22.Section_LongA:=three_Section_PNLvalue33.PNLA_Long;
                tempnl_sheet22.Section_WidthA:=three_Section_PNLvalue33.PNLA_Width;
                tempnl_sheet22.Section_Long_NumberA:=i21;
                tempnl_sheet22.Section_Width_NumberA:=j21;
                tempnl_sheet22.Section_LongB:=three_Section_PNLvalue33.PNLb_Width;
                tempnl_sheet22.Section_WidthB:=three_Section_PNLvalue33.PNLb_Long;
                tempnl_sheet22.Section_Long_NumberB:=n223B2;
                tempnl_sheet22.Section_Width_NumberB:=N224B2;
                tempnl_sheet22.Section_LongB:=three_Section_PNLvalue33.PNLa_Long;
                tempnl_sheet22.Section_WidthB:=three_Section_PNLvalue33.PNLa_Width;
                tempnl_sheet22.Section_Long_NumberB:=N231A2;
                tempnl_sheet22.Section_Width_NumberB:=N232A2;
                tempnl_sheet22.Section_Unit_Number:=N231A2*N232A2*three_Section_PNLvalue33.PNLa_Unit_Long_Number*three_Section_PNLvalue33.PNLa_Unit_Width_Number
                                                   +n223B2*N224B2*three_Section_PNLvalue33.PNLB_Unit_Long_Number*three_Section_PNLvalue33.PNLB_Unit_Width_Number
                                                   +I21*J21*three_Section_PNLvalue33.PNLA_Unit_Long_Number*three_Section_PNLvalue33.PNLA_Unit_Width_Number;
             end;

             //小二区长排PNLB长,小三区可排PNLA,则只两种
             if  rate227=max21 then //rate227:=n221B2*N222B2+N233A2*N234A2
             begin  //N后的第三位数字表示长宽量是否调换,如为3,4则调换,后面的字母表示是第一种还是第二种排法,A表示第一种排法;B表示第二种排法
                array_type2:=27;   //小二区长排PNLB宽;小三区长排PNLB宽
                tempnl_sheet22.Section_LongA:=three_Section_PNLvalue33.PNLA_Long;
                tempnl_sheet22.Section_WidthA:=three_Section_PNLvalue33.PNLA_Width;
                tempnl_sheet22.Section_Long_NumberA:=i21;
                tempnl_sheet22.Section_Width_NumberA:=j21;
                tempnl_sheet22.Section_LongB:=three_Section_PNLvalue33.PNLb_Long;
                tempnl_sheet22.Section_WidthB:=three_Section_PNLvalue33.PNLb_Width;
                tempnl_sheet22.Section_Long_NumberB:=n221B2;
                tempnl_sheet22.Section_Width_NumberB:=N222B2;
                tempnl_sheet22.Section_LongB:=three_Section_PNLvalue33.PNLa_Width;
                tempnl_sheet22.Section_WidthB:=three_Section_PNLvalue33.PNLa_Long;
                tempnl_sheet22.Section_Long_NumberB:=N233A2;
                tempnl_sheet22.Section_Width_NumberB:=N234A2;
                tempnl_sheet22.Section_Unit_Number:=N233A2*N234A2*three_Section_PNLvalue33.PNLa_Unit_Long_Number*three_Section_PNLvalue33.PNLa_Unit_Width_Number
                                                   +n221B2*N222B2*three_Section_PNLvalue33.PNLB_Unit_Long_Number*three_Section_PNLvalue33.PNLB_Unit_Width_Number
                                                   +I21*J21*three_Section_PNLvalue33.PNLA_Unit_Long_Number*three_Section_PNLvalue33.PNLA_Unit_Width_Number;
             end;
             if  rate226=max21 then //rate226:=n221B2*N222B2+N231A2*N232A2
             begin  //N后的第三位数字表示长宽量是否调换,如为3,4则调换,后面的字母表示是第一种还是第二种排法,A表示第一种排法;B表示第二种排法
                array_type2:=26;   //小二区长排PNLB宽;小三区长排PNLB宽
                tempnl_sheet22.Section_LongA:=three_Section_PNLvalue33.PNLA_Long;
                tempnl_sheet22.Section_WidthA:=three_Section_PNLvalue33.PNLA_Width;
                tempnl_sheet22.Section_Long_NumberA:=i21;
                tempnl_sheet22.Section_Width_NumberA:=j21;
                tempnl_sheet22.Section_LongB:=three_Section_PNLvalue33.PNLb_Long;
                tempnl_sheet22.Section_WidthB:=three_Section_PNLvalue33.PNLb_Width;
                tempnl_sheet22.Section_Long_NumberB:=n221B2;
                tempnl_sheet22.Section_Width_NumberB:=N222B2;
                tempnl_sheet22.Section_LongB:=three_Section_PNLvalue33.PNLa_Long;
                tempnl_sheet22.Section_WidthB:=three_Section_PNLvalue33.PNLa_Width;
                tempnl_sheet22.Section_Long_NumberB:=N231A2;
                tempnl_sheet22.Section_Width_NumberB:=N232A2;
                tempnl_sheet22.Section_Unit_Number:=N231A2*N232A2*three_Section_PNLvalue33.PNLa_Unit_Long_Number*three_Section_PNLvalue33.PNLa_Unit_Width_Number
                                                   +n221B2*N222B2*three_Section_PNLvalue33.PNLB_Unit_Long_Number*three_Section_PNLvalue33.PNLB_Unit_Width_Number
                                                   +I21*J21*three_Section_PNLvalue33.PNLA_Unit_Long_Number*three_Section_PNLvalue33.PNLA_Unit_Width_Number;
             end;
             //小二区长排PNLA长,小三区可排PNLb,则只两种
             if  rate225=max21 then // rate225:=n221A2*N222A2+N233B2*N234B2
             begin  //N后的第三位数字表示长宽量是否调换,如为3,4则调换,后面的字母表示是第一种还是第二种排法,A表示第一种排法;B表示第二种排法
                array_type2:=25;   //小二区长排PNLB宽;小三区长排PNLB宽
                tempnl_sheet22.Section_LongA:=three_Section_PNLvalue33.PNLA_Long;
                tempnl_sheet22.Section_WidthA:=three_Section_PNLvalue33.PNLA_Width;
                tempnl_sheet22.Section_Long_NumberA:=i21;
                tempnl_sheet22.Section_Width_NumberA:=j21;
                tempnl_sheet22.Section_LongB:=three_Section_PNLvalue33.PNLa_Long ;
                tempnl_sheet22.Section_WidthB:=three_Section_PNLvalue33.PNLa_Width ;
                tempnl_sheet22.Section_Long_NumberB:=n221A2;
                tempnl_sheet22.Section_Width_NumberB:=N222A2;
                tempnl_sheet22.Section_LongB:=three_Section_PNLvalue33.PNLb_Width;
                tempnl_sheet22.Section_WidthB:=three_Section_PNLvalue33.PNLb_Long;
                tempnl_sheet22.Section_Long_NumberB:=N233B2;
                tempnl_sheet22.Section_Width_NumberB:=N234B2;
                tempnl_sheet22.Section_Unit_Number:=n221A2*N222A2*three_Section_PNLvalue33.PNLa_Unit_Long_Number*three_Section_PNLvalue33.PNLa_Unit_Width_Number
                                                   +N233B2*N234B2*three_Section_PNLvalue33.PNLB_Unit_Long_Number*three_Section_PNLvalue33.PNLB_Unit_Width_Number
                                                   +I21*J21*three_Section_PNLvalue33.PNLA_Unit_Long_Number*three_Section_PNLvalue33.PNLA_Unit_Width_Number;
             end;
             if  rate224=max21 then // rate224:=n221A2*N222A2+N231B2*N232B2
             begin  //N后的第三位数字表示长宽量是否调换,如为3,4则调换,后面的字母表示是第一种还是第二种排法,A表示第一种排法;B表示第二种排法
                array_type2:=24;   //小二区长排PNLB宽;小三区长排PNLB宽
                tempnl_sheet22.Section_LongA:=three_Section_PNLvalue33.PNLA_Long;
                tempnl_sheet22.Section_WidthA:=three_Section_PNLvalue33.PNLA_Width;
                tempnl_sheet22.Section_Long_NumberA:=i21;
                tempnl_sheet22.Section_Width_NumberA:=j21;
                tempnl_sheet22.Section_LongB:=three_Section_PNLvalue33.PNLa_Long;
                tempnl_sheet22.Section_WidthB:=three_Section_PNLvalue33.PNLa_Width;
                tempnl_sheet22.Section_Long_NumberB:=n221A2;
                tempnl_sheet22.Section_Width_NumberB:=N222A2;
                tempnl_sheet22.Section_LongB:=three_Section_PNLvalue33.PNLb_Long;
                tempnl_sheet22.Section_WidthB:=three_Section_PNLvalue33.PNLb_Width;
                tempnl_sheet22.Section_Long_NumberB:=N231B2;
                tempnl_sheet22.Section_Width_NumberB:=N232B2;
                tempnl_sheet22.Section_Unit_Number:=n221A2*N222A2*three_Section_PNLvalue33.PNLa_Unit_Long_Number*three_Section_PNLvalue33.PNLa_Unit_Width_Number
                                                   +N231B2*N232B2*three_Section_PNLvalue33.PNLB_Unit_Long_Number*three_Section_PNLvalue33.PNLB_Unit_Width_Number
                                                   +I21*J21*three_Section_PNLvalue33.PNLA_Unit_Long_Number*three_Section_PNLvalue33.PNLA_Unit_Width_Number;
             end;
             if  rate223=max21 then //rate223:=(n223A2*N224A2+N233A2*N234a2)
             begin  //N后的第三位数字表示长宽量是否调换,如为3,4则调换,后面的字母表示是第一种还是第二种排法,A表示第一种排法;B表示第二种排法
                array_type2:=23;   //小二区长排PNLB宽;小三区长排PNLB宽
                tempnl_sheet22.Section_LongA:=three_Section_PNLvalue33.PNLA_Long;
                tempnl_sheet22.Section_WidthA:=three_Section_PNLvalue33.PNLA_Width;
                tempnl_sheet22.Section_Long_NumberA:=i21;
                tempnl_sheet22.Section_Width_NumberA:=j21;
                tempnl_sheet22.Section_LongB:=three_Section_PNLvalue33.PNLa_Width;
                tempnl_sheet22.Section_WidthB:=three_Section_PNLvalue33.PNLa_Long;
                tempnl_sheet22.Section_Long_NumberB:=n223A2;
                tempnl_sheet22.Section_Width_NumberB:=N224A2;
                tempnl_sheet22.Section_LongB:=three_Section_PNLvalue33.PNLa_Width;
                tempnl_sheet22.Section_WidthB:=three_Section_PNLvalue33.PNLa_Long;
                tempnl_sheet22.Section_Long_NumberB:=N233A2;
                tempnl_sheet22.Section_Width_NumberB:=N234a2;
                tempnl_sheet22.Section_Unit_Number:=(n223A2*N224A2+N233A2*N234a2)*three_Section_PNLvalue33.PNLa_Unit_Long_Number*three_Section_PNLvalue33.PNLa_Unit_Width_Number
                                                 //  +n223B2*N224B2*three_Section_PNLvalue33.PNLB_Unit_Long_Number*three_Section_PNLvalue33.PNLB_Unit_Width_Number
                                                   +I21*J21*three_Section_PNLvalue33.PNLA_Unit_Long_Number*three_Section_PNLvalue33.PNLA_Unit_Width_Number;
             end;
             if  rate222=max21 then //rate222:=(n223A2*N224A2+N231A2*N232a2)
             begin  //N后的第三位数字表示长宽量是否调换,如为3,4则调换,后面的字母表示是第一种还是第二种排法,A表示第一种排法;B表示第二种排法
                array_type2:=22;   //小二区长排PNLB宽;小三区长排PNLB宽
                tempnl_sheet22.Section_LongA:=three_Section_PNLvalue33.PNLA_Long;
                tempnl_sheet22.Section_WidthA:=three_Section_PNLvalue33.PNLA_Width;
                tempnl_sheet22.Section_Long_NumberA:=i21;
                tempnl_sheet22.Section_Width_NumberA:=j21;
                tempnl_sheet22.Section_LongB:=three_Section_PNLvalue33.PNLa_Width;
                tempnl_sheet22.Section_WidthB:=three_Section_PNLvalue33.PNLa_Long;
                tempnl_sheet22.Section_Long_NumberB:=n223A2;
                tempnl_sheet22.Section_Width_NumberB:=N224A2;
                tempnl_sheet22.Section_LongB:=three_Section_PNLvalue33.PNLa_Long;
                tempnl_sheet22.Section_WidthB:=three_Section_PNLvalue33.PNLa_Width;
                tempnl_sheet22.Section_Long_NumberB:=N231A2;
                tempnl_sheet22.Section_Width_NumberB:=N232a2;
                tempnl_sheet22.Section_Unit_Number:=(n223A2*N224A2+N231A2*N232a2)*three_Section_PNLvalue33.PNLa_Unit_Long_Number*three_Section_PNLvalue33.PNLa_Unit_Width_Number
                                                  // +n223B2*N224B2*three_Section_PNLvalue33.PNLB_Unit_Long_Number*three_Section_PNLvalue33.PNLB_Unit_Width_Number
                                                   +I21*J21*three_Section_PNLvalue33.PNLA_Unit_Long_Number*three_Section_PNLvalue33.PNLA_Unit_Width_Number;
             end;

             if  rate221=max21 then //rate221:=(n221A2*N222A2+N233A2*N234a2)
             begin  //N后的第三位数字表示长宽量是否调换,如为3,4则调换,后面的字母表示是第一种还是第二种排法,A表示第一种排法;B表示第二种排法
                array_type2:=21;   //小二区长排PNLB宽;小三区长排PNLB宽
                tempnl_sheet22.Section_LongA:=three_Section_PNLvalue33.PNLA_Long;
                tempnl_sheet22.Section_WidthA:=three_Section_PNLvalue33.PNLA_Width;
                tempnl_sheet22.Section_Long_NumberA:=i21;
                tempnl_sheet22.Section_Width_NumberA:=j21;
                tempnl_sheet22.Section_LongB:=three_Section_PNLvalue33.PNLa_Long;
                tempnl_sheet22.Section_WidthB:=three_Section_PNLvalue33.PNLa_Width;
                tempnl_sheet22.Section_Long_NumberB:=n221A2;
                tempnl_sheet22.Section_Width_NumberB:=N222A2;
                tempnl_sheet22.Section_LongB:=three_Section_PNLvalue33.PNLa_Width;
                tempnl_sheet22.Section_WidthB:=three_Section_PNLvalue33.PNLa_Long;
                tempnl_sheet22.Section_Long_NumberB:=N233A2;
                tempnl_sheet22.Section_Width_NumberB:=N234a2;
                tempnl_sheet22.Section_Unit_Number:=(n221A2*N222A2+N233A2*N234a2)*three_Section_PNLvalue33.PNLa_Unit_Long_Number*three_Section_PNLvalue33.PNLa_Unit_Width_Number
                                                   //+n223B2*N224B2*three_Section_PNLvalue33.PNLB_Unit_Long_Number*three_Section_PNLvalue33.PNLB_Unit_Width_Number
                                                   +I21*J21*three_Section_PNLvalue33.PNLA_Unit_Long_Number*three_Section_PNLvalue33.PNLA_Unit_Width_Number;
             end;
             //以下第一种排法,以上第二种排法
             if  rate213=max21 then // rate213:=(n223B1*N224B1+N233B1*N234B1)
             begin  //N后的第三位数字表示长宽量是否调换,如为3,4则调换,后面的字母表示是第一种还是第二种排法,A表示第一种排法;B表示第二种排法
                array_type2:=13;   //小二区长排PNLB宽;小三区长排PNLB宽
                tempnl_sheet22.Section_LongA:=three_Section_PNLvalue33.PNLA_Long;
                tempnl_sheet22.Section_WidthA:=three_Section_PNLvalue33.PNLA_Width;
                tempnl_sheet22.Section_Long_NumberA:=i21;
                tempnl_sheet22.Section_Width_NumberA:=j21;
                tempnl_sheet22.Section_LongB:=three_Section_PNLvalue33.PNLb_Width;
                tempnl_sheet22.Section_WidthB:=three_Section_PNLvalue33.PNLb_Long;
                tempnl_sheet22.Section_Long_NumberB:=n223B1;
                tempnl_sheet22.Section_Width_NumberB:=N224B1;
                tempnl_sheet22.Section_LongB:=three_Section_PNLvalue33.PNLb_Width;
                tempnl_sheet22.Section_WidthB:=three_Section_PNLvalue33.PNLb_Long;
                tempnl_sheet22.Section_Long_NumberB:=N233B1;
                tempnl_sheet22.Section_Width_NumberB:=N234B1;
                tempnl_sheet22.Section_Unit_Number:=//(n221A2*N222A2+N233A2*N234a2)*three_Section_PNLvalue33.PNLa_Unit_Long_Number*three_Section_PNLvalue33.PNLa_Unit_Width_Number
                                                   (n223B1*N224B1+N233B1*N234B1)*three_Section_PNLvalue33.PNLB_Unit_Long_Number*three_Section_PNLvalue33.PNLB_Unit_Width_Number
                                                   +I21*J21*three_Section_PNLvalue33.PNLA_Unit_Long_Number*three_Section_PNLvalue33.PNLA_Unit_Width_Number;
             end;

             if  rate212=max21 then //  rate212:=(n223B1*N224B1+N231B1*N232B1)
             begin  //N后的第三位数字表示长宽量是否调换,如为3,4则调换,后面的字母表示是第一种还是第二种排法,A表示第一种排法;B表示第二种排法
                array_type2:=12;   //小二区长排PNLB宽;小三区长排PNLB宽
                tempnl_sheet22.Section_LongA:=three_Section_PNLvalue33.PNLA_Long;
                tempnl_sheet22.Section_WidthA:=three_Section_PNLvalue33.PNLA_Width;
                tempnl_sheet22.Section_Long_NumberA:=i21;
                tempnl_sheet22.Section_Width_NumberA:=j21;
                tempnl_sheet22.Section_LongB:=three_Section_PNLvalue33.PNLb_Width;
                tempnl_sheet22.Section_WidthB:=three_Section_PNLvalue33.PNLb_Long;
                tempnl_sheet22.Section_Long_NumberB:=n223B1;
                tempnl_sheet22.Section_Width_NumberB:=N224B1;
                tempnl_sheet22.Section_LongB:=three_Section_PNLvalue33.PNLb_Long;
                tempnl_sheet22.Section_WidthB:=three_Section_PNLvalue33.PNLb_Width;
                tempnl_sheet22.Section_Long_NumberB:=N231B1;
                tempnl_sheet22.Section_Width_NumberB:=N232B1;
                tempnl_sheet22.Section_Unit_Number:=//(n221A2*N222A2+N233A2*N234a2)*three_Section_PNLvalue33.PNLa_Unit_Long_Number*three_Section_PNLvalue33.PNLa_Unit_Width_Number
                                                   (n223B1*N224B1+N231B1*N232B1)*three_Section_PNLvalue33.PNLB_Unit_Long_Number*three_Section_PNLvalue33.PNLB_Unit_Width_Number
                                                   +I21*J21*three_Section_PNLvalue33.PNLA_Unit_Long_Number*three_Section_PNLvalue33.PNLA_Unit_Width_Number;
             end;

             if  rate211=max21 then // rate211:=(n221B1*N222B1+N233B1*N234B1)
             begin  //N后的第三位数字表示长宽量是否调换,如为3,4则调换,后面的字母表示是第一种还是第二种排法,A表示第一种排法;B表示第二种排法
                array_type2:=11;   //小二区长排PNLB宽;小三区长排PNLB宽
                tempnl_sheet22.Section_LongA:=three_Section_PNLvalue33.PNLA_Long;
                tempnl_sheet22.Section_WidthA:=three_Section_PNLvalue33.PNLA_Width;
                tempnl_sheet22.Section_Long_NumberA:=i21;
                tempnl_sheet22.Section_Width_NumberA:=j21;
                tempnl_sheet22.Section_LongB:=three_Section_PNLvalue33.PNLb_Long;
                tempnl_sheet22.Section_WidthB:=three_Section_PNLvalue33.PNLb_Width;
                tempnl_sheet22.Section_Long_NumberB:=n221B1;
                tempnl_sheet22.Section_Width_NumberB:=N222B1;
                tempnl_sheet22.Section_LongB:=three_Section_PNLvalue33.PNLb_Width;
                tempnl_sheet22.Section_WidthB:=three_Section_PNLvalue33.PNLb_Long;
                tempnl_sheet22.Section_Long_NumberB:=N233B1;
                tempnl_sheet22.Section_Width_NumberB:=N234B1;
                tempnl_sheet22.Section_Unit_Number:=//(n221A2*N222A2+N233A2*N234a2)*three_Section_PNLvalue33.PNLa_Unit_Long_Number*three_Section_PNLvalue33.PNLa_Unit_Width_Number
                                                   (n221B1*N222B1+N233B1*N234B1)*three_Section_PNLvalue33.PNLB_Unit_Long_Number*three_Section_PNLvalue33.PNLB_Unit_Width_Number
                                                   +I21*J21*three_Section_PNLvalue33.PNLA_Unit_Long_Number*three_Section_PNLvalue33.PNLA_Unit_Width_Number;
             end;

             if  rate210=max21 then // rate210:=(n221B1*N222B1+N231B1*N232B1)
             begin  //N后的第三位数字表示长宽量是否调换,如为3,4则调换,后面的字母表示是第一种还是第二种排法,A表示第一种排法;B表示第二种排法
                array_type2:=10;   //小二区长排PNLB宽;小三区长排PNLB宽
                tempnl_sheet22.Section_LongA:=three_Section_PNLvalue33.PNLA_Long;
                tempnl_sheet22.Section_WidthA:=three_Section_PNLvalue33.PNLA_Width;
                tempnl_sheet22.Section_Long_NumberA:=i21;
                tempnl_sheet22.Section_Width_NumberA:=j21;
                tempnl_sheet22.Section_LongB:=three_Section_PNLvalue33.PNLb_Width;
                tempnl_sheet22.Section_WidthB:=three_Section_PNLvalue33.PNLb_Long;
                tempnl_sheet22.Section_Long_NumberB:=n221B1;
                tempnl_sheet22.Section_Width_NumberB:=N222B1;
                tempnl_sheet22.Section_LongB:=three_Section_PNLvalue33.PNLb_Width;
                tempnl_sheet22.Section_WidthB:=three_Section_PNLvalue33.PNLb_Long;
                tempnl_sheet22.Section_Long_NumberB:=N231B1;
                tempnl_sheet22.Section_Width_NumberB:=N232B1;
                tempnl_sheet22.Section_Unit_Number:=//(n221A2*N222A2+N233A2*N234a2)*three_Section_PNLvalue33.PNLa_Unit_Long_Number*three_Section_PNLvalue33.PNLa_Unit_Width_Number
                                                   (n221B1*N222B1+N231B1*N232B1)*three_Section_PNLvalue33.PNLB_Unit_Long_Number*three_Section_PNLvalue33.PNLB_Unit_Width_Number
                                                   +I21*J21*three_Section_PNLvalue33.PNLA_Unit_Long_Number*three_Section_PNLvalue33.PNLA_Unit_Width_Number;
             end;

             if  rate209=max21 then //   rate209:=n223B1*N224B1+N233A1*N234A1
             begin  //N后的第三位数字表示长宽量是否调换,如为3,4则调换,后面的字母表示是第一种还是第二种排法,A表示第一种排法;B表示第二种排法
                array_type2:=9;   //小二区长排PNLB宽;小三区长排PNLB宽
                tempnl_sheet22.Section_LongA:=three_Section_PNLvalue33.PNLA_Long;
                tempnl_sheet22.Section_WidthA:=three_Section_PNLvalue33.PNLA_Width;
                tempnl_sheet22.Section_Long_NumberA:=i21;
                tempnl_sheet22.Section_Width_NumberA:=j21;
                tempnl_sheet22.Section_LongB:=three_Section_PNLvalue33.PNLb_Width;
                tempnl_sheet22.Section_WidthB:=three_Section_PNLvalue33.PNLb_Long;
                tempnl_sheet22.Section_Long_NumberB:=n223B1;
                tempnl_sheet22.Section_Width_NumberB:=N224B1;
                tempnl_sheet22.Section_LongB:=three_Section_PNLvalue33.PNLa_Width;
                tempnl_sheet22.Section_WidthB:=three_Section_PNLvalue33.PNLa_Long;
                tempnl_sheet22.Section_Long_NumberB:=N233A2;
                tempnl_sheet22.Section_Width_NumberB:=N234a2;
                tempnl_sheet22.Section_Unit_Number:=N233A1*N234A1*three_Section_PNLvalue33.PNLa_Unit_Long_Number*three_Section_PNLvalue33.PNLa_Unit_Width_Number
                                                   +n223B1*N224B1*three_Section_PNLvalue33.PNLB_Unit_Long_Number*three_Section_PNLvalue33.PNLB_Unit_Width_Number
                                                   +I21*J21*three_Section_PNLvalue33.PNLA_Unit_Long_Number*three_Section_PNLvalue33.PNLA_Unit_Width_Number;
             end;

             if  rate208=max21 then //   rate208:=n223B1*N224B1+N231A1*N232A1
             begin  //N后的第三位数字表示长宽量是否调换,如为3,4则调换,后面的字母表示是第一种还是第二种排法,A表示第一种排法;B表示第二种排法
                array_type2:=8;   //小二区长排PNLB宽;小三区长排PNLB宽
                tempnl_sheet22.Section_LongA:=three_Section_PNLvalue33.PNLA_Long;
                tempnl_sheet22.Section_WidthA:=three_Section_PNLvalue33.PNLA_Width;
                tempnl_sheet22.Section_Long_NumberA:=i21;
                tempnl_sheet22.Section_Width_NumberA:=j21;
                tempnl_sheet22.Section_LongB:=three_Section_PNLvalue33.PNLb_Width;
                tempnl_sheet22.Section_WidthB:=three_Section_PNLvalue33.PNLb_Long;
                tempnl_sheet22.Section_Long_NumberB:=n223B1;
                tempnl_sheet22.Section_Width_NumberB:=N224B1;
                tempnl_sheet22.Section_LongB:=three_Section_PNLvalue33.PNLa_Long;
                tempnl_sheet22.Section_WidthB:=three_Section_PNLvalue33.PNLa_Width;
                tempnl_sheet22.Section_Long_NumberB:=N231A1;
                tempnl_sheet22.Section_Width_NumberB:=N232A1;
                tempnl_sheet22.Section_Unit_Number:=N231A1*N232A1*three_Section_PNLvalue33.PNLa_Unit_Long_Number*three_Section_PNLvalue33.PNLa_Unit_Width_Number
                                                   +n223B1*N224B1*three_Section_PNLvalue33.PNLB_Unit_Long_Number*three_Section_PNLvalue33.PNLB_Unit_Width_Number
                                                   +I21*J21*three_Section_PNLvalue33.PNLA_Unit_Long_Number*three_Section_PNLvalue33.PNLA_Unit_Width_Number;
             end;

             if  rate207=max21 then // rate207:=n221B1*N222B1+N233A1*N234A1
             begin  //N后的第三位数字表示长宽量是否调换,如为3,4则调换,后面的字母表示是第一种还是第二种排法,A表示第一种排法;B表示第二种排法
                array_type2:=7;   //小二区长排PNLB宽;小三区长排PNLB宽
                tempnl_sheet22.Section_LongA:=three_Section_PNLvalue33.PNLA_Long;
                tempnl_sheet22.Section_WidthA:=three_Section_PNLvalue33.PNLA_Width;
                tempnl_sheet22.Section_Long_NumberA:=i21;
                tempnl_sheet22.Section_Width_NumberA:=j21;
                tempnl_sheet22.Section_LongB:=three_Section_PNLvalue33.PNLb_Long;
                tempnl_sheet22.Section_WidthB:=three_Section_PNLvalue33.PNLb_Width;
                tempnl_sheet22.Section_Long_NumberB:=n221B1;
                tempnl_sheet22.Section_Width_NumberB:=N222B1;
                tempnl_sheet22.Section_LongB:=three_Section_PNLvalue33.PNLa_Width;
                tempnl_sheet22.Section_WidthB:=three_Section_PNLvalue33.PNLa_Long;
                tempnl_sheet22.Section_Long_NumberB:=N233A2;
                tempnl_sheet22.Section_Width_NumberB:=N234a2;
                tempnl_sheet22.Section_Unit_Number:=N233A1*N234A1*three_Section_PNLvalue33.PNLa_Unit_Long_Number*three_Section_PNLvalue33.PNLa_Unit_Width_Number
                                                   +n221B1*N222B1*three_Section_PNLvalue33.PNLB_Unit_Long_Number*three_Section_PNLvalue33.PNLB_Unit_Width_Number
                                                   +I21*J21*three_Section_PNLvalue33.PNLA_Unit_Long_Number*three_Section_PNLvalue33.PNLA_Unit_Width_Number;
             end;


             if  rate206=max21 then //  rate206:=n221B1*N222B1+N231A1*N232A1
             begin  //N后的第三位数字表示长宽量是否调换,如为3,4则调换,后面的字母表示是第一种还是第二种排法,A表示第一种排法;B表示第二种排法
                array_type2:=6;   //小二区长排PNLB宽;小三区长排PNLB宽
                tempnl_sheet22.Section_LongA:=three_Section_PNLvalue33.PNLA_Long;
                tempnl_sheet22.Section_WidthA:=three_Section_PNLvalue33.PNLA_Width;
                tempnl_sheet22.Section_Long_NumberA:=i21;
                tempnl_sheet22.Section_Width_NumberA:=j21;
                tempnl_sheet22.Section_LongB:=three_Section_PNLvalue33.PNLb_Long;
                tempnl_sheet22.Section_WidthB:=three_Section_PNLvalue33.PNLb_Width;
                tempnl_sheet22.Section_Long_NumberB:=n221B1;
                tempnl_sheet22.Section_Width_NumberB:=N222B1;
                tempnl_sheet22.Section_LongB:=three_Section_PNLvalue33.PNLa_Long;
                tempnl_sheet22.Section_WidthB:=three_Section_PNLvalue33.PNLa_Width;
                tempnl_sheet22.Section_Long_NumberB:=N231A1;
                tempnl_sheet22.Section_Width_NumberB:=N232A1;
                tempnl_sheet22.Section_Unit_Number:=N231A1*N232A1*three_Section_PNLvalue33.PNLa_Unit_Long_Number*three_Section_PNLvalue33.PNLa_Unit_Width_Number
                                                   +n221B1*N222B1*three_Section_PNLvalue33.PNLB_Unit_Long_Number*three_Section_PNLvalue33.PNLB_Unit_Width_Number
                                                   +I21*J21*three_Section_PNLvalue33.PNLA_Unit_Long_Number*three_Section_PNLvalue33.PNLA_Unit_Width_Number;
             end;

              if  rate205=max21 then //  rate205:=n221A1*N222A1+N233B1*N234B1
             begin  //N后的第三位数字表示长宽量是否调换,如为3,4则调换,后面的字母表示是第一种还是第二种排法,A表示第一种排法;B表示第二种排法
                array_type2:=5;   //小二区长排PNLB宽;小三区长排PNLB宽
                tempnl_sheet22.Section_LongA:=three_Section_PNLvalue33.PNLA_Long;
                tempnl_sheet22.Section_WidthA:=three_Section_PNLvalue33.PNLA_Width;
                tempnl_sheet22.Section_Long_NumberA:=i21;
                tempnl_sheet22.Section_Width_NumberA:=j21;
                tempnl_sheet22.Section_LongB:=three_Section_PNLvalue33.PNLa_Long;
                tempnl_sheet22.Section_WidthB:=three_Section_PNLvalue33.PNLa_Width;
                tempnl_sheet22.Section_Long_NumberB:=n221A2;
                tempnl_sheet22.Section_Width_NumberB:=N222A2;
                tempnl_sheet22.Section_LongB:=three_Section_PNLvalue33.PNLb_Width;
                tempnl_sheet22.Section_WidthB:=three_Section_PNLvalue33.PNLb_Long;
                tempnl_sheet22.Section_Long_NumberB:=N233B1;
                tempnl_sheet22.Section_Width_NumberB:=N234B1;
                tempnl_sheet22.Section_Unit_Number:=n221A1*N222A1*three_Section_PNLvalue33.PNLa_Unit_Long_Number*three_Section_PNLvalue33.PNLa_Unit_Width_Number
                                                   +N233B1*N234B1*three_Section_PNLvalue33.PNLB_Unit_Long_Number*three_Section_PNLvalue33.PNLB_Unit_Width_Number
                                                   +I21*J21*three_Section_PNLvalue33.PNLA_Unit_Long_Number*three_Section_PNLvalue33.PNLA_Unit_Width_Number;
             end;

             if  rate204=max21 then //  rate204:=n221A1*N222A1+N231B1*N232B1
             begin  //N后的第三位数字表示长宽量是否调换,如为3,4则调换,后面的字母表示是第一种还是第二种排法,A表示第一种排法;B表示第二种排法
                array_type2:=4;   //小二区长排PNLB宽;小三区长排PNLB宽
                tempnl_sheet22.Section_LongA:=three_Section_PNLvalue33.PNLA_Long;
                tempnl_sheet22.Section_WidthA:=three_Section_PNLvalue33.PNLA_Width;
                tempnl_sheet22.Section_Long_NumberA:=i21;
                tempnl_sheet22.Section_Width_NumberA:=j21;
                tempnl_sheet22.Section_LongB:=three_Section_PNLvalue33.PNLa_Long;
                tempnl_sheet22.Section_WidthB:=three_Section_PNLvalue33.PNLa_Width;
                tempnl_sheet22.Section_Long_NumberB:=n221A2;
                tempnl_sheet22.Section_Width_NumberB:=N222A2;
                tempnl_sheet22.Section_LongB:=three_Section_PNLvalue33.PNLb_Long;
                tempnl_sheet22.Section_WidthB:=three_Section_PNLvalue33.PNLb_Width;
                tempnl_sheet22.Section_Long_NumberB:=N231B1;
                tempnl_sheet22.Section_Width_NumberB:=N232B1;
                tempnl_sheet22.Section_Unit_Number:=n221A1*N222A1*three_Section_PNLvalue33.PNLa_Unit_Long_Number*three_Section_PNLvalue33.PNLa_Unit_Width_Number
                                                   +N231B1*N232B1*three_Section_PNLvalue33.PNLB_Unit_Long_Number*three_Section_PNLvalue33.PNLB_Unit_Width_Number
                                                   +I21*J21*three_Section_PNLvalue33.PNLA_Unit_Long_Number*three_Section_PNLvalue33.PNLA_Unit_Width_Number;
             end;

             if  rate203=max21 then // rate203:=(n223A1*N224A1+N233A1*N234a1)
             begin  //N后的第三位数字表示长宽量是否调换,如为3,4则调换,后面的字母表示是第一种还是第二种排法,A表示第一种排法;B表示第二种排法
                array_type2:=3;   //小二区长排PNLB宽;小三区长排PNLB宽
                tempnl_sheet22.Section_LongA:=three_Section_PNLvalue33.PNLA_Long;
                tempnl_sheet22.Section_WidthA:=three_Section_PNLvalue33.PNLA_Width;
                tempnl_sheet22.Section_Long_NumberA:=i21;
                tempnl_sheet22.Section_Width_NumberA:=j21;
                tempnl_sheet22.Section_LongB:=three_Section_PNLvalue33.PNLa_Width;
                tempnl_sheet22.Section_WidthB:=three_Section_PNLvalue33.PNLa_Long;
                tempnl_sheet22.Section_Long_NumberB:=n223A1;
                tempnl_sheet22.Section_Width_NumberB:=N224A1;
                tempnl_sheet22.Section_LongB:=three_Section_PNLvalue33.PNLa_Width;
                tempnl_sheet22.Section_WidthB:=three_Section_PNLvalue33.PNLa_Long;
                tempnl_sheet22.Section_Long_NumberB:=N233A1;
                tempnl_sheet22.Section_Width_NumberB:=N234a1;
                tempnl_sheet22.Section_Unit_Number:=(n223A1*N224A1+N233A1*N234a1)*three_Section_PNLvalue33.PNLa_Unit_Long_Number*three_Section_PNLvalue33.PNLa_Unit_Width_Number
                                                   //+n223B2*N224B2*three_Section_PNLvalue33.PNLB_Unit_Long_Number*three_Section_PNLvalue33.PNLB_Unit_Width_Number
                                                   +I21*J21*three_Section_PNLvalue33.PNLA_Unit_Long_Number*three_Section_PNLvalue33.PNLA_Unit_Width_Number;
             end;

            if  rate202=max21 then //rate202:=(n223A1*N224A1+N231A1*N232a1)
             begin  //N后的第三位数字表示长宽量是否调换,如为3,4则调换,后面的字母表示是第一种还是第二种排法,A表示第一种排法;B表示第二种排法
                array_type2:=2;   //小二区长排PNLB宽;小三区长排PNLB宽
                tempnl_sheet22.Section_LongA:=three_Section_PNLvalue33.PNLA_Long;
                tempnl_sheet22.Section_WidthA:=three_Section_PNLvalue33.PNLA_Width;
                tempnl_sheet22.Section_Long_NumberA:=i21;
                tempnl_sheet22.Section_Width_NumberA:=j21;
                tempnl_sheet22.Section_LongB:=three_Section_PNLvalue33.PNLa_Width;
                tempnl_sheet22.Section_WidthB:=three_Section_PNLvalue33.PNLa_Long;
                tempnl_sheet22.Section_Long_NumberB:=n223A1;
                tempnl_sheet22.Section_Width_NumberB:=N224A1;
                tempnl_sheet22.Section_LongB:=three_Section_PNLvalue33.PNLa_Width;
                tempnl_sheet22.Section_WidthB:=three_Section_PNLvalue33.PNLa_Long;
                tempnl_sheet22.Section_Long_NumberB:=N231A1;
                tempnl_sheet22.Section_Width_NumberB:=N232a1;
                tempnl_sheet22.Section_Unit_Number:=(n223A1*N224A1+N231A1*N232a1)*three_Section_PNLvalue33.PNLa_Unit_Long_Number*three_Section_PNLvalue33.PNLa_Unit_Width_Number
                                                   //+n223B2*N224B2*three_Section_PNLvalue33.PNLB_Unit_Long_Number*three_Section_PNLvalue33.PNLB_Unit_Width_Number
                                                   +I21*J21*three_Section_PNLvalue33.PNLA_Unit_Long_Number*three_Section_PNLvalue33.PNLA_Unit_Width_Number;
             end;

            if  rate201=max21 then //rate201:=(n221A1*N222A1+N233A1*N234a1)
             begin  //N后的第三位数字表示长宽量是否调换,如为3,4则调换,后面的字母表示是第一种还是第二种排法,A表示第一种排法;B表示第二种排法
                array_type2:=1;   //小二区长排PNLB宽;小三区长排PNLB宽
                tempnl_sheet22.Section_LongA:=three_Section_PNLvalue33.PNLA_Long;
                tempnl_sheet22.Section_WidthA:=three_Section_PNLvalue33.PNLA_Width;
                tempnl_sheet22.Section_Long_NumberA:=i21;
                tempnl_sheet22.Section_Width_NumberA:=j21;
                tempnl_sheet22.Section_LongB:=three_Section_PNLvalue33.PNLa_Long;
                tempnl_sheet22.Section_WidthB:=three_Section_PNLvalue33.PNLa_Width;
                tempnl_sheet22.Section_Long_NumberB:=n221A1;
                tempnl_sheet22.Section_Width_NumberB:=N222A1;
                tempnl_sheet22.Section_LongB:=three_Section_PNLvalue33.PNLa_Long ;
                tempnl_sheet22.Section_WidthB:=three_Section_PNLvalue33.PNLa_Width;
                tempnl_sheet22.Section_Long_NumberB:=N233A1;
                tempnl_sheet22.Section_Width_NumberB:=N234a1;
                tempnl_sheet22.Section_Unit_Number:=(n221A1*N222A1+N233A1*N234a1)*three_Section_PNLvalue33.PNLa_Unit_Long_Number*three_Section_PNLvalue33.PNLa_Unit_Width_Number
                                                   //+n223B2*N224B2*three_Section_PNLvalue33.PNLB_Unit_Long_Number*three_Section_PNLvalue33.PNLB_Unit_Width_Number
                                                   +I21*J21*three_Section_PNLvalue33.PNLA_Unit_Long_Number*three_Section_PNLvalue33.PNLA_Unit_Width_Number;
             end;
             if  rate200=max21 then //
             begin  //N后的第三位数字表示长宽量是否调换,如为3,4则调换,后面的字母表示是第一种还是第二种排法,A表示第一种排法;B表示第二种排法
                array_type2:=0;   //小二区长排PNLB宽;小三区长排PNLB宽
                tempnl_sheet22.Section_LongA:=three_Section_PNLvalue33.PNLA_Long;
                tempnl_sheet22.Section_WidthA:=three_Section_PNLvalue33.PNLA_Width;
                tempnl_sheet22.Section_Long_NumberA:=n201;
                tempnl_sheet22.Section_Width_NumberA:=n202;
                tempnl_sheet22.Section_LongB:=0;
                tempnl_sheet22.Section_WidthB:=0;
                tempnl_sheet22.Section_Long_NumberB:=0;
                tempnl_sheet22.Section_Width_NumberB:=0;
                tempnl_sheet22.Section_LongB:=0;
                tempnl_sheet22.Section_WidthB:=0;
                tempnl_sheet22.Section_Long_NumberB:=0;
                tempnl_sheet22.Section_Width_NumberB:=0;
                tempnl_sheet22.Section_Unit_Number:=//(n201*n202)*three_Section_PNLvalue33.PNLa_Unit_Long_Number*three_Section_PNLvalue33.PNLa_Unit_Width_Number
                                                   //+n223B2*N224B2*three_Section_PNLvalue33.PNLB_Unit_Long_Number*three_Section_PNLvalue33.PNLB_Unit_Width_Number
                                                   n201*n202*three_Section_PNLvalue33.PNLA_Unit_Long_Number*three_Section_PNLvalue33.PNLA_Unit_Width_Number;
             end;





          end;
        end;
     end;     {}
//333333333


  end; //

//--------------三区

  //处理总单元数 max21+max31+pnl_long_number33*pnl_width_number33*value3.PNLA_Unit_Long_Number*value3.PNLA_Unit_Width_Number
 // if Summation_rate<=tem_rate2+tem_rate3+pnl_long_number333*pnl_width_number333*value332.PNLA_Unit_Long_Number*value332.PNLA_Unit_Width_Number*Three_Section_PNLvalue33.PNLA_Width*Three_Section_PNLvalue33.PNLA_Long/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width   then //利用率比以前的大,则取现在的
 // begin  //1
 //    Summation_rate:=tem_rate2+tem_rate3+pnl_long_number333*pnl_width_number333*value332.PNLA_Unit_Long_Number*value332.PNLA_Unit_Width_Number*Three_Section_PNLvalue33.PNLA_Width*Three_Section_PNLvalue33.PNLA_Long/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width ;;
  rate_10:=pnl_long_number333*pnl_width_number333*value332.PNLA_Unit_Long_Number*value332.PNLA_Unit_Width_Number;
  if Tem_Calculate_Rate_Type1=1 then  //用单元计算
  begin
     rate_10:=pnl_long_number333*pnl_width_number333*value332.PNLA_Unit_Long_Number*value332.PNLA_Unit_Width_Number*value332.PNLA_Unit_Long*value332.PNLA_Unit_Width;
     rate_10:=rate_10/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
  end;

  if Tem_Calculate_Rate_Type1=2 then //用PNL计算
  begin
     rate_10:=pnl_long_number333*pnl_width_number333*value332.PNLA_Long*value332.PNLA_Width;
     rate_10:=rate_10/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
  end;



  if Leave_Section_falchion_number1=2 then
  begin  //二,三区分两个区;最多只制成排两种不同的尺寸,或者一种尺寸调换长宽

     //计算开刀的数量,公式为:如为M与N,则等于:M+MN-M

     {TEM_Falchion_Number1:=tempnl_sheet22.Section_Long_NumberA*(1+tempnl_sheet22.Section_Width_NumberA)-tempnl_sheet22.Section_Long_NumberA
                        +tempnl_sheet22.Section_Long_Numberb*(1+tempnl_sheet22.Section_Width_Numberb)-tempnl_sheet22.Section_Long_Numberb
                        +tempnl_sheet33.Section_Long_NumberA*(1+tempnl_sheet33.Section_Width_NumberA)-tempnl_sheet33.Section_Long_NumberA
                        +tempnl_sheet33.Section_Long_Numberb*(1+tempnl_sheet33.Section_Width_Numberb)-tempnl_sheet33.Section_Long_Numberb
                        +pnl_long_number333*(1+pnl_width_number333)-pnl_long_number333;      }


     if No_Calculate_Falchion_Number1=false then   //考虑开刀数
     begin
      //计算开刀数量
      TEM_Falchion_Number1:=pnl_long_number333*pnl_width_number333+1;
      if tempnl_sheet22.Section_Long_NumberA>0  then
         TEM_Falchion_Number1:=tempnl_sheet22.Section_Long_NumberA*tempnl_sheet22.Section_Width_NumberA+TEM_Falchion_Number1+1;

      if tempnl_sheet22.Section_Long_Numberb>0  then
        TEM_Falchion_Number1:=tempnl_sheet22.Section_Long_Numberb*tempnl_sheet22.Section_Width_Numberb+TEM_Falchion_Number1+1;

      if tempnl_sheet33.Section_Long_NumberA>0  then
        TEM_Falchion_Number1:=tempnl_sheet33.Section_Long_NumberA*tempnl_sheet33.Section_Width_NumberA+TEM_Falchion_Number1+1;

      if tempnl_sheet33.Section_Long_Numberb>0  then
        TEM_Falchion_Number1:=tempnl_sheet33.Section_Long_Numberb*tempnl_sheet33.Section_Width_Numberb+TEM_Falchion_Number1+1;

     //条件,用于是否选出相等的利用率的排法,刀数最比以前的小时侧选中
       if Calculate_Falchion_Number_Equality_Hold_1=false then
       begin
         result_1:=false;
         if Summation_rate<tem_rate2+tem_rate3+rate_10 then result_1:=true;
         if (Summation_rate=tem_rate2+tem_rate3+rate_10) AND (Falchion_Number1>TEM_Falchion_Number1) then result_1:=true;

      end else if Calculate_Falchion_Number_Equality_Hold_1=true then
      begin
          result_1:=false;
          if Summation_rate<tem_rate2+tem_rate3+rate_10 then result_1:=true;
          if (Summation_rate=tem_rate2+tem_rate3+rate_10) AND (Falchion_Number1>=TEM_Falchion_Number1) then result_1:=true;

       end;
     end;
     if No_Calculate_Falchion_Number1 then  //不考虑开刀数
     begin
         result_1:=false;
         if round((tem_rate2+tem_rate3+rate_10)*10000)>=round(Summation_rate*10000) then
         begin
            result_1:=true;

         end;
       // result_1:=true;
     end;

  end;

  if Leave_Section_falchion_number1=3 then
  begin  //二,三区可分三个区排,两种PNL可排

     //计算开刀的数量,公式为:如为M与N,则等于:M+MN-M
     {TEM_Falchion_Number1:=tempnl_sheet22.Section_Long_NumberA*(1+tempnl_sheet22.Section_Width_NumberA)-tempnl_sheet22.Section_Long_NumberA
                        +tempnl_sheet22.Section_Long_Numberb*(1+tempnl_sheet22.Section_Width_Numberb)-tempnl_sheet22.Section_Long_Numberb
                        +tempnl_sheet22.Section_Long_Numberc*(1+tempnl_sheet22.Section_Width_Numberc)-tempnl_sheet22.Section_Long_Numberc
                        +tempnl_sheet33.Section_Long_NumberA*(1+tempnl_sheet33.Section_Width_NumberA)-tempnl_sheet33.Section_Long_NumberA
                        +tempnl_sheet33.Section_Long_Numberb*(1+tempnl_sheet33.Section_Width_Numberb)-tempnl_sheet33.Section_Long_Numberb
                        +tempnl_sheet33.Section_Long_Numberc*(1+tempnl_sheet33.Section_Width_Numberc)-tempnl_sheet33.Section_Long_Numberc
                        +pnl_long_number333*(1+pnl_width_number333)-pnl_long_number333;  }

      TEM_Falchion_Number1:=pnl_long_number333*pnl_width_number333+1;
    if tempnl_sheet22.Section_Long_NumberA>0  then
        TEM_Falchion_Number1:=tempnl_sheet22.Section_Long_NumberA*tempnl_sheet22.Section_Width_NumberA+TEM_Falchion_Number1+1;

    if tempnl_sheet22.Section_Long_Numberb>0  then
        TEM_Falchion_Number1:=tempnl_sheet22.Section_Long_Numberb*tempnl_sheet22.Section_Width_Numberb+TEM_Falchion_Number1+1;

    if tempnl_sheet33.Section_Long_NumberA>0  then
        TEM_Falchion_Number1:=tempnl_sheet33.Section_Long_NumberA*tempnl_sheet33.Section_Width_NumberA+TEM_Falchion_Number1+1;

    if tempnl_sheet33.Section_Long_Numberb>0  then
        TEM_Falchion_Number1:=tempnl_sheet33.Section_Long_Numberb*tempnl_sheet33.Section_Width_Numberb+TEM_Falchion_Number1+1;

     //条件,用于是否选出相等的利用率的排法,刀数最比以前的小时侧选中
     if Calculate_Falchion_Number_Equality_Hold_1=false then
     begin
         result_1:=(Summation_rate<tem_rate2+tem_rate3+rate_10) OR ((Summation_rate=tem_rate2+tem_rate3+rate_10) AND (Falchion_Number1>TEM_Falchion_Number1));
     end else
         result_1:=(Summation_rate<tem_rate2+tem_rate3+rate_10) OR ((Summation_rate=tem_rate2+tem_rate3+rate_10) AND (Falchion_Number1>=TEM_Falchion_Number1));
  end;
   //shwomessage(inttostr(TEM_Falchion_Number1));
   if result_1 then //利用率比以前的大,则取现在的
   begin  //1
        Summation_rate:=tem_rate2+tem_rate3+rate_10;
        TEM_Falchion_Number2:=Falchion_Number1;//
        Falchion_Number1:=TEM_Falchion_Number1;//开刀数量

     if No_Calculate_Falchion_Number1=false then  //考虑开刀数
     begin
      if Calculate_Falchion_Number_Equality_Hold_1=true then
      begin
        //call 转换函数
        function_result:=Calculate_OnePNL_result_exchange;//将以前的结果下移,即9移到10 , ... , 0移到1
        if function_result=false  then
        begin
          showmessage('出错!');
          exit;
        end;
      end;
      if ((Calculate_Falchion_Number_Equality_Hold_1=false) and (TEM_Falchion_Number2<>TEM_Falchion_Number1) and (Summation_rate=tem_rate2+tem_rate3+rate_10)) or ((Calculate_Falchion_Number_Equality_Hold_1=false) and (Summation_rate<tem_rate2+tem_rate3+rate_10)) then
      begin
        //call 转换函数
        function_result:=Calculate_OnePNL_result_exchange;//将以前的结果下移,即9移到10 , ... , 0移到1
        if function_result=false  then
        begin
          showmessage('出错!');
          exit;
        end;
      end;
    end;
    if No_Calculate_Falchion_Number1 then  //不考虑开刀数
    begin
        //call 转换函数
        function_result:=Calculate_OnePNL_result_exchange;//将以前的结果下移,即9移到10 , ... , 0移到1
        if function_result=false  then
        begin
          showmessage('出错!');
          exit;
        end;
         //if tem_rate2+tem_rate3+rate_10>=0.804then
         //      showmessage(floattostr(Summation_rate)+'   '+floattostr(tem_rate2+tem_rate3+rate_10));
    end;
     //将结果输出,一区用value32,二区用value3,三区用value3,以下输出PNLA与PNLB内容
     Result_makeup_using_Sheet_OnePNL[0].Draw_type:=type333;//用于画图
     Result_makeup_using_Sheet_OnePNL[0].PNLA_Unit_Long:=value332.PNLA_Unit_Long ;
     Result_makeup_using_Sheet_OnePNL[0].PNLA_Unit_Width :=value332.PNLA_Unit_Width ;
     Result_makeup_using_Sheet_OnePNL[0].PNLA_Unit_Long_Space :=value332.PNLA_Unit_Long_Space ;
     Result_makeup_using_Sheet_OnePNL[0].PNLA_Unit_Width_Space :=value332.PNLA_Unit_Width_Space ;
     Result_makeup_using_Sheet_OnePNL[0].PNLA_Unit_Long_ToPNL :=value332.PNLA_Unit_Long_ToPNL ;
     Result_makeup_using_Sheet_OnePNL[0].PNLA_Unit_Width_ToPNL :=value332.PNLA_Unit_Width_ToPNL ;
     Result_makeup_using_Sheet_OnePNL[0].PNLA_Unit_Long_Number :=value332.PNLA_Unit_Long_Number ;
     Result_makeup_using_Sheet_OnePNL[0].PNLA_Unit_Width_Number :=value332.PNLA_Unit_Width_Number ;
     Result_makeup_using_Sheet_OnePNL[0].PNLA_Long :=value332.PNLA_Long  ;
     Result_makeup_using_Sheet_OnePNL[0].PNLA_Width :=value332.PNLA_Width ;

     //一区,以下一区内容,
     Result_makeup_using_Sheet_OnePNL[0].One_Section_Long:=value332.PNLA_Long;
     Result_makeup_using_Sheet_OnePNL[0].One_Section_Width:=value332.PNLA_Width;
     Result_makeup_using_Sheet_OnePNL[0].One_Section_Long_Number:=pnl_long_number333;
     Result_makeup_using_Sheet_OnePNL[0].One_Section_Width_Number:=pnl_width_number333;
     Result_makeup_using_Sheet_OnePNL[0].One_Section_Unit_Number:=pnl_long_number333*pnl_width_number333*value332.PNLa_Unit_Long_Number*value332.PNLa_Unit_Width_Number;
   //   if Two_Section_Draw_value333=0 then
     //   showmessage('');
      if Two_Section_Draw_value333=2 then
      begin     //调换长宽与长宽个数
         //二区,以下二区内容
        Result_makeup_using_Sheet_OnePNL[0].Two_Section_LongA:=tempnl_sheet22.Section_Widtha;  //
        Result_makeup_using_Sheet_OnePNL[0].Two_Section_WidthA:=tempnl_sheet22.Section_Longa ;
        Result_makeup_using_Sheet_OnePNL[0].Two_Section_Long_NumberA:=tempnl_sheet22.Section_Width_Numbera;
        Result_makeup_using_Sheet_OnePNL[0].Two_Section_Width_NumberA:=tempnl_sheet22.Section_Long_Numbera ;
        Result_makeup_using_Sheet_OnePNL[0].Two_Section_LongB:=tempnl_sheet22.Section_Widthb ;
        Result_makeup_using_Sheet_OnePNL[0].Two_Section_WidthB:=tempnl_sheet22.Section_Longb ;
        Result_makeup_using_Sheet_OnePNL[0].Two_Section_Long_NumberB:=tempnl_sheet22.Section_Width_NumberB;
        Result_makeup_using_Sheet_OnePNL[0].Two_Section_Width_NumberB:=tempnl_sheet22.Section_Long_NumberB;
        Result_makeup_using_Sheet_OnePNL[0].Two_Section_Longc:=tempnl_sheet22.Section_Widthc ;
        Result_makeup_using_Sheet_OnePNL[0].Two_Section_Widthc:=tempnl_sheet22.Section_Longc ;
        Result_makeup_using_Sheet_OnePNL[0].Two_Section_Long_Numberc:=tempnl_sheet22.Section_Width_Numberc;
        Result_makeup_using_Sheet_OnePNL[0].Two_Section_Width_Numberc:=tempnl_sheet22.Section_Long_Numberc;
        Result_makeup_using_Sheet_OnePNL[0].Two_Section_Unit_Number:=tempnl_sheet22.Section_Unit_Number;

        Result_makeup_using_Sheet_OnePNL[0].Two_Section_Array_type:=TWO_Section_Draw_value333;//array_type2;
      end else  if Two_Section_Draw_value333=1 then
      begin
        //二区,以下二区内容
        Result_makeup_using_Sheet_OnePNL[0].Two_Section_LongA:=tempnl_sheet22.Section_LongA ;  //
        Result_makeup_using_Sheet_OnePNL[0].Two_Section_WidthA:=tempnl_sheet22.Section_WidthA ;
        Result_makeup_using_Sheet_OnePNL[0].Two_Section_Long_NumberA:=tempnl_sheet22.Section_Long_NumberA ;
        Result_makeup_using_Sheet_OnePNL[0].Two_Section_Width_NumberA:=tempnl_sheet22.Section_Width_NumberA;
        Result_makeup_using_Sheet_OnePNL[0].Two_Section_LongB:=tempnl_sheet22.Section_LongB ;
        Result_makeup_using_Sheet_OnePNL[0].Two_Section_WidthB:=tempnl_sheet22.Section_WidthB ;
        Result_makeup_using_Sheet_OnePNL[0].Two_Section_Long_NumberB:=tempnl_sheet22.Section_Long_NumberB;
        Result_makeup_using_Sheet_OnePNL[0].Two_Section_Width_NumberB:=tempnl_sheet22.Section_Width_NumberB;
        Result_makeup_using_Sheet_OnePNL[0].Two_Section_Longc:=tempnl_sheet22.Section_Longc ;
        Result_makeup_using_Sheet_OnePNL[0].Two_Section_Widthc:=tempnl_sheet22.Section_Widthc ;
        Result_makeup_using_Sheet_OnePNL[0].Two_Section_Long_Numberc:=tempnl_sheet22.Section_Long_NumberB;
        Result_makeup_using_Sheet_OnePNL[0].Two_Section_Width_Numberc:=tempnl_sheet22.Section_Width_Numberc;

        Result_makeup_using_Sheet_OnePNL[0].Two_Section_Unit_Number:=tempnl_sheet22.Section_Unit_Number;
        Result_makeup_using_Sheet_OnePNL[0].Two_Section_Array_type:=Two_Section_Draw_value333;//array_type2;
      end;
      if Three_Section_Draw_value333=2 then
      begin   // 对调长宽与长宽个数
        Result_makeup_using_Sheet_OnePNL[0].three_Section_LongA:=  tempnl_sheet33.Section_WidthA ;
        Result_makeup_using_Sheet_OnePNL[0].three_Section_WidthA:=tempnl_sheet33.Section_LongA ;
        Result_makeup_using_Sheet_OnePNL[0].three_Section_Long_NumberA:=tempnl_sheet33.Section_Width_NumberA;
        Result_makeup_using_Sheet_OnePNL[0].three_Section_Width_NumberA:= tempnl_sheet33.Section_Long_NumberA ;

        Result_makeup_using_Sheet_OnePNL[0].three_Section_LongB:=tempnl_sheet33.Section_WidthB ;
        Result_makeup_using_Sheet_OnePNL[0].three_Section_WidthB:= tempnl_sheet33.Section_LongB ;
        Result_makeup_using_Sheet_OnePNL[0].three_Section_Long_NumberB:=tempnl_sheet33.Section_Width_NumberB;
        Result_makeup_using_Sheet_OnePNL[0].three_Section_Width_NumberB:=tempnl_sheet33.Section_Long_NumberB;

        Result_makeup_using_Sheet_OnePNL[0].three_Section_Longc:=tempnl_sheet33.Section_Widthc ;
        Result_makeup_using_Sheet_OnePNL[0].three_Section_Widthc:= tempnl_sheet33.Section_Longc ;
        Result_makeup_using_Sheet_OnePNL[0].three_Section_Long_Numberc:=tempnl_sheet33.Section_Width_Numberc;
        Result_makeup_using_Sheet_OnePNL[0].three_Section_Width_Numberc:=tempnl_sheet33.Section_Long_Numberc;

        Result_makeup_using_Sheet_OnePNL[0].three_Section_Unit_Number:=tempnl_sheet33.Section_Unit_Number;
        Result_makeup_using_Sheet_OnePNL[0].Three_Section_Array_type:=Three_Section_Draw_value333;//array_type3;
      end else  if Three_Section_Draw_value333=1 then
      begin
        //三区,以下三区内容
        Result_makeup_using_Sheet_OnePNL[0].three_Section_LongA:=tempnl_sheet33.Section_LongA ;
        Result_makeup_using_Sheet_OnePNL[0].three_Section_WidthA:=tempnl_sheet33.Section_WidthA ;
        Result_makeup_using_Sheet_OnePNL[0].three_Section_Long_NumberA:=tempnl_sheet33.Section_Long_NumberA ;
        Result_makeup_using_Sheet_OnePNL[0].three_Section_Width_NumberA:=tempnl_sheet33.Section_Width_NumberA;
        Result_makeup_using_Sheet_OnePNL[0].three_Section_LongB:=tempnl_sheet33.Section_LongB ;
        Result_makeup_using_Sheet_OnePNL[0].three_Section_WidthB:=tempnl_sheet33.Section_WidthB ;
        Result_makeup_using_Sheet_OnePNL[0].three_Section_Long_NumberB:=tempnl_sheet33.Section_Long_NumberB;
        Result_makeup_using_Sheet_OnePNL[0].three_Section_Width_NumberB:=tempnl_sheet33.Section_Width_NumberB;

        Result_makeup_using_Sheet_OnePNL[0].three_Section_Longc:=tempnl_sheet33.Section_Longc ;
        Result_makeup_using_Sheet_OnePNL[0].three_Section_Widthc:=tempnl_sheet33.Section_Widthc ;
        Result_makeup_using_Sheet_OnePNL[0].three_Section_Long_Numberc:=tempnl_sheet33.Section_Long_Numberc;
        Result_makeup_using_Sheet_OnePNL[0].three_Section_Width_Numberc:=tempnl_sheet33.Section_Width_Numberc;

        Result_makeup_using_Sheet_OnePNL[0].three_Section_Unit_Number:=tempnl_sheet33.Section_Unit_Number;
        Result_makeup_using_Sheet_OnePNL[0].Three_Section_Array_type:=Three_Section_Draw_value333;//array_type3;       //Three_Section_Draw_value333
      end;
     Result_makeup_using_Sheet_OnePNL[0].Sheet_Long:=value333_sheet.Sheet_Long;//大料长
     Result_makeup_using_Sheet_OnePNL[0].Sheet_Width:=value333_sheet.Sheet_Width;//大料宽


     if Tem_Calculate_Rate_Type1=1 then //用单元计算
     begin
       Result_makeup_using_Sheet_OnePNL[0].Pnl_Using_Rate:=Summation_rate;
       Result_makeup_using_Sheet_OnePNL[0].Unit_Using_Rate:=Summation_rate;
       Result_makeup_using_Sheet_OnePNL[0].Using_Rate:=Summation_rate;
     end;
     if Tem_Calculate_Rate_Type1=2 then //用PNL计算
     begin
       Result_makeup_using_Sheet_OnePNL[0].Unit_Using_Rate:=Result_makeup_using_Sheet_OnePNL[0].One_Section_Unit_Number*Result_makeup_using_Sheet_OnePNL[0].One_Section_Unit_Number*Result_makeup_using_Sheet_OnePNL[0].three_Section_Unit_Number*value332.PNLA_Unit_Long*value332.PNLA_Unit_Width/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
       Result_makeup_using_Sheet_OnePNL[0].Pnl_Using_Rate:=Summation_rate;
       Result_makeup_using_Sheet_OnePNL[0].Using_Rate:=Summation_rate;
     end;
     // Result_makeup_using_Sheet_OnePNL[0].Using_Rate:=Summation_rate*value332.PNLA_Unit_Long*value332.PNLA_Unit_width/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
     if Tem_Calculate_Rate_Type1=0 then
     begin
          Result_makeup_using_Sheet_OnePNL[0].Pnl_Using_Rate:=Summation_rate;
          Result_makeup_using_Sheet_OnePNL[0].Using_Rate:=Summation_rate*value332.PNLA_Unit_Long*value332.PNLA_Unit_Width/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
          Result_makeup_using_Sheet_OnePNL[0].unit_Using_Rate:=Result_makeup_using_Sheet_OnePNL[0].Using_Rate;
     end;
     unit_to_set_pnl_sheet1:=1;
     //showmessage(currtostr(Summation_rate));
     { if Summation_rate>=272 then   showmessage(currtostr(Summation_rate)+'  ' +currtostr(max21) +'  ' +currtostr(max31)
       +'  '+inttostr(pnl_long_number333)+'  '+inttostr(pnl_width_number333)
       +'  '+inttostr(Result_makeup_using_Sheet_OnePNL[0].One_Section_Long_NumberB)
       +'  '+inttostr(Result_makeup_using_Sheet_OnePNL[0].One_Section_Width_NumberB)
       +'一区长'+inttostr(Result_makeup_using_Sheet_OnePNL[0].One_Section_Long_Number)+'一区宽'+inttostr(Result_makeup_using_Sheet_OnePNL[0].One_Section_Width_Number)
        +'二区长个数'+inttostr(Result_makeup_using_Sheet_OnePNL[0].One_Section_long_Numbera)+'二区宽'+inttostr(Result_makeup_using_Sheet_OnePNL[0].One_Section_Width_Numbera)+'二区长'+inttostr(Result_makeup_using_Sheet_OnePNL[0].One_Section_long_NumberB)+'二区宽'+inttostr(Result_makeup_using_Sheet_OnePNL[0].One_Section_Width_NumberB)
       +'二区长'+currtostr( Two_Section_value333.Sheet_Long)+'宽'+ currtostr(Two_Section_value333.Sheet_Width)
        +'大料长'+currtostr( value333_sheet.Sheet_Long)+'宽'+ currtostr(value333_sheet.Sheet_Width)
        +'  '+inttostr(array_type3)+'  '
        );     }

  end; //1



end;

function TAarray_Rectangle_OnePNL1.Calculate_Unit_OnePNL(
  const VALUE: Input_PCB_SIZE_OnePNL_1): BOOLEAN; //计算单元排PNL
VAR

 i1,i1_1,I2,j1,J2,i101, //
 n1,n2,n3,n4 //最多能排单元个数
     :integer; //
 Result_Unit_size,tem_Result_Unit_size:TResult_OnePNL_Information_1;//存放A,B板的排版情况
 function_resul22:boolean;
 sheet_size0:Input_Sheet_Size_OnePNL_1;

begin
   Result:=false;//函数返回假
   if (VALUE.PNLA_Long_Max<=VALUE.PNLA_Long_Min) or (VALUE.PNLA_Width_Max<=VALUE.PNLA_Width_Min) then
   begin
     showmessage('上下限输入错误!');
     exit;
   end;


   //最多能排单元个数
   n1:=trunc((VALUE.PNLA_Long_Min -2*VALUE.Unit_Long_ToPNL+value.Unit_Long_Space )
             /(VALUE.Unit_Long+value.Unit_Long_Space) );
   n2:=trunc((VALUE.PNLA_Long_MAX -2*VALUE.Unit_Long_ToPNL+value.Unit_Long_Space )
             / (VALUE.Unit_Long+value.Unit_Long_Space) );
   n3:=trunc((VALUE.PNLA_WIDTH_Min -2*VALUE.Unit_Width_ToPNL +value.Unit_Width_Space )
             / (VALUE.Unit_Width+value.Unit_Width_Space) );
   n4:=trunc((VALUE.PNLA_WIDTH_MAX -2*VALUE.Unit_Width_ToPNL+value.Unit_Width_Space )
            / (VALUE.Unit_Width+value.Unit_Width_Space) );

   if (VALUE.PNLA_Long_Min -2*VALUE.Unit_Long_ToPNL+value.Unit_Long_Space ) / (VALUE.Unit_Long+value.Unit_Long_Space)-n1>0 then  n1:=n1+1;

   if (VALUE.PNLA_WIDTH_Min -2*VALUE.Unit_Width_ToPNL+value.Unit_Width_Space ) / (VALUE.Unit_Width+value.Unit_Width_Space)-n3>0 then  n3:=n3+1;


   if  (n1>n2) or (n3>n4)  then
   begin
     i101:=0;
   end  else
   begin
     i101:=1;
   end;
   Calculate_Flag1:=Calculate_Flag1+i101;//用于计算是否可排出后种排法
   if (n1<0)or (n3<0)then
   begin
     showmessage('输入的上限错误!');
     exit;
   end;
   for i1:=n1 to n2 do
   begin  //1
     for i2:=n3 to n4 do
     begin   //2
                 Result:=true; //函数返回真

                 Result_Unit_size.PNLA_Unit_Long:=value.Unit_Long;
                 Result_Unit_size.PNLA_Unit_Width:=value.Unit_Width ;
                 Result_Unit_size.PNLA_Unit_Long_Space:=value.Unit_Long_Space ;
                 Result_Unit_size.PNLA_Unit_Width_Space:=value.Unit_Width_Space;
                 Result_Unit_size.PNLA_Unit_Long_ToPNL:=value.Unit_Long_ToPNL ;
                 Result_Unit_size.PNLA_Unit_Width_ToPNL:=value.Unit_Width_ToPNL;
                 Result_Unit_size.PNLA_Unit_Long_Number:=i1;
                 Result_Unit_size.PNLA_Unit_Width_Number:=i2;
                 Result_Unit_size.PNLA_Long:=value.Unit_Long*i1+(i1-1)*value.Unit_Long_Space+2*value.Unit_Long_ToPNL;
                 Result_Unit_size.PNLA_Width:=value.Unit_Width*i2+(i2-1)*value.Unit_Width_Space+2*value.Unit_Width_ToPNL;

                 for i1_1:=low(Input_Sheet_Size_OnePNL) to high(Input_Sheet_Size_OnePNL) do
                 begin
                   IF (Input_Sheet_Size_OnePNL[i1_1].Sheet_Long>0) and (Input_Sheet_Size_OnePNL[i1_1].Sheet_Width>0) then //大料长宽大料0,才处理
                   begin
                     //此处调用排PNL函数, Calculate_OnePNL_Sheet_1,有如下情况:
                     //1.大料长宽对调;2.PNLA与PNLB所有尺寸对调;3.大料长宽对调且PNLA与PNLB所有尺寸对调
                     //此处PNLA与PNLB相同
                     tem_Result_Unit_size:=Result_Unit_size;
                     sheet_size0.Sheet_Long:=Input_Sheet_Size_OnePNL[i1_1].Sheet_Long;
                     sheet_size0.Sheet_Width:=Input_Sheet_Size_OnePNL[i1_1].Sheet_Width;
                     if (sheet_size0.Sheet_Long>=Result_Unit_size.PNLA_Long ) and (sheet_size0.Sheet_Width>Result_Unit_size.PNLA_Width)then
                          function_resul22:=Calculate_OnePNL_Sheet_1(tem_Result_Unit_size,sheet_size0);

                      //对调大料长宽
                      tem_Result_Unit_size:=Result_Unit_size;
                      sheet_size0.Sheet_Long:=Input_Sheet_Size_OnePNL[i1_1].Sheet_Width ;
                      sheet_size0.Sheet_Width:=Input_Sheet_Size_OnePNL[i1_1].Sheet_Long;
                      if (sheet_size0.Sheet_Long>=Result_Unit_size.PNLA_Long ) and (sheet_size0.Sheet_Width>Result_Unit_size.PNLA_Width)then
                          function_resul22:=Calculate_OnePNL_Sheet_1(tem_Result_Unit_size,sheet_size0);


                   end;
                 end;

     end; //2
   end; //1
end;

function TAarray_Rectangle_OnePNL1.Get_Calculate_Result_Number: integer;
begin
   Result:=0;
end;

function TAarray_Rectangle_OnePNL1.Get_Echange_Unit_To_PNL_Space: boolean;
begin
   Result:=Echange_Unit_To_PNL_Space1;
end;

function TAarray_Rectangle_OnePNL1.Get_Echange_Unit_To_Unit_Space: boolean;
begin
    Result:=Echange_Unit_To_Unit_Space1;
end;

function TAarray_Rectangle_OnePNL1.Get_Input_PCB_SIZE_OnePNL_1: Input_PCB_SIZE_OnePNL_1;
begin
  Result:=Input_PCB_SIZE_OnePNL;
end;

function TAarray_Rectangle_OnePNL1.Get_Input_Sheet_Size_OnePNL_1(Index: integer): Input_Sheet_Size_OnePNL_1;
begin
   Result:=Input_Sheet_Size_OnePNL[index];
end;

function TAarray_Rectangle_OnePNL1.Get_Leave_Section_falchion_number: integer;
begin
   Result:=Leave_Section_falchion_number1;
end;

function TAarray_Rectangle_OnePNL1.Get_tresult_makeup_using_Sheet_OnePNL_1(index: integer): tresult_makeup_using_Sheet_OnePNL_1;
begin
  Result:=Result_makeup_using_Sheet_OnePNL[index];
end;

procedure TAarray_Rectangle_OnePNL1.Set_Echange_Unit_To_PNL_Space(
  const Value: boolean);
begin
  Echange_Unit_To_PNL_Space1:=value;
end;

procedure TAarray_Rectangle_OnePNL1.Set_Echange_Unit_To_Unit_Space(
  const Value: boolean);
begin
   Echange_Unit_To_Unit_Space1:=value;
end;

procedure TAarray_Rectangle_OnePNL1.Set_Input_PCB_SIZE_OnePNL_1(const Value: Input_PCB_SIZE_OnePNL_1);
begin
  Input_PCB_SIZE_OnePNL:=Value;
end;

procedure TAarray_Rectangle_OnePNL1.Set_Input_Sheet_Size_OnePNL_1(Index: integer; const Value: Input_Sheet_Size_OnePNL_1);
begin
   Input_Sheet_Size_OnePNL[index]:=value;
end;

procedure TAarray_Rectangle_OnePNL1.Set_Leave_Section_falchion_number1(
  const Value: integer);
begin
 Leave_Section_falchion_number1:=value;
end;

procedure TAarray_Rectangle_OnePNL1.Set_tresult_makeup_using_Sheet_OnePNL_1(index: integer; const Value: tresult_makeup_using_Sheet_OnePNL_1);
begin
   Result_makeup_using_Sheet_OnePNL[index]:=value;
end;

function TAarray_Rectangle_OnePNL1.Get_Calculate_Array_Complete_Percent: TProgressBar;
begin
   Result:=Tem_TProgressBar1;
end;

procedure TAarray_Rectangle_OnePNL1.Set_Calculate_Array_Complete_Percent(const Value: TProgressBar);
begin
   Tem_TProgressBar1:=Value;
end;

function TAarray_Rectangle_OnePNL1.Get_Calculate_Array_Complete_Time: boolean;
begin
   Result:=Tem_Calculate_Array_Complete_Time_Display;
end;

procedure TAarray_Rectangle_OnePNL1.Set_Calculate_Array_Complete_Time(const Value: boolean);
begin
   Tem_Calculate_Array_Complete_Time_Display:=Value;
end;

function TAarray_Rectangle_OnePNL1.Get_Tem_Calculate_Rate_Type1: integer;
begin
  Result:=Tem_Calculate_Rate_Type1;
end;

procedure TAarray_Rectangle_OnePNL1.Set_Tem_Calculate_Rate_Type1(const Value: integer);
begin
   Tem_Calculate_Rate_Type1:=value;
end;

function TAarray_Rectangle_OnePNL1.Get_Calculate_Falchion_Number_Equality_Hold: boolean;
begin
   Result:=Calculate_Falchion_Number_Equality_Hold_1;
end;

procedure TAarray_Rectangle_OnePNL1.Set_Calculate_Falchion_Number_Equality_Hold(
  const Value: boolean);
begin
   Calculate_Falchion_Number_Equality_Hold_1:=Value;
end;



function TAarray_Rectangle_OnePNL1.Echange_Two_And_Three_Section_Data(var
  value1: array of tresult_makeup_using_Sheet_OnePNL_1): boolean;//将二区与三区PNLB与一区值相等的内容与二区的PNLA交换一下
var
  i,j,tem1:integer;
  tem2:currency;
begin
  Result:=false;
  for i:=low(value1) to high(value1) do
  begin
    if value1[i].two_Section_LongB>0 then //二区的PNLB不为0
    begin
       //二区的排法为1,为2都改变
        if (value1[i].two_Section_LongB=value1[i].One_Section_Long) and (value1[i].two_Section_widthB=value1[i].One_Section_width) then //二区的长宽与一区的长宽相等
        begin
          //交换PNLA与PNLB的值
          tem1:=value1[i].two_Section_Long_NumberA;
          value1[i].two_Section_Long_NumberA:=value1[i].two_Section_Long_Numberb;
          value1[i].two_Section_Long_Numberb:=tem1;

          tem1:=value1[i].two_Section_width_NumberA;
          value1[i].two_Section_width_NumberA:=value1[i].two_Section_width_Numberb;
          value1[i].two_Section_width_Numberb:=tem1;

          tem2:=value1[i].Two_Section_longA;
          value1[i].two_Section_LongA:=value1[i].two_Section_Longb;
          value1[i].two_Section_Longb:=tem2;

          tem2:=value1[i].Two_Section_widthA;
          value1[i].two_Section_widthA:=value1[i].two_Section_widthb;
          value1[i].two_Section_widthb:=tem2;

        end;
    end;
    if value1[i].three_Section_LongB>0 then //二区的PNLB不为0
    begin
       //二区的排法为1,为2都改变
        if (value1[i].three_Section_LongB=value1[i].One_Section_Long) and (value1[i].three_Section_widthB=value1[i].One_Section_width) then //二区的长宽与一区的长宽相等
        begin
          //交换PNLA与PNLB的值
          tem1:=value1[i].three_Section_Long_NumberA;
          value1[i].three_Section_Long_NumberA:=value1[i].three_Section_Long_Numberb;
          value1[i].three_Section_Long_Numberb:=tem1;

          tem1:=value1[i].three_Section_width_NumberA;
          value1[i].three_Section_width_NumberA:=value1[i].three_Section_width_Numberb;
          value1[i].three_Section_width_Numberb:=tem1;

          tem2:=value1[i].three_Section_LongA;
          value1[i].three_Section_LongA:=value1[i].three_Section_Longb;
          value1[i].three_Section_Longb:=tem2;

          tem2:=value1[i].three_Section_widthA;
          value1[i].three_Section_widthA:=value1[i].three_Section_widthb;
          value1[i].three_Section_widthb:=tem2;

        end;
    end;
    for j:=1 to 8 do  //将二三区PNLA与一区的长宽个数相等的交换到一区中
    begin //分画图是1与2两种情况
        if value1[i].Draw_type=1 then//第一种情况=1,第二种情况=2
        begin //第三区的PNLA长宽及个数是否与一区相同,相同则写入一区
            if (value1[i].One_Section_Long=value1[i].Three_Section_LongA) and (value1[i].One_Section_Width=value1[i].Three_Section_WidthA)  and (value1[i].One_Section_Long_Number=value1[i].Three_Section_Long_NumberA)  then
            begin//将D三区的PNLA赋给一区,三区的PNLB赋给三区的PNLA
                value1[i].One_Section_Width_Number:=value1[i].One_Section_Width_Number+value1[i].Three_Section_Width_NumberA;
                value1[i].three_Section_LongA:=value1[i].Three_Section_Longb;
                value1[i].three_Section_widthA:=value1[i].three_Section_widthb;
                value1[i].three_Section_Longb:=0;
                value1[i].three_Section_widthb:=0;
                value1[i].three_Section_Long_NumberA:=value1[i].three_Section_Long_Numberb;
                value1[i].three_Section_width_NumberA:=value1[i].three_Section_width_Numberb;
                value1[i].three_Section_Long_Numberb:=0;
                value1[i].three_Section_width_Numberb:=0;
            end;
            if (value1[i].One_Section_Long=value1[i].TWO_Section_LongA) and (value1[i].One_Section_Width=value1[i].TWO_Section_WidthA)  and (value1[i].One_Section_Long_Number=value1[i].TWO_Section_Long_NumberA)
               and (value1[i].three_Section_Long_NumberA=0) and (value1[i].three_Section_Long_Numberb=0) then
            begin//将D三区的PNLA赋给一区,三区的PNLB赋给三区的PNLA
                value1[i].One_Section_LONG_Number:=value1[i].One_Section_long_Number+value1[i].TWO_Section_long_NumberA;
                value1[i].TWO_Section_LongA:=value1[i].TWO_Section_Longb;
                value1[i].TWO_Section_widthA:=value1[i].TWO_Section_widthb;
                value1[i].TWO_Section_Longb:=0;
                value1[i].TWO_Section_widthb:=0;
                value1[i].TWO_Section_Long_NumberA:=value1[i].TWO_Section_Long_Numberb;
                value1[i].TWO_Section_width_NumberA:=value1[i].TWO_Section_width_Numberb;
                value1[i].TWO_Section_Long_Numberb:=0;
                value1[i].TWO_Section_width_Numberb:=0;
            end;
        end;
        if value1[i].Draw_type=2 then//第一种情况=1,第二种情况=2
        begin //第二区的PNLA长宽及个数是否与一区相同,相同则写入一区
            if (value1[i].One_Section_Long=value1[i].TWO_Section_LongA) and (value1[i].One_Section_Width=value1[i].TWO_Section_WidthA)  and (value1[i].One_Section_Long_Number=value1[i].TWO_Section_Long_NumberA)  then
            begin//将D三区的PNLA赋给一区,三区的PNLB赋给三区的PNLA
                value1[i].One_Section_LONG_Number:=value1[i].One_Section_long_Number+value1[i].TWO_Section_long_NumberA;
                value1[i].TWO_Section_LongA:=value1[i].TWO_Section_Longb;
                value1[i].TWO_Section_widthA:=value1[i].TWO_Section_widthb;
                value1[i].TWO_Section_Longb:=0;
                value1[i].TWO_Section_widthb:=0;
                value1[i].TWO_Section_Long_NumberA:=value1[i].TWO_Section_Long_Numberb;
                value1[i].TWO_Section_width_NumberA:=value1[i].TWO_Section_width_Numberb;
                value1[i].TWO_Section_Long_Numberb:=0;
                value1[i].TWO_Section_width_Numberb:=0;
            end;
            if (value1[i].One_Section_Long=value1[i].Three_Section_LongA) and (value1[i].One_Section_Width=value1[i].Three_Section_WidthA)  and (value1[i].One_Section_Long_Number=value1[i].Three_Section_Long_NumberA)
               and (value1[i].TWO_Section_Long_Numbera=0) and (value1[i].TWO_Section_Long_Numberb=0) then
            begin//将D三区的PNLA赋给一区,三区的PNLB赋给三区的PNLA
                value1[i].One_Section_Width_Number:=value1[i].One_Section_Width_Number+value1[i].Three_Section_Width_NumberA;
                value1[i].three_Section_LongA:=value1[i].Three_Section_Longb;
                value1[i].three_Section_widthA:=value1[i].three_Section_widthb;
                value1[i].three_Section_Longb:=0;
                value1[i].three_Section_widthb:=0;
                value1[i].three_Section_Long_NumberA:=value1[i].three_Section_Long_Numberb;
                value1[i].three_Section_width_NumberA:=value1[i].three_Section_width_Numberb;
                value1[i].three_Section_Long_Numberb:=0;
                value1[i].three_Section_width_Numberb:=0;
            end;
        end;
    end;

  end;
  Result:=true;
end;

function TAarray_Rectangle_OnePNL1.Get_PNL_Informat3311: PNL_Informat3311;
begin
   Result:=PNL_Informat33;
end;

procedure TAarray_Rectangle_OnePNL1.Set_PNL_Informat3311(
  const Value: PNL_Informat3311);
begin
   PNL_Informat33:=value;
end;

function TAarray_Rectangle_OnePNL1.PNL_To_SHEET_999(): Boolean;  //用于计算知道PNL内容的大料余料，及其它
var
  i:integer;
   i1,i1_1,I2,j1,J2,i101:integer; //
  Result_Unit_size,tem_Result_Unit_size:TResult_OnePNL_Information_1;//存放A,B板的排版情况
  sheet_size0:Input_Sheet_Size_OnePNL_1;
  function_resul22:boolean;
begin
   Result_Unit_size.PNLA_Unit_Long:=PNL_Informat33.Unit_Long;
   Result_Unit_size.PNLA_Unit_Width:=PNL_Informat33.Unit_Width ;
   Result_Unit_size.PNLA_Unit_Long_Space:=PNL_Informat33.Unit_Long_Space ;
   Result_Unit_size.PNLA_Unit_Width_Space:=PNL_Informat33.Unit_Width_Space;
   Result_Unit_size.PNLA_Unit_Long_ToPNL:=PNL_Informat33.Unit_Long_ToPNL ;
   Result_Unit_size.PNLA_Unit_Width_ToPNL:=PNL_Informat33.Unit_Width_ToPNL;
   Result_Unit_size.PNLA_Unit_Long_Number:=PNL_Informat33.Unit_Long_Number ;
   Result_Unit_size.PNLA_Unit_Width_Number:=PNL_Informat33.Unit_Width_Number ;
   Result_Unit_size.PNLA_Long:=PNL_Informat33.PNLA_Long;
   Result_Unit_size.PNLA_Width:=PNL_Informat33.PNLA_Width;

     for i1_1:=low(Input_Sheet_Size_OnePNL) to high(Input_Sheet_Size_OnePNL) do
     begin
         IF (Input_Sheet_Size_OnePNL[i1_1].Sheet_Long>0) and (Input_Sheet_Size_OnePNL[i1_1].Sheet_Width>0) then //大料长宽大料0,才处理
         begin
         //此处调用排PNL函数, Calculate_OnePNL_Sheet_1,有如下情况:
         //1.大料长宽对调;2.PNLA与PNLB所有尺寸对调;3.大料长宽对调且PNLA与PNLB所有尺寸对调

              tem_Result_Unit_size:=Result_Unit_size;
              sheet_size0.Sheet_Long:=Input_Sheet_Size_OnePNL[i1_1].Sheet_Long;
              sheet_size0.Sheet_Width:=Input_Sheet_Size_OnePNL[i1_1].Sheet_Width;
              if (sheet_size0.Sheet_Long>=Result_Unit_size.PNLA_Long ) and (sheet_size0.Sheet_Width>Result_Unit_size.PNLA_Width)then
                 function_resul22:=Calculate_OnePNL_Sheet_1(tem_Result_Unit_size,sheet_size0);

                      //对调大料长宽
                      //tem_Result_Unit_size:=Result_Unit_size;
              sheet_size0.Sheet_Long:=Input_Sheet_Size_OnePNL[i1_1].Sheet_Width ;
              sheet_size0.Sheet_Width:=Input_Sheet_Size_OnePNL[i1_1].Sheet_Long;
              if (sheet_size0.Sheet_Long>=Result_Unit_size.PNLA_Long ) and (sheet_size0.Sheet_Width>Result_Unit_size.PNLA_Width)then
                 function_resul22:=Calculate_OnePNL_Sheet_1(tem_Result_Unit_size,sheet_size0);


         end;
     end;
end;

procedure TAarray_Rectangle_OnePNL1.Calculate_PnlToSheet_Array;
var
  function_resule1:boolean;
begin
   //初使化变量
   Summation_rate:=0;
   Falchion_Number1:=100;//开刀数量
   Calculate_Flag1:=0;
   if Leave_Section_falchion_number1=0 then Leave_Section_falchion_number1:=2; //没有输入排版方法时,默认为:2,二三区只可以有两部分

   PNL_To_SHEET_999;

   function_resule1:=Echange_Two_And_Three_Section_Data(Result_makeup_using_Sheet_OnePNL);

end;

procedure TAarray_Rectangle_OnePNL1.Calculate_SetToPnlToSheet_Array;
var //从单元到SET到PNL到SHEET
  i,j:integer;
  function_resule1:boolean;
 
  tem_timeTime1,tem_timeTime2,tem_timeTime3: TDateTime;
  TProgressBar1_Position1,tem1:integer;
begin
  //初使化变量
   tem_timeTime1:=Time;
   Summation_rate:=0;
   Falchion_Number1:=100;//开刀数量
   Tem_TProgressBar1.Min:=0;
   Tem_TProgressBar1.max:=100;
   TProgressBar1_Position1:=2;
   Calculate_Flag1:=0;
   if Echange_Unit_To_Unit_Space1 then
   begin
      TProgressBar1_Position1:=2+TProgressBar1_Position1;
   end;
   if Echange_Unit_To_PNL_Space1 then
   begin
     TProgressBar1_Position1:=2+TProgressBar1_Position1;
   end;
   if (Echange_Unit_To_PNL_Space1) and (Echange_Unit_To_Unit_Space1) then
   begin
    TProgressBar1_Position1:=2+TProgressBar1_Position1;
   end;
   tem1:=0;
   if Leave_Section_falchion_number1=0 then Leave_Section_falchion_number1:=2; //没有输入排版方法时,默认为:2,二三区只可以有两部分
   //没有输入是否计算开刀数量一样要计算时
   //if Calculate_Falchion_Number_Equality_Hold_1 then
   //  showmessage(booltostr(Calculate_Falchion_Number_Equality_Hold_1));
   Tem_TProgressBar1.Position:=1;
   //if Tem_Calculate_Rate_Type1=0 then Tem_Calculate_Rate_Type1:=1;//没有输入计算利用率的方法时,默认为:1,以单元计算.
   tem1:=tem1+1;
   Tem_TProgressBar1.Position:=trunc(tem1*100/TProgressBar1_Position1);





   

   function_resule1:=Echange_Two_And_Three_Section_Data(Result_makeup_using_Sheet_OnePNL);


end;

function TAarray_Rectangle_OnePNL1.Get_Input_Set_Size_OnePNL_1111: Input_Set_Size_OnePNL_1111;
begin
   Result:=Input_Set_Size_OnePNL_1;
end;

procedure TAarray_Rectangle_OnePNL1.Set_Input_Set_Size_OnePNL_1111(
  const Value: Input_Set_Size_OnePNL_1111);
begin
  Input_Set_Size_OnePNL_1:=value;
end;

function TAarray_Rectangle_OnePNL1.Calculate_Unit_To_Set(
  const Value_Input_Set_Size_OnePNL_1: Input_Set_Size_OnePNL_1111;
  var Value_Input_PCB_SIZE_OnePNL_1: Input_PCB_SIZE_OnePNL_1): boolean;
var
 i,j,n10,n11,n12,n13:integer; //n10,n11,n12,n13存单元个数
 tem_long ,tem_width:currency;//用于存SET长宽
 function_resule1:boolean;
 //tem_Input_PCB_SIZE_OnePNL:Input_PCB_SIZE_OnePNL_1;
begin
   Result:=false;
   //计算最大与最小能排的SET内的单元数量
   n10:=trunc((Value_Input_Set_Size_OnePNL_1.Set_Long_Min+Value_Input_Set_Size_OnePNL_1.Unit_Long_Space_ToUnit-Value_Input_Set_Size_OnePNL_1.Unit_Long_Space_Toset_1-Value_Input_Set_Size_OnePNL_1.Unit_Long_Space_Toset_2)/Value_Input_Set_Size_OnePNL_1.Unit_Long);

   n11:=trunc((Value_Input_Set_Size_OnePNL_1.Set_Long_Max+Value_Input_Set_Size_OnePNL_1.Unit_Long_Space_ToUnit-Value_Input_Set_Size_OnePNL_1.Unit_Long_Space_Toset_1-Value_Input_Set_Size_OnePNL_1.Unit_Long_Space_Toset_2)/Value_Input_Set_Size_OnePNL_1.Unit_Long);

   n12:=trunc((Value_Input_Set_Size_OnePNL_1.Set_width_Max+Value_Input_Set_Size_OnePNL_1.Unit_width_Space_ToUnit-Value_Input_Set_Size_OnePNL_1.Unit_width_Space_Toset_1-Value_Input_Set_Size_OnePNL_1.Unit_width_Space_Toset_2)/Value_Input_Set_Size_OnePNL_1.Unit_width);

   n13:=trunc((Value_Input_Set_Size_OnePNL_1.Set_width_Min+Value_Input_Set_Size_OnePNL_1.Unit_width_Space_ToUnit-Value_Input_Set_Size_OnePNL_1.Unit_width_Space_Toset_1-Value_Input_Set_Size_OnePNL_1.Unit_width_Space_Toset_2)/Value_Input_Set_Size_OnePNL_1.Unit_width);
   //
   if   n10<>(Value_Input_Set_Size_OnePNL_1.Set_Long_Min+Value_Input_Set_Size_OnePNL_1.Unit_Long_Space_ToUnit-Value_Input_Set_Size_OnePNL_1.Unit_Long_Space_Toset_1-Value_Input_Set_Size_OnePNL_1.Unit_Long_Space_Toset_2)/Value_Input_Set_Size_OnePNL_1.Unit_Long then
      n10:=n10+1;
   if    n12<>(Value_Input_Set_Size_OnePNL_1.Set_width_Max+Value_Input_Set_Size_OnePNL_1.Unit_width_Space_ToUnit-Value_Input_Set_Size_OnePNL_1.Unit_width_Space_Toset_1-Value_Input_Set_Size_OnePNL_1.Unit_width_Space_Toset_2)/Value_Input_Set_Size_OnePNL_1.Unit_width then
      n12:=n12+1;

   if (n10>0) and (n11>0) and (n12>0) and (n13>0) then
   begin
     for i:=n10 to n11 do
     begin
       for j:=n12 to n13 do
       begin
         //计算SET长宽
         tem_long:=Value_Input_Set_Size_OnePNL_1.Unit_Long*i+Value_Input_Set_Size_OnePNL_1.Unit_Long_Space_ToUnit*(i-1)+Value_Input_Set_Size_OnePNL_1.Unit_Long_Space_Toset_1+Value_Input_Set_Size_OnePNL_1.Unit_Long_Space_Toset_2  ;
         tem_width:=Value_Input_Set_Size_OnePNL_1.Unit_width*j+Value_Input_Set_Size_OnePNL_1.Unit_width_Space_ToUnit*(j-1)+Value_Input_Set_Size_OnePNL_1.Unit_width_Space_Toset_1+Value_Input_Set_Size_OnePNL_1.Unit_width_Space_Toset_2  ;

         Value_Input_PCB_SIZE_OnePNL_1:=Input_PCB_SIZE_OnePNL;
         Value_Input_PCB_SIZE_OnePNL_1.Unit_Long:=tem_long;
         Value_Input_PCB_SIZE_OnePNL_1.Unit_Width:=tem_width;
         function_resule1:=Calculate_Unit_OnePNL(Value_Input_PCB_SIZE_OnePNL_1);
         if unit_to_set_pnl_sheet1=1 then
         begin
            Result_makeup_using_Sheet_OnePNL[0].Long_SET:=0;

         end;
       end;
     end;
   end;
   Result:=true;
end;

function TAarray_Rectangle_OnePNL1.Get_Change_PNL_Long_Width: boolean;
begin
  Result:=Change_PNL_Long_Width1;
end;

procedure TAarray_Rectangle_OnePNL1.Set_Change_PNL_Long_Width(
  const Value: boolean);
begin
   Change_PNL_Long_Width1:=value;
end;

function TAarray_Rectangle_OnePNL1.Get_No_Calculate_Falchion_Number: boolean;
begin
  result:=No_Calculate_Falchion_Number1;
end;

procedure TAarray_Rectangle_OnePNL1.Set_No_Calculate_Falchion_Number(
  const Value: boolean);
begin
  No_Calculate_Falchion_Number1:=value;
end;

end.
