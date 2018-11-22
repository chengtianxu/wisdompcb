unit spell2;

interface
uses
  Messages,SysUtils,StdCtrls,Dialogs,ExtCtrls,math,Graphics,wintypes,ComCtrls;

TYPE
   //存入输入的尺寸
   TParam_PCB2=record
        Unit_Long:currency;//单元长
        Unit_Width:currency;//单元宽
        Unit_Long_Space:currency;//单元长间距
        Unit_Width_Space:currency;//单元宽间距

        Unit_Long_ToPNL:currency;//单元长到边距离
        Unit_Width_ToPNL:currency;//单元宽到边距离
        Unit_Long_ToPNL_min:currency;//单元长到边距离    
        Unit_Width_ToPNL_min:currency;//单元宽到边距离
        
        PNLA_Long_Max:currency;//PNLA长上限
        PNLA_Width_Max:currency;//PNLA宽上限
        PNLA_Long_Min:currency;//PNLA长下限
        PNLA_Width_Min:currency;//PNLA宽下限

        PNLB_Long_Max:currency;//PNLB长上限
        PNLB_Width_Max:currency;//PNLB宽上限
        PNLB_Long_Min:currency;//PNLB长下限
        PNLB_Width_Min:currency;//PNLB宽下限
     end;

     PAParam_Sheet2=^TAParam_Sheet2;
     PAResult_MakeUp2=^TAResult_MakeUp2;

   //用于存大料数组
   TParam_Sheet2=record
       Sheet_Long:currency;
       Sheet_Width:currency;
   end;
   TAParam_Sheet2=array of TParam_Sheet2;
   
    //存入计算后的结果
   TResult_MakeUp2=record
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
        //用于存PNLB排版信息
        PNLB_Unit_Long:currency;//PNLB单元长
        PNLB_Unit_Width:currency;//PNLB单元宽
        PNLB_Unit_Long_Space:currency;//PNLB单元长间距
        PNLB_Unit_Width_Space:currency;//PNLB单元宽间距
        PNLB_Unit_Long_ToPNL:currency;//PNLB单元长到边距离
        PNLB_Unit_Width_ToPNL:currency;//PNLB单元宽到边距离
        PNLB_Unit_Long_Number:integer;//PNLB单元长 个数
        PNLB_Unit_Width_Number:integer;//PNLB单元宽个数
        PNLB_Long:currency;//PNLB长
        PNLB_Width:currency;//PNLB宽
        //用于存开料信息
        One_Section_Long:currency;//一区板长 ,一区二区三区的PNLA与PNLB与前面的PNLA,PNLB不一样,它仅用于画图
        One_Section_Width:currency;//一区板宽
        One_Section_Long_Number:integer;//一区板长个数
        One_Section_Width_Number:integer;//一区板宽个数
        One_Section_Unit_Number:integer;//一区总单元个数

        Two_Section_LongA:currency;//二区板长a
        Two_Section_WidthA:currency;//二区板宽a
        Two_Section_Long_NumberA:integer;//二区板长个数 a
        Two_Section_Width_NumberA:integer;//二区板宽个数 a
        Two_Section_LongB:currency;//二区板长 b
        Two_Section_WidthB:currency;//二区板宽b
        Two_Section_Long_NumberB:integer;//二区板长个数 b
        Two_Section_Width_NumberB:integer;//二区板宽个数 b
        Two_Section_Longc:currency;//二区板长 c
        Two_Section_Widthc:currency;//二区板宽c
        Two_Section_Long_Numberc:integer;//二区板长个数 c
        Two_Section_Width_Numberc:integer;//二区板宽个数 c
        Two_Section_Unit_Number:integer;//二区总单元个数
        Two_Section_Array_type:integer;//二区排方式.1,表示PNLA排在长边不变,PNLB与PNLA的X相同,2表示PNLA排在宽边,PNLB与PNLA的Y相同

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

        One_Section_PNLA_number:integer; //一区PNLA个数
        One_Section_PNLB_number:integer; //一区PNLB个数
        Two_Section_PNLA_number:integer; //二区PNLA个数
        Two_Section_PNLB_number:integer; //二区PNLB个数
        Three_Section_PNLA_number:integer;//三区PNLA个数
        Three_Section_PNLB_number:integer;//三区PNLB个数

        PNLA_number_Per_Sheet:integer; //总PNLA个数
        PNLB_number_Per_Sheet:integer; //总PNLB个数

        Sheet_Long:currency;//大料长
        Sheet_Width:currency;//大料宽

        Using_Rate:currency;//计算用利用率
        Unit_Using_Rate:currency;//单元利用率
        Pnl_Using_Rate:currency;//PNL利率

        Draw_type:integer;
      end;
      TAResult_MakeUp2=array of TResult_MakeUp2;

   //临时存放PNL结果,用于存放函数的返回值
    TResult_PNL2=record
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
        //用于存PNLB排版信息
        PNLB_Unit_Long:currency;//PNLB单元长
        PNLB_Unit_Width:currency;//PNLB单元宽
        PNLB_Unit_Long_Space:currency;//PNLB单元长间距
        PNLB_Unit_Width_Space:currency;//PNLB单元宽间距
        PNLB_Unit_Long_ToPNL:currency;//PNLB单元长到边距离
        PNLB_Unit_Width_ToPNL:currency;//PNLB单元宽到边距离
        PNLB_Unit_Long_Number:integer;//PNLB单元长 个数
        PNLB_Unit_Width_Number:integer;//PNLB单元宽个数
        PNLB_Long:currency;//PNLB长
        PNLB_Width:currency;//PNLB宽
      end;


   TCutSheet2 = class
   private
       Echange_Unit_To_Unit_Space1:boolean ; //允许单元长宽间距调换 默认为不调换
       Echange_Unit_To_PNL_Space1:boolean;  //允许单元边距调换 默认为不调换
       tsa:string;
      Leave_Section_falchion_number1:integer;//剩下开刀数量,=2只允许两个区=3允许三个区
      Summation_rate:Double	;//总利用率
      Tem_Calculate_Rate_Type1:Integer;//计算利用率的方法,1用单元尺寸计算,单元尺寸乘以单元总数再除以大料尺寸;2用PNL尺寸计算,PNL尺寸乘以PNL总个数再除以大料尺寸
      Param_Sheet2:PAParam_Sheet2;  //存放输入的大料数组
      Param_PCB2:TParam_PCB2;//存放输入的尺寸,为记录型,单元长,宽,间距,边宽,上下限
      Result_MakeUp2:PAResult_MakeUp2; //存放计算后的结果值
      Tem_TProgressBar1:TProgressBar;//用于存放TProgressBar控件,要显示的进度条
      Tem_Calculate_Array_Complete_Time_Display:boolean;//是否显示计算所要的时间
      Falchion_Number1:INTEGER;//开刀数量
      Calculate_Falchion_Number_Equality_Hold_1:boolean;//用于定义是否保留相等的开刀数量
      Calculate_Flag1:integer;//是否进入计算,即可否可以排出一个及一个以上排版
      Change_PNL_Long_Width1:boolean;  //允许改PNL长宽上下限
      No_Calculate_Falchion_Number1:boolean;  //不计算刀数
      MaxPnlNumber2:integer;//用于计算PNL个数每张大料的

      FResultCountPerSheet:integer;
      FResultCount,FA:integer;

     procedure Sort_Result;
     function Calculate_Unit_TwoPNL(var VALUE:TParam_PCB2):BOOLEAN; //从单元排PNL
     //用于计算二,三区PNLA与PNLB的个数
     function Change_pnla_pnlb_number1(const  PnlA2, PnlB2,valuen1,valuen2: integer; var Two_pnlA2,Two_PnlB2: integer):boolean;
           //将二区的PNLA的尺寸迟改为与一区的长宽相等的内容
     function Echange_Two_And_Three_Section_Data(var value1:ARRAY OF TResult_MakeUp2):boolean;
     function Calculate_TwoPNL_Sheet_1(const value2:TResult_PNL2;const value22:TParam_Sheet2;const value_pnla:integer;iSheet:integer=0):boolean;//从PNL到SHEET
     function Calculate_TwoPNL_Sheet_2(const value332,Two_Section_PNLvalue33,Three_Section_PNLvalue33:TResult_PNL2;const value333_sheet,Two_Section_value333,Three_Section_value333:TParam_Sheet2;pnl_long_number3331,pnl_width_number3331,type333,Two_Section_Draw_value333,Three_Section_Draw_value333,value_pnla2,Two_value_pnla2,Three_value_pnla2:integer;iSheet:integer=0):boolean;//从PNL到SHEET

      //临时用,计算PNLA与PNLB个数
     function Pnla_PnlB_number(var value1:array of TResult_MakeUp2):boolean;

    //用于返回计算的结果个数
    function Get_Calculate_Result_Number: integer;
    function Get_Input_PCB_SIZE_TwoPNL_1: TParam_PCB2;
    function Get_Input_Sheet_Size_TwoPNL_1(Index: integer): TParam_Sheet2;
    procedure Set_Input_PCB_SIZE_TwoPNL_1(const Value: TParam_PCB2);
    procedure Set_Input_Sheet_Size_TwoPNL_1(Index: integer;const Value: TParam_Sheet2);
    procedure Set_tresult_makeup_using_Sheet_TwoPNL_1(index: integer;const Value: TResult_MakeUp2);
    function Get_tresult_makeup_using_Sheet_TwoPNL_1(index: integer): TResult_MakeUp2;
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
    function Get_Change_PNL_Long_Width: boolean;
    function Get_No_Calculate_Falchion_Number: boolean;
    procedure Set_Change_PNL_Long_Width(const Value: boolean);
    procedure Set_No_Calculate_Falchion_Number(const Value: boolean);
   public
      constructor Create(ASheet:PAParam_Sheet2;AResult_MakeUp:PAResult_MakeUp2;iResultCountPerSheet:integer); overload;
       procedure Calculate_Array();
       //剩下的区域允许分几个区,2:两个区;3:三个区,
       property Leave_Section_falchion_number:integer read Get_Leave_Section_falchion_number write Set_Leave_Section_falchion_number1;
       //大料尺寸属性,最大50,从0开始
       property  Input_Sheet_Size[Index:integer]:TParam_Sheet2 Read Get_Input_Sheet_Size_TwoPNL_1 Write Set_Input_Sheet_Size_TwoPNL_1;
       //存放输入的尺寸,为记录型,单元长,宽,间距,边宽,上下限
       property Input_PCB_SIZE:TParam_PCB2 read Get_Input_PCB_SIZE_TwoPNL_1 WRITE Set_Input_PCB_SIZE_TwoPNL_1;
       //用于返回计算结果
       property Calculate_Result[index:integer]:TResult_MakeUp2 Read Get_tresult_makeup_using_Sheet_TwoPNL_1 Write Set_tresult_makeup_using_Sheet_TwoPNL_1;
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
       //允许改PNL长宽上下限
       property  Change_PNL_Long_Width:boolean read  Get_Change_PNL_Long_Width write Set_Change_PNL_Long_Width;
       //不计算刀数
       property    No_Calculate_Falchion_Number:boolean  read Get_No_Calculate_Falchion_Number write Set_No_Calculate_Falchion_Number;
   end;

var
  CutSheet2:TCutSheet2;

implementation

procedure TCutSheet2.Calculate_Array;//计算排版,调用
var
  function_resule1:boolean;
  tem_Param_PCB2:TParam_PCB2;
  tem_timeTime1,tem_timeTime2,tem_timeTime3: TDateTime;
  iStep,tem1:integer;
begin
   tem_timeTime1:=Time;
   MaxPnlNumber2:=0;
   Summation_rate:=0;
   Falchion_Number1:=100;//开刀数量
   Tem_TProgressBar1.Min:=0;
   Tem_TProgressBar1.max:=100;
   Calculate_Flag1:=0;
   iStep:=4;
   if Echange_Unit_To_Unit_Space1 then iStep:=4+iStep;
   if Echange_Unit_To_PNL_Space1 then   iStep:=4+iStep;
   if (Echange_Unit_To_PNL_Space1) and (Echange_Unit_To_Unit_Space1) then  iStep:=4+iStep;
   tem1:=0;
   if Leave_Section_falchion_number1=0 then Leave_Section_falchion_number1:=2; //没有输入排版方法时,默认为:2,二三区只可以有两部分
   Tem_TProgressBar1.Position:=1;
   //if Tem_Calculate_Rate_Type1=0 then Tem_Calculate_Rate_Type1:=1;//没有输入计算利用率的方法时,默认为:1,以单元计算.
   tem_Param_PCB2:=Param_PCB2;
   function_resule1:=Calculate_Unit_TwoPNL(tem_Param_PCB2);
   tem1:=tem1+1;
   Tem_TProgressBar1.Position:=trunc(tem1*100/iStep);

    //交换长宽上下限
   if Change_PNL_Long_Width1 then
   begin
      tem_Param_PCB2:=Param_PCB2;
      tem_Param_PCB2.PNLA_Long_Max :=Param_PCB2.PNLA_Width_Max;
      tem_Param_PCB2.PNLA_long_Min :=Param_PCB2.PNLA_width_Min;
      tem_Param_PCB2.PNLA_width_Max :=Param_PCB2.PNLA_long_Max;
      tem_Param_PCB2.PNLA_width_Min :=Param_PCB2.PNLA_long_Min;
      function_resule1:=Calculate_Unit_TwoPNL(tem_Param_PCB2);
      tem1:=tem1+1;
      Tem_TProgressBar1.Position:=trunc(tem1*100/iStep);
   end;

   tem_Param_PCB2:=Param_PCB2;
   tem_Param_PCB2.PNLb_Long_Max :=Param_PCB2.PNLb_Width_Max;
   tem_Param_PCB2.PNLb_long_Min :=Param_PCB2.PNLb_width_Min;
   tem_Param_PCB2.PNLb_width_Max :=Param_PCB2.PNLb_long_Max;
   tem_Param_PCB2.PNLb_width_Min :=Param_PCB2.PNLb_long_Min;
   function_resule1:=Calculate_Unit_TwoPNL(tem_Param_PCB2);
   tem1:=tem1+1;
   Tem_TProgressBar1.Position:=trunc(tem1*100/iStep);

   tem_Param_PCB2:=Param_PCB2;
   tem_Param_PCB2.PNLA_Long_Max :=Param_PCB2.PNLA_Width_Max;
   tem_Param_PCB2.PNLA_long_Min :=Param_PCB2.PNLA_width_Min;
   tem_Param_PCB2.PNLA_width_Max :=Param_PCB2.PNLA_long_Max;
   tem_Param_PCB2.PNLA_width_Min :=Param_PCB2.PNLA_long_Min;
   tem_Param_PCB2.PNLb_Long_Max :=Param_PCB2.PNLb_Width_Max;
   tem_Param_PCB2.PNLb_long_Min :=Param_PCB2.PNLb_width_Min;
   tem_Param_PCB2.PNLb_width_Max :=Param_PCB2.PNLb_long_Max;
   tem_Param_PCB2.PNLb_width_Min :=Param_PCB2.PNLb_long_Min;
   function_resule1:=Calculate_Unit_TwoPNL(tem_Param_PCB2);
   tem1:=tem1+1;
   Tem_TProgressBar1.Position:=trunc(tem1*100/iStep);

   //允许单元长宽间距调换 默认为不调换  将单元间距交换再调用上面的函数
   if Echange_Unit_To_Unit_Space1 then
   begin
     tem_Param_PCB2:=Param_PCB2;
     tem_Param_PCB2.Unit_Long_Space:=Param_PCB2.Unit_Width_Space;
     tem_Param_PCB2.Unit_Width_Space:=Param_PCB2.Unit_Long_Space;
     function_resule1:=Calculate_Unit_TwoPNL(tem_Param_PCB2);
     tem1:=tem1+1;
     Tem_TProgressBar1.Position:=trunc(tem1*100/iStep);

     if Change_PNL_Long_Width1 then  //交换长宽上下限
     begin
       tem_Param_PCB2:=Param_PCB2;
       tem_Param_PCB2.Unit_Long_Space:=Param_PCB2.Unit_Width_Space;
       tem_Param_PCB2.Unit_Width_Space:=Param_PCB2.Unit_Long_Space;
       tem_Param_PCB2.PNLA_Long_Max :=Param_PCB2.PNLA_Width_Max;
       tem_Param_PCB2.PNLA_long_Min :=Param_PCB2.PNLA_width_Min;
       tem_Param_PCB2.PNLA_width_Max :=Param_PCB2.PNLA_long_Max;
       tem_Param_PCB2.PNLA_width_Min :=Param_PCB2.PNLA_long_Min;
       function_resule1:=Calculate_Unit_TwoPNL(tem_Param_PCB2);
       tem1:=tem1+1;
       Tem_TProgressBar1.Position:=trunc(tem1*100/iStep);
     end;

     tem_Param_PCB2:=Param_PCB2;
     tem_Param_PCB2.Unit_Long_Space:=Param_PCB2.Unit_Width_Space;
     tem_Param_PCB2.Unit_Width_Space:=Param_PCB2.Unit_Long_Space;
     tem_Param_PCB2.PNLb_Long_Max :=Param_PCB2.PNLb_Width_Max;
     tem_Param_PCB2.PNLb_long_Min :=Param_PCB2.PNLb_width_Min;
     tem_Param_PCB2.PNLb_width_Max :=Param_PCB2.PNLb_long_Max;
     tem_Param_PCB2.PNLb_width_Min :=Param_PCB2.PNLb_long_Min;
     function_resule1:=Calculate_Unit_TwoPNL(tem_Param_PCB2);
     tem1:=tem1+1;
     Tem_TProgressBar1.Position:=trunc(tem1*100/iStep);

     tem_Param_PCB2:=Param_PCB2;
     tem_Param_PCB2.Unit_Long_Space:=Param_PCB2.Unit_Width_Space;
     tem_Param_PCB2.Unit_Width_Space:=Param_PCB2.Unit_Long_Space;
     tem_Param_PCB2.PNLA_Long_Max :=Param_PCB2.PNLA_Width_Max;
     tem_Param_PCB2.PNLA_long_Min :=Param_PCB2.PNLA_width_Min;
     tem_Param_PCB2.PNLA_width_Max :=Param_PCB2.PNLA_long_Max;
     tem_Param_PCB2.PNLA_width_Min :=Param_PCB2.PNLA_long_Min;
     tem_Param_PCB2.PNLb_Long_Max :=Param_PCB2.PNLb_Width_Max;
     tem_Param_PCB2.PNLb_long_Min :=Param_PCB2.PNLb_width_Min;
     tem_Param_PCB2.PNLb_width_Max :=Param_PCB2.PNLb_long_Max;
     tem_Param_PCB2.PNLb_width_Min :=Param_PCB2.PNLb_long_Min;
     function_resule1:=Calculate_Unit_TwoPNL(tem_Param_PCB2);
     tem1:=tem1+1;
     Tem_TProgressBar1.Position:=trunc(tem1*100/iStep);
   end;

   //允许单元边距调换 默认为不调换   将边距调换再调用上面的函数
   if Echange_Unit_To_PNL_Space1 then
   begin
     tem_Param_PCB2:=Param_PCB2;
     tem_Param_PCB2.Unit_Long_ToPNL:=Param_PCB2.Unit_Width_ToPNL ;
     tem_Param_PCB2.Unit_Width_ToPNL:=Param_PCB2.Unit_Long_ToPNL;
     function_resule1:=Calculate_Unit_TwoPNL(tem_Param_PCB2);
     tem1:=tem1+1;
     Tem_TProgressBar1.Position:=trunc(tem1*100/iStep);

     if Change_PNL_Long_Width1 then  //交换长宽上下限
     begin
       tem_Param_PCB2:=Param_PCB2;
       tem_Param_PCB2.Unit_Long_ToPNL:=Param_PCB2.Unit_Width_ToPNL ;
       tem_Param_PCB2.Unit_Width_ToPNL:=Param_PCB2.Unit_Long_ToPNL;
       tem_Param_PCB2.PNLA_Long_Max :=Param_PCB2.PNLA_Width_Max;
       tem_Param_PCB2.PNLA_long_Min :=Param_PCB2.PNLA_width_Min;
       tem_Param_PCB2.PNLA_width_Max :=Param_PCB2.PNLA_long_Max;
       tem_Param_PCB2.PNLA_width_Min :=Param_PCB2.PNLA_long_Min;
       function_resule1:=Calculate_Unit_TwoPNL(tem_Param_PCB2);
       tem1:=tem1+1;
       Tem_TProgressBar1.Position:=trunc(tem1*100/iStep);
     end;

     tem_Param_PCB2:=Param_PCB2;
     tem_Param_PCB2.Unit_Long_ToPNL:=Param_PCB2.Unit_Width_ToPNL ;
     tem_Param_PCB2.Unit_Width_ToPNL:=Param_PCB2.Unit_Long_ToPNL;
     tem_Param_PCB2.PNLb_Long_Max :=Param_PCB2.PNLb_Width_Max;
     tem_Param_PCB2.PNLb_long_Min :=Param_PCB2.PNLb_width_Min;
     tem_Param_PCB2.PNLb_width_Max :=Param_PCB2.PNLb_long_Max;
     tem_Param_PCB2.PNLb_width_Min :=Param_PCB2.PNLb_long_Min;
     function_resule1:=Calculate_Unit_TwoPNL(tem_Param_PCB2);
     tem1:=tem1+1;
     Tem_TProgressBar1.Position:=trunc(tem1*100/iStep);

     tem_Param_PCB2:=Param_PCB2;
     tem_Param_PCB2.Unit_Long_ToPNL:=Param_PCB2.Unit_Width_ToPNL ;
     tem_Param_PCB2.Unit_Width_ToPNL:=Param_PCB2.Unit_Long_ToPNL;
     tem_Param_PCB2.PNLA_Long_Max :=Param_PCB2.PNLA_Width_Max;
     tem_Param_PCB2.PNLA_long_Min :=Param_PCB2.PNLA_width_Min;
     tem_Param_PCB2.PNLA_width_Max :=Param_PCB2.PNLA_long_Max;
     tem_Param_PCB2.PNLA_width_Min :=Param_PCB2.PNLA_long_Min;
     tem_Param_PCB2.PNLb_Long_Max :=Param_PCB2.PNLb_Width_Max;
     tem_Param_PCB2.PNLb_long_Min :=Param_PCB2.PNLb_width_Min;
     tem_Param_PCB2.PNLb_width_Max :=Param_PCB2.PNLb_long_Max;
     tem_Param_PCB2.PNLb_width_Min :=Param_PCB2.PNLb_long_Min;
     function_resule1:=Calculate_Unit_TwoPNL(tem_Param_PCB2);
     tem1:=tem1+1;
     Tem_TProgressBar1.Position:=trunc(tem1*100/iStep);
   end;

   //允许单元边距调换与允许单元长宽间距调换
   if Echange_Unit_To_Unit_Space1 and Echange_Unit_To_PNL_Space1 then //两个都选中时
   begin
     tem_Param_PCB2:=Param_PCB2;
     tem_Param_PCB2.Unit_Long_Space:=Param_PCB2.Unit_Width_Space;
     tem_Param_PCB2.Unit_Width_Space:=Param_PCB2.Unit_Long_Space;
     tem_Param_PCB2.Unit_Long_ToPNL:=Param_PCB2.Unit_Width_ToPNL ;
     tem_Param_PCB2.Unit_Width_ToPNL:=Param_PCB2.Unit_Long_ToPNL;
     function_resule1:=Calculate_Unit_TwoPNL(tem_Param_PCB2);
     tem1:=tem1+1;
     Tem_TProgressBar1.Position:=trunc(tem1*100/iStep);

     if Change_PNL_Long_Width1 then
     begin
       //交换长宽上下限
       tem_Param_PCB2:=Param_PCB2;
       tem_Param_PCB2.Unit_Long_Space:=Param_PCB2.Unit_Width_Space;
       tem_Param_PCB2.Unit_Width_Space:=Param_PCB2.Unit_Long_Space;
       tem_Param_PCB2.Unit_Long_ToPNL:=Param_PCB2.Unit_Width_ToPNL ;
       tem_Param_PCB2.Unit_Width_ToPNL:=Param_PCB2.Unit_Long_ToPNL;
       tem_Param_PCB2.PNLA_Long_Max :=Param_PCB2.PNLA_Width_Max;
       tem_Param_PCB2.PNLA_long_Min :=Param_PCB2.PNLA_width_Min;
       tem_Param_PCB2.PNLA_width_Max :=Param_PCB2.PNLA_long_Max;
       tem_Param_PCB2.PNLA_width_Min :=Param_PCB2.PNLA_long_Min;
       function_resule1:=Calculate_Unit_TwoPNL(tem_Param_PCB2);
       tem1:=tem1+1;
       Tem_TProgressBar1.Position:=trunc(tem1*100/iStep);
     end;

     tem_Param_PCB2:=Param_PCB2;
     tem_Param_PCB2.Unit_Long_Space:=Param_PCB2.Unit_Width_Space;
     tem_Param_PCB2.Unit_Width_Space:=Param_PCB2.Unit_Long_Space;
     tem_Param_PCB2.Unit_Long_ToPNL:=Param_PCB2.Unit_Width_ToPNL ;
     tem_Param_PCB2.Unit_Width_ToPNL:=Param_PCB2.Unit_Long_ToPNL;
     tem_Param_PCB2.PNLb_Long_Max :=Param_PCB2.PNLb_Width_Max;
     tem_Param_PCB2.PNLb_long_Min :=Param_PCB2.PNLb_width_Min;
     tem_Param_PCB2.PNLb_width_Max :=Param_PCB2.PNLb_long_Max;
     tem_Param_PCB2.PNLb_width_Min :=Param_PCB2.PNLb_long_Min;
     function_resule1:=Calculate_Unit_TwoPNL(tem_Param_PCB2);
     tem1:=tem1+1;
     Tem_TProgressBar1.Position:=trunc(tem1*100/iStep);

     tem_Param_PCB2:=Param_PCB2;
     tem_Param_PCB2.Unit_Long_Space:=Param_PCB2.Unit_Width_Space;
     tem_Param_PCB2.Unit_Width_Space:=Param_PCB2.Unit_Long_Space;
     tem_Param_PCB2.Unit_Long_ToPNL:=Param_PCB2.Unit_Width_ToPNL ;
     tem_Param_PCB2.Unit_Width_ToPNL:=Param_PCB2.Unit_Long_ToPNL;
     tem_Param_PCB2.PNLA_Long_Max :=Param_PCB2.PNLA_Width_Max;
     tem_Param_PCB2.PNLA_long_Min :=Param_PCB2.PNLA_width_Min;
     tem_Param_PCB2.PNLA_width_Max :=Param_PCB2.PNLA_long_Max;
     tem_Param_PCB2.PNLA_width_Min :=Param_PCB2.PNLA_long_Min;
     tem_Param_PCB2.PNLb_Long_Max :=Param_PCB2.PNLb_Width_Max;
     tem_Param_PCB2.PNLb_long_Min :=Param_PCB2.PNLb_width_Min;
     tem_Param_PCB2.PNLb_width_Max :=Param_PCB2.PNLb_long_Max;
     tem_Param_PCB2.PNLb_width_Min :=Param_PCB2.PNLb_long_Min;
     function_resule1:=Calculate_Unit_TwoPNL(tem_Param_PCB2);
     tem1:=tem1+1;
     Tem_TProgressBar1.Position:=trunc(tem1*100/iStep);
   end;

   function_resule1:=Echange_Two_And_Three_Section_Data(Result_MakeUp2^);//交换二三区内PNLA与PNLB位置
   function_resule1:=Pnla_PnlB_number(Result_MakeUp2^);                  //临时用计算PNLA与PNLB个数
   if Calculate_Flag1=0 then   showmessage('请改大上下限范围!请检查!') else Sort_Result;
   Tem_TProgressBar1.Position:=Tem_TProgressBar1.Max;
end;

procedure TCutSheet2.Calculate_Array_Complete_Percent_2(
  V_ProgressBar1: TProgressBar; V_ProgressBar1_Position: INTEGER);
begin
  V_ProgressBar1.Position:=V_ProgressBar1_Position;
end;

procedure TCutSheet2.Calculate_Array_Complete_Percent_1(
  V_ProgressBar1: TProgressBar; V_ProgressBar1_Min,
  V_ProgressBar1_MAX: INTEGER);
begin
  V_ProgressBar1.Min:=V_ProgressBar1_Min;
  V_ProgressBar1.Max:=V_ProgressBar1_MAX;
end;

function TCutSheet2.Calculate_TwoPNL_Sheet_1(const value2: TResult_PNL2;//PNLA与PNLB值
                      const value22:TParam_Sheet2  //大料长宽
                      ;const value_pnla:integer;//用于存PNLA还是PNLB,1代表PNLA;2代表PNLB
                      iSheet:integer=0): boolean;
var
  i10,j10 ,n10,n11 :integer;  //用于记录最大能排PNL个数
  function_result001:boolean;
  tepvalue2,tepvalue3:TResult_PNL2;
  tem_Sheet_Size_TwoPNL2,tem_Sheet_Size_TwoPNL3:TParam_Sheet2;
begin
  Result:=false;//函数返回假
  if (value2.PNLA_Long<=value22.Sheet_Long) and (value2.PNLA_Width<=value22.Sheet_Width)   then //PNL长宽在大料内,即可排一个以上
  begin
    n10:=trunc(value22.Sheet_Long/value2.PNLA_Long);  //大料长排PNL长个数
    n11:=trunc(value22.Sheet_Width/value2.PNLA_Width);//大料宽排PNL宽个数
    for i10:=1 to n10 do   //长排大料长边
    begin
       for j10:=1 to n11 do //宽排大料宽边
       begin
           //此中分两种排法   type=1 与type=2 ,将剩下的两种尺寸再排 调用函数Calculate_TwoPNL_Sheet_2
                                       // |--------|-------|
           //第一种排法,第一刀与宽平行开  |        |       |
//--------------------------              |--------|       |
//                                        |        |       |
           //二区, 三区                   |--------|-------|
           tem_Sheet_Size_TwoPNL2.Sheet_Long:=value22.Sheet_Long-i10*value2.PNLA_Long;//二区长
           tem_Sheet_Size_TwoPNL2.Sheet_Width:=value22.Sheet_Width ;//二区宽
           tem_Sheet_Size_TwoPNL3.Sheet_Long:=i10*value2.PNLA_Long;//三区长
           tem_Sheet_Size_TwoPNL3.Sheet_Width:=value22.Sheet_Width-j10*value2.PNLA_Width;//三区宽
           tepvalue2:=value2; //用于对调
           tepvalue3:=value2;
           function_result001:=Calculate_TwoPNL_Sheet_2(value2,tepvalue2,tepvalue3,value22,tem_Sheet_Size_TwoPNL2,tem_Sheet_Size_TwoPNL3,i10,j10,1,1,1,value_pnla,1,1,iSheet);
           //对调二区长宽
           tem_Sheet_Size_TwoPNL2.Sheet_Long:=value22.Sheet_Width;//二区长
           tem_Sheet_Size_TwoPNL2.Sheet_Width:= value22.Sheet_Long-i10*value2.PNLA_Long;//二区宽
           tem_Sheet_Size_TwoPNL3.Sheet_Long:=i10*value2.PNLA_Long;//三区长
           tem_Sheet_Size_TwoPNL3.Sheet_Width:=value22.Sheet_Width-j10*value2.PNLA_Width;//三区宽
           function_result001:=Calculate_TwoPNL_Sheet_2(value2,tepvalue2,tepvalue3,value22,tem_Sheet_Size_TwoPNL2,tem_Sheet_Size_TwoPNL3,i10,j10,1,2,1,value_pnla,1,1,iSheet);
           //对调三区长宽
           tem_Sheet_Size_TwoPNL2.Sheet_Long:=value22.Sheet_Long-i10*value2.PNLA_Long;//二区长
           tem_Sheet_Size_TwoPNL2.Sheet_Width:=value22.Sheet_Width ;//二区宽
           tem_Sheet_Size_TwoPNL3.Sheet_Long:=value22.Sheet_Width-j10*value2.PNLA_Width;//三区长
           tem_Sheet_Size_TwoPNL3.Sheet_Width:=i10*value2.PNLA_Long;//三区宽
           function_result001:=Calculate_TwoPNL_Sheet_2(value2,tepvalue2,tepvalue3,value22,tem_Sheet_Size_TwoPNL2,tem_Sheet_Size_TwoPNL3,i10,j10,1,1,2,value_pnla,1,1,iSheet);
           //对调二区,三区长宽
           tem_Sheet_Size_TwoPNL2.Sheet_Long:=value22.Sheet_Width;//二区长
           tem_Sheet_Size_TwoPNL2.Sheet_Width:= value22.Sheet_Long-i10*value2.PNLA_Long;//二区宽
           tem_Sheet_Size_TwoPNL3.Sheet_Long:=value22.Sheet_Width-j10*value2.PNLA_Width;//三区长
           tem_Sheet_Size_TwoPNL3.Sheet_Width:=i10*value2.PNLA_Long;//三区宽
           function_result001:=Calculate_TwoPNL_Sheet_2(value2,tepvalue2,tepvalue3,value22,tem_Sheet_Size_TwoPNL2,tem_Sheet_Size_TwoPNL3,i10,j10,1,2,2,value_pnla,1,1,iSheet);

           //对调二区PNLB与PNLA
           tem_Sheet_Size_TwoPNL2.Sheet_Long:=value22.Sheet_Long-i10*value2.PNLA_Long;//二区长
           tem_Sheet_Size_TwoPNL2.Sheet_Width:=value22.Sheet_Width ;//二区宽
           tem_Sheet_Size_TwoPNL3.Sheet_Long:=i10*value2.PNLA_Long;//三区长
           tem_Sheet_Size_TwoPNL3.Sheet_Width:=value22.Sheet_Width-j10*value2.PNLA_Width;//三区宽

           tepvalue2.PNLA_Unit_Long_Number :=value2.PNLb_Unit_Width_Number ;
           tepvalue2.PNLA_Unit_Width_Number :=value2.PNLb_Unit_Long_Number ;
           tepvalue2.PNLA_Long :=value2.PNLb_Width;
           tepvalue2.PNLA_Width :=value2.PNLb_Long;
           tepvalue2.PNLb_Unit_Long_Number :=value2.PNLa_Unit_Width_Number ;
           tepvalue2.PNLb_Unit_Width_Number :=value2.PNLa_Unit_Long_Number ;
           tepvalue2.PNLb_Long :=value2.PNLa_Width;
           tepvalue2.PNLb_Width :=value2.PNLa_Long;
           tepvalue3:=value2;
           function_result001:=Calculate_TwoPNL_Sheet_2(value2,tepvalue2,tepvalue3,value22,tem_Sheet_Size_TwoPNL2,tem_Sheet_Size_TwoPNL3,i10,j10,1,1,1,value_pnla,2,1,iSheet);
           //对调二区长宽
           tem_Sheet_Size_TwoPNL2.Sheet_Long:=value22.Sheet_Width;//二区长
           tem_Sheet_Size_TwoPNL2.Sheet_Width:= value22.Sheet_Long-i10*value2.PNLA_Long;//二区宽
           tem_Sheet_Size_TwoPNL3.Sheet_Long:=i10*value2.PNLA_Long;//三区长
           tem_Sheet_Size_TwoPNL3.Sheet_Width:=value22.Sheet_Width-j10*value2.PNLA_Width;//三区宽
           function_result001:=Calculate_TwoPNL_Sheet_2(value2,tepvalue2,tepvalue3,value22,tem_Sheet_Size_TwoPNL2,tem_Sheet_Size_TwoPNL3,i10,j10,1,2,1,value_pnla,2,1,iSheet);
           //对调三区长宽
           tem_Sheet_Size_TwoPNL2.Sheet_Long:=value22.Sheet_Long-i10*value2.PNLA_Long;//二区长
           tem_Sheet_Size_TwoPNL2.Sheet_Width:=value22.Sheet_Width ;//二区宽
           tem_Sheet_Size_TwoPNL3.Sheet_Long:=value22.Sheet_Width-j10*value2.PNLA_Width;//三区长
           tem_Sheet_Size_TwoPNL3.Sheet_Width:=i10*value2.PNLA_Long;//三区宽
           function_result001:=Calculate_TwoPNL_Sheet_2(value2,tepvalue2,tepvalue3,value22,tem_Sheet_Size_TwoPNL2,tem_Sheet_Size_TwoPNL3,i10,j10,1,1,2,value_pnla,2,1,iSheet);
           //对调二区,三区长宽
           tem_Sheet_Size_TwoPNL2.Sheet_Long:=value22.Sheet_Width;//二区长
           tem_Sheet_Size_TwoPNL2.Sheet_Width:= value22.Sheet_Long-i10*value2.PNLA_Long;//二区宽
           tem_Sheet_Size_TwoPNL3.Sheet_Long:=value22.Sheet_Width-j10*value2.PNLA_Width;//三区长
           tem_Sheet_Size_TwoPNL3.Sheet_Width:=i10*value2.PNLA_Long;//三区宽
           function_result001:=Calculate_TwoPNL_Sheet_2(value2,tepvalue2,tepvalue3,value22,tem_Sheet_Size_TwoPNL2,tem_Sheet_Size_TwoPNL3,i10,j10,1,2,2,value_pnla,2,1,iSheet);

               //对调三区PNLB与PNLA
              tem_Sheet_Size_TwoPNL2.Sheet_Long:=value22.Sheet_Long-i10*value2.PNLA_Long;//二区长
              tem_Sheet_Size_TwoPNL2.Sheet_Width:=value22.Sheet_Width ;//二区宽
              tem_Sheet_Size_TwoPNL3.Sheet_Long:=i10*value2.PNLA_Long;//三区长
              tem_Sheet_Size_TwoPNL3.Sheet_Width:=value22.Sheet_Width-j10*value2.PNLA_Width;//三区宽
              tepvalue3:=value2;
              tepvalue3.PNLA_Unit_Long_Number :=value2.PNLb_Unit_Width_Number ;
              tepvalue3.PNLA_Unit_Width_Number :=value2.PNLb_Unit_Long_Number ;
              tepvalue3.PNLA_Long :=value2.PNLb_Width;
              tepvalue3.PNLA_Width :=value2.PNLb_Long;
              tepvalue3.PNLb_Unit_Long_Number :=value2.PNLa_Unit_Width_Number ;
              tepvalue3.PNLb_Unit_Width_Number :=value2.PNLa_Unit_Long_Number ;
              tepvalue3.PNLb_Long :=value2.PNLa_Width;
              tepvalue3.PNLb_Width :=value2.PNLa_Long;
              tepvalue2:=value2;
             function_result001:=Calculate_TwoPNL_Sheet_2(value2,tepvalue2,tepvalue3,value22,tem_Sheet_Size_TwoPNL2,tem_Sheet_Size_TwoPNL3,i10,j10,1,1,1,value_pnla,1,2,iSheet);
              //对调二区长宽
              tem_Sheet_Size_TwoPNL2.Sheet_Long:=value22.Sheet_Width;//二区长
              tem_Sheet_Size_TwoPNL2.Sheet_Width:= value22.Sheet_Long-i10*value2.PNLA_Long;//二区宽
              tem_Sheet_Size_TwoPNL3.Sheet_Long:=i10*value2.PNLA_Long;//三区长
              tem_Sheet_Size_TwoPNL3.Sheet_Width:=value22.Sheet_Width-j10*value2.PNLA_Width;//三区宽
              function_result001:=Calculate_TwoPNL_Sheet_2(value2,tepvalue2,tepvalue3,value22,tem_Sheet_Size_TwoPNL2,tem_Sheet_Size_TwoPNL3,i10,j10,1,2,1,value_pnla,1,2,iSheet);
              //对调三区长宽
             tem_Sheet_Size_TwoPNL2.Sheet_Long:=value22.Sheet_Long-i10*value2.PNLA_Long;//二区长
             tem_Sheet_Size_TwoPNL2.Sheet_Width:=value22.Sheet_Width ;//二区宽
             tem_Sheet_Size_TwoPNL3.Sheet_Long:=value22.Sheet_Width-j10*value2.PNLA_Width;//三区长
             tem_Sheet_Size_TwoPNL3.Sheet_Width:=i10*value2.PNLA_Long;//三区宽
             function_result001:=Calculate_TwoPNL_Sheet_2(value2,tepvalue2,tepvalue3,value22,tem_Sheet_Size_TwoPNL2,tem_Sheet_Size_TwoPNL3,i10,j10,1,1,2,value_pnla,1,2,iSheet);
             //对调二区,三区长宽
             tem_Sheet_Size_TwoPNL2.Sheet_Long:=value22.Sheet_Width;//二区长
             tem_Sheet_Size_TwoPNL2.Sheet_Width:= value22.Sheet_Long-i10*value2.PNLA_Long;//二区宽
             tem_Sheet_Size_TwoPNL3.Sheet_Long:=value22.Sheet_Width-j10*value2.PNLA_Width;//三区长
             tem_Sheet_Size_TwoPNL3.Sheet_Width:=i10*value2.PNLA_Long;//三区宽
             function_result001:=Calculate_TwoPNL_Sheet_2(value2,tepvalue2,tepvalue3,value22,tem_Sheet_Size_TwoPNL2,tem_Sheet_Size_TwoPNL3,i10,j10,1,2,2,value_pnla,1,2,iSheet);
             //对调结束三区PNLB与PNLA

                //对调二区,三区PNLB与PNLA
               tem_Sheet_Size_TwoPNL2.Sheet_Long:=value22.Sheet_Long-i10*value2.PNLA_Long;//二区长
               tem_Sheet_Size_TwoPNL2.Sheet_Width:=value22.Sheet_Width ;//二区宽
               tem_Sheet_Size_TwoPNL3.Sheet_Long:=i10*value2.PNLA_Long;//三区长
               tem_Sheet_Size_TwoPNL3.Sheet_Width:=value22.Sheet_Width-j10*value2.PNLA_Width;//三区宽
               tepvalue2:=value2;
               tepvalue2.PNLA_Unit_Long_Number :=value2.PNLb_Unit_Width_Number ;
               tepvalue2.PNLA_Unit_Width_Number :=value2.PNLb_Unit_Long_Number ;
               tepvalue2.PNLA_Long :=value2.PNLb_Width;
               tepvalue2.PNLA_Width :=value2.PNLb_Long;
               tepvalue2.PNLb_Unit_Long_Number :=value2.PNLa_Unit_Width_Number ;
               tepvalue2.PNLb_Unit_Width_Number :=value2.PNLa_Unit_Long_Number ;
               tepvalue2.PNLb_Long :=value2.PNLa_Width;
               tepvalue2.PNLb_Width :=value2.PNLa_Long;
               tepvalue3:=value2;
               tepvalue3.PNLA_Unit_Long_Number :=value2.PNLb_Unit_Width_Number ;
               tepvalue3.PNLA_Unit_Width_Number :=value2.PNLb_Unit_Long_Number ;
               tepvalue3.PNLA_Long :=value2.PNLb_Width;
               tepvalue3.PNLA_Width :=value2.PNLb_Long;
               tepvalue3.PNLb_Unit_Long_Number :=value2.PNLa_Unit_Width_Number ;
               tepvalue3.PNLb_Unit_Width_Number :=value2.PNLa_Unit_Long_Number ;
               tepvalue3.PNLb_Long :=value2.PNLa_Width;
               tepvalue3.PNLb_Width :=value2.PNLa_Long;
               function_result001:=Calculate_TwoPNL_Sheet_2(value2,tepvalue2,tepvalue3,value22,tem_Sheet_Size_TwoPNL2,tem_Sheet_Size_TwoPNL3,i10,j10,1,1,1,value_pnla,2,2,iSheet);
               //对调二区长宽
               tem_Sheet_Size_TwoPNL2.Sheet_Long:=value22.Sheet_Width;//二区长
               tem_Sheet_Size_TwoPNL2.Sheet_Width:= value22.Sheet_Long-i10*value2.PNLA_Long;//二区宽
               tem_Sheet_Size_TwoPNL3.Sheet_Long:=i10*value2.PNLA_Long;//三区长
               tem_Sheet_Size_TwoPNL3.Sheet_Width:=value22.Sheet_Width-j10*value2.PNLA_Width;//三区宽

               function_result001:=Calculate_TwoPNL_Sheet_2(value2,tepvalue2,tepvalue3,value22,tem_Sheet_Size_TwoPNL2,tem_Sheet_Size_TwoPNL3,i10,j10,1,2,1,value_pnla,2,2,iSheet);
               //对调三区长宽
              tem_Sheet_Size_TwoPNL2.Sheet_Long:=value22.Sheet_Long-i10*value2.PNLA_Long;//二区长
              tem_Sheet_Size_TwoPNL2.Sheet_Width:=value22.Sheet_Width ;//二区宽
              tem_Sheet_Size_TwoPNL3.Sheet_Long:=value22.Sheet_Width-j10*value2.PNLA_Width;//三区长
              tem_Sheet_Size_TwoPNL3.Sheet_Width:=i10*value2.PNLA_Long;//三区宽

              function_result001:=Calculate_TwoPNL_Sheet_2(value2,tepvalue2,tepvalue3,value22,tem_Sheet_Size_TwoPNL2,tem_Sheet_Size_TwoPNL3,i10,j10,1,1,2,value_pnla,2,2,iSheet);
              //对调二区,三区长宽
              tem_Sheet_Size_TwoPNL2.Sheet_Long:=value22.Sheet_Width;//二区长
              tem_Sheet_Size_TwoPNL2.Sheet_Width:= value22.Sheet_Long-i10*value2.PNLA_Long;//二区宽
              tem_Sheet_Size_TwoPNL3.Sheet_Long:=value22.Sheet_Width-j10*value2.PNLA_Width;//三区长
              tem_Sheet_Size_TwoPNL3.Sheet_Width:=i10*value2.PNLA_Long;//三区宽
              function_result001:=Calculate_TwoPNL_Sheet_2(value2,tepvalue2,tepvalue3,value22,tem_Sheet_Size_TwoPNL2,tem_Sheet_Size_TwoPNL3,i10,j10,1,2,2,value_pnla,2,2,iSheet);
              //对调结束二区,三区PNLB与PNLA
           //,以下程序对调二区,三区长宽
//------------------------------------------------
                                              //  |-------------|--------------|
                                              //  |             |              |
                                              //  |             |              |
           //第二种排法,第一刀与长平行开      //  |-------------|--------------|
                                              //  |                            |
                                              //  |                            |
                                              //  |----------------------------|

           tem_Sheet_Size_TwoPNL2.Sheet_Long:=value22.Sheet_Long-i10*value2.PNLA_Long;//二区长
           tem_Sheet_Size_TwoPNL2.Sheet_Width:=j10*value2.PNLA_Width ;//二区宽 value22.Sheet_Width
           tem_Sheet_Size_TwoPNL3.Sheet_Long:=value22.Sheet_Long;//i10*value2.PNLA_Long;//三区长
           tem_Sheet_Size_TwoPNL3.Sheet_Width:=value22.Sheet_Width-j10*value2.PNLA_Width;//三区宽
           tepvalue2:=value2; //用于对调
           tepvalue3:=value2;
           function_result001:=Calculate_TwoPNL_Sheet_2(value2,tepvalue2,tepvalue3,value22,tem_Sheet_Size_TwoPNL2,tem_Sheet_Size_TwoPNL3,i10,j10,2,1,1,value_pnla,1,1,iSheet);
           //对调二区长宽
           tem_Sheet_Size_TwoPNL2.Sheet_Long:=j10*value2.PNLA_Width;//二区长
           tem_Sheet_Size_TwoPNL2.Sheet_Width:=value22.Sheet_Long-i10*value2.PNLA_Long ;//二区宽 value22.Sheet_Width
           tem_Sheet_Size_TwoPNL3.Sheet_Long:=value22.Sheet_Long;//i10*value2.PNLA_Long;//三区长
           tem_Sheet_Size_TwoPNL3.Sheet_Width:=value22.Sheet_Width-j10*value2.PNLA_Width;//三区宽

           function_result001:=Calculate_TwoPNL_Sheet_2(value2,tepvalue2,tepvalue3,value22,tem_Sheet_Size_TwoPNL2,tem_Sheet_Size_TwoPNL3,i10,j10,2,2,1,value_pnla,1,1,iSheet);
           //对调三区长宽
           tem_Sheet_Size_TwoPNL2.Sheet_Long:=value22.Sheet_Long-i10*value2.PNLA_Long;//二区长
           tem_Sheet_Size_TwoPNL2.Sheet_Width:=j10*value2.PNLA_Width ;//二区宽 value22.Sheet_Width
           tem_Sheet_Size_TwoPNL3.Sheet_Long:=value22.Sheet_Width-j10*value2.PNLA_Width;//i10*value2.PNLA_Long;//三区长
           tem_Sheet_Size_TwoPNL3.Sheet_Width:=value22.Sheet_Long;//三区宽

           function_result001:=Calculate_TwoPNL_Sheet_2(value2,tepvalue2,tepvalue3,value22,tem_Sheet_Size_TwoPNL2,tem_Sheet_Size_TwoPNL3,i10,j10,2,1,2,value_pnla,1,1,iSheet);
           //对调二区,三区长宽
           tem_Sheet_Size_TwoPNL2.Sheet_Long:=j10*value2.PNLA_Width ;//二区长
           tem_Sheet_Size_TwoPNL2.Sheet_Width:=value22.Sheet_Long-i10*value2.PNLA_Long;//二区宽 value22.Sheet_Width
           tem_Sheet_Size_TwoPNL3.Sheet_Long:=value22.Sheet_Width-j10*value2.PNLA_Width;//i10*value2.PNLA_Long;//三区长
           tem_Sheet_Size_TwoPNL3.Sheet_Width:=value22.Sheet_Long;//三区宽
           function_result001:=Calculate_TwoPNL_Sheet_2(value2,tepvalue2,tepvalue3,value22,tem_Sheet_Size_TwoPNL2,tem_Sheet_Size_TwoPNL3,i10,j10,2,2,2,value_pnla,1,1,iSheet);

           //对调二区PNLB与PNLA
           tem_Sheet_Size_TwoPNL2.Sheet_Long:=value22.Sheet_Long-i10*value2.PNLA_Long;//二区长
           tem_Sheet_Size_TwoPNL2.Sheet_Width:=j10*value2.PNLA_Width ;//二区宽 value22.Sheet_Width
           tem_Sheet_Size_TwoPNL3.Sheet_Long:=value22.Sheet_Long;//i10*value2.PNLA_Long;//三区长
           tem_Sheet_Size_TwoPNL3.Sheet_Width:=value22.Sheet_Width-j10*value2.PNLA_Width;//三区宽

           tepvalue2.PNLA_Unit_Long_Number :=value2.PNLb_Unit_Width_Number ;
           tepvalue2.PNLA_Unit_Width_Number :=value2.PNLb_Unit_Long_Number ;
           tepvalue2.PNLA_Long :=value2.PNLb_Width;
           tepvalue2.PNLA_Width :=value2.PNLb_Long;
           tepvalue2.PNLb_Unit_Long_Number :=value2.PNLa_Unit_Width_Number ;
           tepvalue2.PNLb_Unit_Width_Number :=value2.PNLa_Unit_Long_Number ;
           tepvalue2.PNLb_Long :=value2.PNLa_Width;
           tepvalue2.PNLb_Width :=value2.PNLa_Long;
           tepvalue3:=value2;
           function_result001:=Calculate_TwoPNL_Sheet_2(value2,tepvalue2,tepvalue3,value22,tem_Sheet_Size_TwoPNL2,tem_Sheet_Size_TwoPNL3,i10,j10,2,1,1,value_pnla,2,1,iSheet);
           //对调二区长宽
           tem_Sheet_Size_TwoPNL2.Sheet_Long:=j10*value2.PNLA_Width;//二区长
           tem_Sheet_Size_TwoPNL2.Sheet_Width:=value22.Sheet_Long-i10*value2.PNLA_Long ;//二区宽 value22.Sheet_Width
           tem_Sheet_Size_TwoPNL3.Sheet_Long:=value22.Sheet_Long;//i10*value2.PNLA_Long;//三区长
           tem_Sheet_Size_TwoPNL3.Sheet_Width:=value22.Sheet_Width-j10*value2.PNLA_Width;//三区宽
           function_result001:=Calculate_TwoPNL_Sheet_2(value2,tepvalue2,tepvalue3,value22,tem_Sheet_Size_TwoPNL2,tem_Sheet_Size_TwoPNL3,i10,j10,2,2,1,value_pnla,2,1,iSheet);
           //对调三区长宽
           tem_Sheet_Size_TwoPNL2.Sheet_Long:=value22.Sheet_Long-i10*value2.PNLA_Long;//二区长
           tem_Sheet_Size_TwoPNL2.Sheet_Width:=j10*value2.PNLA_Width ;//二区宽 value22.Sheet_Width
           tem_Sheet_Size_TwoPNL3.Sheet_Long:=value22.Sheet_Width-j10*value2.PNLA_Width;//i10*value2.PNLA_Long;//三区长
           tem_Sheet_Size_TwoPNL3.Sheet_Width:=value22.Sheet_Long;//三区宽

           function_result001:=Calculate_TwoPNL_Sheet_2(value2,tepvalue2,tepvalue3,value22,tem_Sheet_Size_TwoPNL2,tem_Sheet_Size_TwoPNL3,i10,j10,2,1,2,value_pnla,2,1,iSheet);
           //对调二区,三区长宽
            tem_Sheet_Size_TwoPNL2.Sheet_Long:=j10*value2.PNLA_Width;//二区长
           tem_Sheet_Size_TwoPNL2.Sheet_Width:=value22.Sheet_Long-i10*value2.PNLA_Long ;//二区宽 value22.Sheet_Width
           tem_Sheet_Size_TwoPNL3.Sheet_Long:=value22.Sheet_Width-j10*value2.PNLA_Width;//i10*value2.PNLA_Long;//三区长
           tem_Sheet_Size_TwoPNL3.Sheet_Width:=value22.Sheet_Long;//三区宽
           function_result001:=Calculate_TwoPNL_Sheet_2(value2,tepvalue2,tepvalue3,value22,tem_Sheet_Size_TwoPNL2,tem_Sheet_Size_TwoPNL3,i10,j10,2,2,2,value_pnla,2,1,iSheet);

               //对调三区PNLB与PNLA
              tem_Sheet_Size_TwoPNL2.Sheet_Long:=value22.Sheet_Long-i10*value2.PNLA_Long;//二区长
              tem_Sheet_Size_TwoPNL2.Sheet_Width:=j10*value2.PNLA_Width ;//二区宽 value22.Sheet_Width
              tem_Sheet_Size_TwoPNL3.Sheet_Long:=value22.Sheet_Long;//i10*value2.PNLA_Long;//三区长
              tem_Sheet_Size_TwoPNL3.Sheet_Width:=value22.Sheet_Width-j10*value2.PNLA_Width;//三区宽
              tepvalue3:=value2;
              tepvalue3.PNLA_Unit_Long_Number :=value2.PNLb_Unit_Width_Number ;
              tepvalue3.PNLA_Unit_Width_Number :=value2.PNLb_Unit_Long_Number ;
              tepvalue3.PNLA_Long :=value2.PNLb_Width;
              tepvalue3.PNLA_Width :=value2.PNLb_Long;
              tepvalue3.PNLb_Unit_Long_Number :=value2.PNLa_Unit_Width_Number ;
              tepvalue3.PNLb_Unit_Width_Number :=value2.PNLa_Unit_Long_Number ;
              tepvalue3.PNLb_Long :=value2.PNLa_Width;
              tepvalue3.PNLb_Width :=value2.PNLa_Long;
              tepvalue2:=value2;
              function_result001:=Calculate_TwoPNL_Sheet_2(value2,tepvalue2,tepvalue3,value22,tem_Sheet_Size_TwoPNL2,tem_Sheet_Size_TwoPNL3,i10,j10,2,1,1,value_pnla,1,2,iSheet);
              //对调二区长宽
              tem_Sheet_Size_TwoPNL2.Sheet_Long:=j10*value2.PNLA_Width;//二区长
              tem_Sheet_Size_TwoPNL2.Sheet_Width:=value22.Sheet_Long-i10*value2.PNLA_Long ;//二区宽 value22.Sheet_Width
              tem_Sheet_Size_TwoPNL3.Sheet_Long:=value22.Sheet_Long;//i10*value2.PNLA_Long;//三区长
              tem_Sheet_Size_TwoPNL3.Sheet_Width:=value22.Sheet_Width-j10*value2.PNLA_Width;//三区宽
              function_result001:=Calculate_TwoPNL_Sheet_2(value2,tepvalue2,tepvalue3,value22,tem_Sheet_Size_TwoPNL2,tem_Sheet_Size_TwoPNL3,i10,j10,2,2,1,value_pnla,1,2,iSheet);
              //对调三区长宽
              tem_Sheet_Size_TwoPNL2.Sheet_Long:=value22.Sheet_Long-i10*value2.PNLA_Long;//二区长
              tem_Sheet_Size_TwoPNL2.Sheet_Width:=j10*value2.PNLA_Width ;//二区宽
              tem_Sheet_Size_TwoPNL3.Sheet_Long:=value22.Sheet_Width-j10*value2.PNLA_Width;//三区长
              tem_Sheet_Size_TwoPNL3.Sheet_Width:=value22.Sheet_Long;//三区宽
             function_result001:=Calculate_TwoPNL_Sheet_2(value2,tepvalue2,tepvalue3,value22,tem_Sheet_Size_TwoPNL2,tem_Sheet_Size_TwoPNL3,i10,j10,2,1,2,value_pnla,1,2,iSheet);
             //对调二区,三区长宽
              tem_Sheet_Size_TwoPNL2.Sheet_Long:=j10*value2.PNLA_Width;//二区长
              tem_Sheet_Size_TwoPNL2.Sheet_Width:=value22.Sheet_Long-i10*value2.PNLA_Long ;//二区宽
              tem_Sheet_Size_TwoPNL3.Sheet_Long:=value22.Sheet_Width-j10*value2.PNLA_Width;//三区长
              tem_Sheet_Size_TwoPNL3.Sheet_Width:=value22.Sheet_Long;//三区宽
             function_result001:=Calculate_TwoPNL_Sheet_2(value2,tepvalue2,tepvalue3,value22,tem_Sheet_Size_TwoPNL2,tem_Sheet_Size_TwoPNL3,i10,j10,2,2,2,value_pnla,1,2,iSheet);
             //对调结束三区PNLB与PNLA

                //对调二区,三区PNLB与PNLA
              tem_Sheet_Size_TwoPNL2.Sheet_Long:=value22.Sheet_Long-i10*value2.PNLA_Long;//二区长
              tem_Sheet_Size_TwoPNL2.Sheet_Width:=j10*value2.PNLA_Width ;//二区宽
              tem_Sheet_Size_TwoPNL3.Sheet_Long:=value22.Sheet_Long;//三区长
              tem_Sheet_Size_TwoPNL3.Sheet_Width:=value22.Sheet_Width-j10*value2.PNLA_Width;//三区宽
               tepvalue2:=value2;
               tepvalue2.PNLA_Unit_Long_Number :=value2.PNLb_Unit_Width_Number ;
               tepvalue2.PNLA_Unit_Width_Number :=value2.PNLb_Unit_Long_Number ;
               tepvalue2.PNLA_Long :=value2.PNLb_Width;
               tepvalue2.PNLA_Width :=value2.PNLb_Long;
               tepvalue2.PNLb_Unit_Long_Number :=value2.PNLa_Unit_Width_Number ;
               tepvalue2.PNLb_Unit_Width_Number :=value2.PNLa_Unit_Long_Number ;
               tepvalue2.PNLb_Long :=value2.PNLa_Width;
               tepvalue2.PNLb_Width :=value2.PNLa_Long;
               tepvalue3:=value2;
               tepvalue3.PNLA_Unit_Long_Number :=value2.PNLb_Unit_Width_Number ;
               tepvalue3.PNLA_Unit_Width_Number :=value2.PNLb_Unit_Long_Number ;
               tepvalue3.PNLA_Long :=value2.PNLb_Width;
               tepvalue3.PNLA_Width :=value2.PNLb_Long;
               tepvalue3.PNLb_Unit_Long_Number :=value2.PNLa_Unit_Width_Number ;
               tepvalue3.PNLb_Unit_Width_Number :=value2.PNLa_Unit_Long_Number ;
               tepvalue3.PNLb_Long :=value2.PNLa_Width;
               tepvalue3.PNLb_Width :=value2.PNLa_Long;
               function_result001:=Calculate_TwoPNL_Sheet_2(value2,tepvalue2,tepvalue3,value22,tem_Sheet_Size_TwoPNL2,tem_Sheet_Size_TwoPNL3,i10,j10,2,1,1,value_pnla,2,2,iSheet);
               //对调二区长宽
               tem_Sheet_Size_TwoPNL2.Sheet_Long:=j10*value2.PNLA_Width ;//二区长
               tem_Sheet_Size_TwoPNL2.Sheet_Width:=value22.Sheet_Long-i10*value2.PNLA_Long;//二区宽
               tem_Sheet_Size_TwoPNL3.Sheet_Long:=value22.Sheet_Long;//三区长
               tem_Sheet_Size_TwoPNL3.Sheet_Width:=value22.Sheet_Width-j10*value2.PNLA_Width;//三区宽
               function_result001:=Calculate_TwoPNL_Sheet_2(value2,tepvalue2,tepvalue3,value22,tem_Sheet_Size_TwoPNL2,tem_Sheet_Size_TwoPNL3,i10,j10,2,2,1,value_pnla,2,2,iSheet);
               //对调三区长宽
              tem_Sheet_Size_TwoPNL2.Sheet_Long:=value22.Sheet_Long-i10*value2.PNLA_Long;//二区长
              tem_Sheet_Size_TwoPNL2.Sheet_Width:=j10*value2.PNLA_Width ;//二区宽
              tem_Sheet_Size_TwoPNL3.Sheet_Long:=value22.Sheet_Width-j10*value2.PNLA_Width;//三区长
              tem_Sheet_Size_TwoPNL3.Sheet_Width:= value22.Sheet_Long;//三区宽
              function_result001:=Calculate_TwoPNL_Sheet_2(value2,tepvalue2,tepvalue3,value22,tem_Sheet_Size_TwoPNL2,tem_Sheet_Size_TwoPNL3,i10,j10,2,1,2,value_pnla,2,2,iSheet);
              //对调二区,三区长宽
              tem_Sheet_Size_TwoPNL2.Sheet_Long:=j10*value2.PNLA_Width ;//二区长
              tem_Sheet_Size_TwoPNL2.Sheet_Width:=value22.Sheet_Long-i10*value2.PNLA_Long;//二区宽
              tem_Sheet_Size_TwoPNL3.Sheet_Long:=value22.Sheet_Width-j10*value2.PNLA_Width;//三区长
              tem_Sheet_Size_TwoPNL3.Sheet_Width:=value22.Sheet_Long;//三区宽
              function_result001:=Calculate_TwoPNL_Sheet_2(value2,tepvalue2,tepvalue3,value22,tem_Sheet_Size_TwoPNL2,tem_Sheet_Size_TwoPNL3,i10,j10,2,2,2,value_pnla,2,2,iSheet);
              //对调结束二区,三区PNLB与PNLA
//-----------------------------
       end;
    end;
    Result:=true;//函数返回假
  end;

end;

function TCutSheet2.Calculate_TwoPNL_Sheet_2(
  const value332,Two_Section_PNLvalue33,Three_Section_PNLvalue33: TResult_PNL2; //value32存放一区的PNLA信息,与PNLB信息,value3存放二,三区的PNLA与PNLB信息
  const  value333_sheet,Two_Section_value333, Three_Section_value333: TParam_Sheet2;  //value33_sheet大料长宽,Two_Section_value, Three_Section_value:二,三区长宽
  pnl_long_number3331, pnl_width_number3331,type333,Two_Section_Draw_value333,Three_Section_Draw_value333,value_pnla2,Two_value_pnla2,Three_value_pnla2: integer // pnl_long_number33一区PNLA长个数,pnl_width_number33一区PNLA宽个数,排法
  ;iSheet:integer=0): boolean;//调用函数时,value3值中和长宽要对调,Two_Section_value长宽要对调
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
    Section_PNLA_number:integer; //区PNLA个数
    Section_PNLB_number:integer; //区PNLB个数
  end;
var
    j21,i21,i31,j31,pnl_long_number333, pnl_width_number333,i221,t_n
    ,n201,n202,n21,n22,n231,n241,n232,n242,n233,n243
    ,n301,n302,n31,n32,n331,n341,n332,n342,n333,n343
    ,N231A1,N231A2,N232A1,N232A2,N233A1,N233A2,N234A1,N234A2
    ,N231B1,N231B2,N232B1,N232B2,N233B1,N233B2,N234B1,N234B2
    ,N221A1,N221A2,N222A1,N222A2,N223A1,N223A2,N224A1,N224A2
    ,N221B1,N221B2,N222B1,N222B2,N223B1,N223B2,N224B1,N224B2
    ,TEM_Falchion_Number1,TEM_Falchion_Number2,tv31,tv32:integer;
     rate20,rate21,rate22,rate23,max21,rate30,rate31,rate32,rate33,max31,
     tem_rate3,tem_rate2,rate_10
    ,rate200,rate201,rate202,rate203,rate204,rate205,rate206,rate207,rate208,rate209,rate210,rate211,rate212,rate213
    ,rate221,rate222,rate223,rate224,rate225,rate226,rate227,rate228,rate229,rate230,rate231,rate232,rate233
   :Double	;//用于计算总单元个数
  function_result,result_1:boolean;//调用函数是否成功
  array_type2,array_type3:integer;//用于记录是哪种排法,2,3代表23区
  tempnl_sheet22,tempnl_sheet33:tempnl_sheet333;
  t_c:currency;
  TemMaxPnlNumber2,k:integer;
begin
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
  if (Two_Section_value333.Sheet_Long>=Two_Section_PNLvalue33.PNLA_Long) and (Two_Section_value333.Sheet_Width >=Two_Section_PNLvalue33.PNLA_Width)   then
  begin  //1
     if Leave_Section_falchion_number1=2 then //只分两个区,排法只有AB的一边固定个数
     begin //2
       n21:=trunc(Two_Section_value333.Sheet_Long/Two_Section_PNLvalue33.PNLA_Long);//排A,最大长个数
       n22:=trunc(Two_Section_value333.Sheet_Width/Two_Section_PNLvalue33.PNLA_Width);//排A,最大宽个数

       n201:=n21; //PNLA最大个数为n201*n202
       n202:=n22;
       rate20:=n201*n202*Two_Section_PNLvalue33.PNLA_Unit_Long_Number*Two_Section_PNLvalue33.PNLA_Unit_Width_Number;
       if Tem_Calculate_Rate_Type1=1 then  //用单元计算
       begin
          rate20:=n201*n202*Two_Section_PNLvalue33.PNLA_Unit_Long_Number*Two_Section_PNLvalue33.PNLA_Unit_Width_Number*Two_Section_PNLvalue33.PNLA_Unit_Long*Two_Section_PNLvalue33.PNLA_Unit_Width;
          rate20:=rate20/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
       end;
       if Tem_Calculate_Rate_Type1=2 then //用PNL计算
       begin
         rate20:=n201*n202*Two_Section_PNLvalue33.PNLA_Long*Two_Section_PNLvalue33.PNLA_Width;//PNL长宽个数与长宽
         rate20:=rate20/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
       end;
       for j21:=1 to n22 do //宽从1到最大
       begin  //3
          //剩下部分排A,则方向可调换
           n231:=0;
           n241:=0;
           rate21:=0;
           if (Two_Section_value333.Sheet_Long>=Two_Section_PNLvalue33.PNLA_Width) and
              ((Two_Section_value333.Sheet_Width-j21*Two_Section_PNLvalue33.PNLA_Width)>=Two_Section_PNLvalue33.PNLA_Long) then//剩下部分是否可排A,
           begin
              n231:=trunc(Two_Section_value333.Sheet_Long/Two_Section_PNLvalue33.PNLA_Width);
              n241:=trunc((Two_Section_value333.Sheet_Width-j21*Two_Section_PNLvalue33.PNLA_Width)/Two_Section_PNLvalue33.PNLA_Long);
              rate21:=(n21*j21+n231*n241)*Two_Section_PNLvalue33.PNLA_Unit_Long_Number*Two_Section_PNLvalue33.PNLA_Unit_Width_Number;
              if Tem_Calculate_Rate_Type1=1 then  //用单元计算
              begin
                 rate21:=(n21*j21+n231*n241)*Two_Section_PNLvalue33.PNLA_Unit_Long_Number*Two_Section_PNLvalue33.PNLA_Unit_Width_Number*Two_Section_PNLvalue33.PNLA_Unit_Long*Two_Section_PNLvalue33.PNLA_Unit_Width;
                 rate21:=rate21/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
              end;

              if Tem_Calculate_Rate_Type1=2 then //用PNL计算
              begin
                 rate21:=(n21*j21+n231*n241)*Two_Section_PNLvalue33.PNLA_Width*Two_Section_PNLvalue33.PNLA_Long;
                 rate21:=rate21/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
               end;
           end;
          //剩下部分排B,有两种情况,即方向会调换
            n232:=0;
            n242:=0;
            rate22:=0;
           if (Two_Section_value333.Sheet_Long>=Two_Section_PNLvalue33.PNLb_Long) and    //长方向排PNLB长
              ((Two_Section_value333.Sheet_Width-j21*Two_Section_PNLvalue33.PNLA_Width)>=Two_Section_PNLvalue33.PNLb_Width) then//剩下部分是否可排b,
           begin
              n232:=trunc(Two_Section_value333.Sheet_Long/Two_Section_PNLvalue33.PNLb_Long);
              n242:=trunc((Two_Section_value333.Sheet_Width-j21*Two_Section_PNLvalue33.PNLA_Width)/Two_Section_PNLvalue33.PNLb_Width);
              rate22:=n21*j21*Two_Section_PNLvalue33.PNLA_Unit_Long_Number*Two_Section_PNLvalue33.PNLA_Unit_Width_Number+n232*n242*Two_Section_PNLvalue33.PNLb_Unit_Long_Number*Two_Section_PNLvalue33.PNLb_Unit_Width_Number;
              if Tem_Calculate_Rate_Type1=1 then  //用单元计算
              begin
                 rate22:=n21*j21*Two_Section_PNLvalue33.PNLA_Unit_Long_Number*Two_Section_PNLvalue33.PNLA_Unit_Width_Number*Two_Section_PNLvalue33.PNLA_Unit_Long*Two_Section_PNLvalue33.PNLA_Unit_Width
                        +n232*n242*Two_Section_PNLvalue33.PNLb_Unit_Long_Number*Two_Section_PNLvalue33.PNLb_Unit_Width_Number*Two_Section_PNLvalue33.PNLb_Unit_Long*Two_Section_PNLvalue33.PNLb_Unit_Width;
                 rate22:=rate22/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
              end;

              if Tem_Calculate_Rate_Type1=2 then //用PNL计算
              begin
                 rate22:=n21*j21*Two_Section_PNLvalue33.PNLA_Width*Two_Section_PNLvalue33.PNLA_Long
                         +n232*n242*Two_Section_PNLvalue33.PNLb_Width*Two_Section_PNLvalue33.PNLb_Long;
                 rate22:=rate22/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
              end;

           end;
           n233:=0;
           n243:=0;
           rate23:=0;
           if (Two_Section_value333.Sheet_Long>=Two_Section_PNLvalue33.PNLb_Width) and //长方向排PNLB宽
              ((Two_Section_value333.Sheet_Width-j21*Two_Section_PNLvalue33.PNLA_Width)>=Two_Section_PNLvalue33.PNLb_Long) then//剩下部分是否可排b,
           begin
              n233:=trunc(Two_Section_value333.Sheet_Long/Two_Section_PNLvalue33.PNLb_Width);//取整
              n243:=trunc((Two_Section_value333.Sheet_Width-j21*Two_Section_PNLvalue33.PNLA_Width)/Two_Section_PNLvalue33.PNLb_Long);
              rate23:=n21*j21*Two_Section_PNLvalue33.PNLA_Unit_Long_Number*Two_Section_PNLvalue33.PNLA_Unit_Width_Number+n233*n243*Two_Section_PNLvalue33.PNLb_Unit_Long_Number*Two_Section_PNLvalue33.PNLb_Unit_Width_Number;
              if Tem_Calculate_Rate_Type1=1 then  //用单元计算
              begin
                 rate23:=n21*j21*Two_Section_PNLvalue33.PNLA_Unit_Long_Number*Two_Section_PNLvalue33.PNLA_Unit_Width_Number*Two_Section_PNLvalue33.PNLA_Unit_Long*Two_Section_PNLvalue33.PNLA_Unit_Width
                       +n233*n243*Two_Section_PNLvalue33.PNLb_Unit_Long_Number*Two_Section_PNLvalue33.PNLb_Unit_Width_Number*Two_Section_PNLvalue33.PNLb_Unit_Long*Two_Section_PNLvalue33.PNLb_Unit_Width;
                 rate23:=rate23/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
              end;

              if Tem_Calculate_Rate_Type1=2 then //用PNL计算
              begin
                  rate23:=n21*j21*Two_Section_PNLvalue33.PNLA_Width*Two_Section_PNLvalue33.PNLA_Long
                          +n233*n243*Two_Section_PNLvalue33.PNLb_Width*Two_Section_PNLvalue33.PNLb_Long;
                  rate23:=rate23/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
              end;

           end;
           //从 rate1,rate2,rate3中找出最大的
           max21:=max(max(max(rate20,rate21),rate22),rate23);
           if (max21>=tem_rate2)  then
           begin //3
             tem_rate2:=max21;
             if rate23=max21 then
             begin //4
              array_type2:=3;   //排PNLA后还可排PNLB,宽放长边
              tempnl_sheet22.Section_LongA:=Two_Section_PNLvalue33.PNLA_Long;
              tempnl_sheet22.Section_WidthA:=Two_Section_PNLvalue33.PNLA_Width;
              tempnl_sheet22.Section_Long_NumberA:=n21;
              tempnl_sheet22.Section_Width_NumberA:=j21;
              tempnl_sheet22.Section_LongB:=Two_Section_PNLvalue33.PNLb_Width;
              tempnl_sheet22.Section_WidthB:=Two_Section_PNLvalue33.PNLb_Long;
              tempnl_sheet22.Section_Long_NumberB:=n233;
              tempnl_sheet22.Section_Width_NumberB:=n243;
              tempnl_sheet22.Section_Unit_Number:=n21*j21*Two_Section_PNLvalue33.PNLA_Unit_Long_Number*Two_Section_PNLvalue33.PNLA_Unit_Width_Number+n233*n243*Two_Section_PNLvalue33.PNLb_Unit_Long_Number*Two_Section_PNLvalue33.PNLb_Unit_Width_Number;

               tv31:=n21*j21;
               tv32:=n233*n243;
               tempnl_sheet22.Section_PNLA_number:=0;
               tempnl_sheet22.Section_PNLB_number:=0;
               function_result:=Change_pnla_pnlb_number1(value_pnla2,TWO_value_pnla2,tv31,tv32,tempnl_sheet22.Section_PNLA_number,tempnl_sheet22.Section_PNLB_number);

             end;
             if rate22=max21 then
             begin
              array_type2:=2; //排PNLA后还可排PNLB,长放长边
              tempnl_sheet22.Section_LongA:=Two_Section_PNLvalue33.PNLA_Long;
              tempnl_sheet22.Section_WidthA:=Two_Section_PNLvalue33.PNLA_Width;
              tempnl_sheet22.Section_Long_NumberA:=n21;
              tempnl_sheet22.Section_Width_NumberA:=j21;
              tempnl_sheet22.Section_LongB:=Two_Section_PNLvalue33.PNLb_Long;
              tempnl_sheet22.Section_WidthB:=Two_Section_PNLvalue33.PNLb_Width;
              tempnl_sheet22.Section_Long_NumberB:=n232;
              tempnl_sheet22.Section_Width_NumberB:=n242;
              tempnl_sheet22.Section_Unit_Number:=n21*j21*Two_Section_PNLvalue33.PNLA_Unit_Long_Number*Two_Section_PNLvalue33.PNLA_Unit_Width_Number+n232*n242*Two_Section_PNLvalue33.PNLb_Unit_Long_Number*Two_Section_PNLvalue33.PNLb_Unit_Width_Number;
              tv31:=n21*j21;
              tv32:=n232*n242;
              tempnl_sheet22.Section_PNLA_number:=0;
              tempnl_sheet22.Section_PNLB_number:=0;
              function_result:=Change_pnla_pnlb_number1(value_pnla2,TWO_value_pnla2,tv31,tv32,tempnl_sheet22.Section_PNLA_number,tempnl_sheet22.Section_PNLB_number);

             end;
             if rate21=max21 then
             begin
              array_type2:=1;  //排PNLA后还可排PNLA,宽放长边
              tempnl_sheet22.Section_LongA:=Two_Section_PNLvalue33.PNLA_Long;
              tempnl_sheet22.Section_WidthA:=Two_Section_PNLvalue33.PNLA_Width;
              tempnl_sheet22.Section_Long_NumberA:=n21;
              tempnl_sheet22.Section_Width_NumberA:=j21;
              tempnl_sheet22.Section_LongB:=Two_Section_PNLvalue33.PNLA_Width;
              tempnl_sheet22.Section_WidthB:=Two_Section_PNLvalue33.PNLA_Long;
              tempnl_sheet22.Section_Long_NumberB:=n231;
              tempnl_sheet22.Section_Width_NumberB:=n241;
              tempnl_sheet22.Section_Unit_Number:=(n21*j21+n231*n241)*Two_Section_PNLvalue33.PNLA_Unit_Long_Number*Two_Section_PNLvalue33.PNLA_Unit_Width_Number;
              tv31:=n21*j21;
               tv32:=n231*n241;
               tempnl_sheet22.Section_PNLA_number:=0;
               tempnl_sheet22.Section_PNLB_number:=0;
               function_result:=Change_pnla_pnlb_number1(value_pnla2,TWO_value_pnla2,tv31,tv32,tempnl_sheet22.Section_PNLA_number,tempnl_sheet22.Section_PNLa_number);

             end;
             if rate20=max21 then
             begin
              array_type2:=0;  //只排PNLA
              tempnl_sheet22.Section_LongA:=Two_Section_PNLvalue33.PNLA_Long;
              tempnl_sheet22.Section_WidthA:=Two_Section_PNLvalue33.PNLA_Width;
              tempnl_sheet22.Section_Long_NumberA:=n201;
              tempnl_sheet22.Section_Width_NumberA:=n202;
              tempnl_sheet22.Section_LongB:=0;
              tempnl_sheet22.Section_WidthB:=0;
              tempnl_sheet22.Section_Long_NumberB:=0;
              tempnl_sheet22.Section_Width_NumberB:=0;
              tempnl_sheet22.Section_Unit_Number:=n201*n202*Two_Section_PNLvalue33.PNLA_Unit_Long_Number*Two_Section_PNLvalue33.PNLA_Unit_Width_Number ;
              tv31:=n201*n202;
              tv32:=0;
              tempnl_sheet22.Section_PNLA_number:=0;
              tempnl_sheet22.Section_PNLB_number:=0;
              function_result:=Change_pnla_pnlb_number1(value_pnla2,TWO_value_pnla2,tv31,tv32,tempnl_sheet22.Section_PNLA_number,tempnl_sheet22.Section_PNLB_number);

             end;
           end; //4
       end; //3
     end;  //2
//3333333
   {}
     if Leave_Section_falchion_number1=3 then  //分三个区
     begin
       n21:=trunc(Two_Section_value333.Sheet_Long/Two_Section_PNLvalue33.PNLA_Long);//排A,最大长个数
       n22:=trunc(Two_Section_value333.Sheet_Width/Two_Section_PNLvalue33.PNLA_Width);//排A,最大宽个数

       n201:=n21; //PNLA最大个数为n201*n202
       n202:=n22;
       rate200:=n201*n202*Two_Section_PNLvalue33.PNLA_Unit_Long_Number*Two_Section_PNLvalue33.PNLA_Unit_Width_Number;
       if Tem_Calculate_Rate_Type1=1 then  //用单元计算
       begin
          rate200:=n201*n202*Two_Section_PNLvalue33.PNLA_Unit_Long_Number
                   *Two_Section_PNLvalue33.PNLA_Unit_Width_Number
                   *Two_Section_PNLvalue33.PNLA_Unit_Long
                   *Two_Section_PNLvalue33.PNLA_Unit_Width;
          rate200:=rate200/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
       end;
       if Tem_Calculate_Rate_Type1=2 then //用PNL计算
       begin
         rate200:=n201*N202*Two_Section_PNLvalue33.PNLA_Long*Two_Section_PNLvalue33.PNLA_Width;//PNL长宽个数与长宽
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

             //小二区PNLA宽排长边
             n221A1:=0;
             n222A1:=0;
             if (Two_Section_value333.Sheet_long-i21*Two_Section_PNLvalue33.PNLA_Long>=Two_Section_PNLvalue33.PNLA_Width)
               and (Two_Section_value333.Sheet_Width>=Two_Section_PNLvalue33.PNLA_Long) then
               begin
                 n221A1:=trunc((Two_Section_value333.Sheet_long-i21*Two_Section_PNLvalue33.PNLA_Long)/Two_Section_PNLvalue33.PNLA_Width);
                 n222A1:=trunc(Two_Section_value333.Sheet_Width/Two_Section_PNLvalue33.PNLA_Long);
              end;
              //小三区PNLA宽排长边
               n231A1:=0;
               n232A1:=0;
              if (i21*Two_Section_PNLvalue33.PNLA_Long>=Two_Section_PNLvalue33.PNLA_Width)
               and ((Two_Section_value333.Sheet_Width-j21*Two_Section_PNLvalue33.PNLA_Width)>=Two_Section_PNLvalue33.PNLA_Long) then
               begin
                 n231A1:=trunc(i21*Two_Section_PNLvalue33.PNLA_Long/Two_Section_PNLvalue33.PNLA_Width);
                 n232A1:=trunc((Two_Section_value333.Sheet_Width-j21*Two_Section_PNLvalue33.PNLA_Width)/Two_Section_PNLvalue33.PNLA_Long);
              end;
              //小三区PNLA宽排长边
              n233A1:=0;
              n234A1:=0;
              if (i21*Two_Section_PNLvalue33.PNLA_Long>=Two_Section_PNLvalue33.PNLA_Long)
               and ((Two_Section_value333.Sheet_Width-j21*Two_Section_PNLvalue33.PNLA_Width)>=Two_Section_PNLvalue33.PNLA_Width) then
               begin
                 n233A1:=trunc(i21*Two_Section_PNLvalue33.PNLA_Long/Two_Section_PNLvalue33.PNLA_Long);
                 n234A1:=trunc((Two_Section_value333.Sheet_Width-j21*Two_Section_PNLvalue33.PNLA_Width)/Two_Section_PNLvalue33.PNLA_Width);
              end;
              //小二区PNLA长排长边
              n223A1:=0;
              n224A1:=0;
              if (Two_Section_value333.Sheet_long-i21*Two_Section_PNLvalue33.PNLA_Long>=Two_Section_PNLvalue33.PNLA_Long)
               and (Two_Section_value333.Sheet_Width>=Two_Section_PNLvalue33.PNLA_Width) then
               begin
                 n223A1:=trunc((Two_Section_value333.Sheet_long-i21*Two_Section_PNLvalue33.PNLA_Long)/Two_Section_PNLvalue33.PNLA_Long);
                 n224A1:=trunc(Two_Section_value333.Sheet_Width/Two_Section_PNLvalue33.PNLA_Width);
              end;


              //小二区PNLB宽排长边
              n221B1:=0;
              n222B1:=0;
              if (Two_Section_value333.Sheet_long-i21*Two_Section_PNLvalue33.PNLA_Long>=Two_Section_PNLvalue33.PNLB_Width)
               and (Two_Section_value333.Sheet_Width>=Two_Section_PNLvalue33.PNLB_Long) then
               begin
                 n221B1:=trunc((Two_Section_value333.Sheet_long-i21*Two_Section_PNLvalue33.PNLA_Long)/Two_Section_PNLvalue33.PNLB_Width);
                 n222B1:=trunc(Two_Section_value333.Sheet_Width/Two_Section_PNLvalue33.PNLB_Long);
              end;
              //小三区PNLB宽排长边
              n231B1:=0;
              n232B1:=0;
              if (i21*Two_Section_PNLvalue33.PNLA_Long>=Two_Section_PNLvalue33.PNLB_Width)
               and ((Two_Section_value333.Sheet_Width-j21*Two_Section_PNLvalue33.PNLA_Width)>=Two_Section_PNLvalue33.PNLB_Long) then
               begin
                 n231B1:=trunc(i21*Two_Section_PNLvalue33.PNLA_Long/Two_Section_PNLvalue33.PNLB_Width);
                 n232B1:=trunc((Two_Section_value333.Sheet_Width-j21*Two_Section_PNLvalue33.PNLA_Width)/Two_Section_PNLvalue33.PNLB_Long);
              end;
              //小三区PNLB宽排长边
              n233B1:=0;
              n234B1:=0;
              if (i21*Two_Section_PNLvalue33.PNLA_Long>=Two_Section_PNLvalue33.PNLB_Long)
               and ((Two_Section_value333.Sheet_Width-j21*Two_Section_PNLvalue33.PNLA_Width)>=Two_Section_PNLvalue33.PNLB_Width) then
               begin
                 n233B1:=trunc(i21*Two_Section_PNLvalue33.PNLA_Long/Two_Section_PNLvalue33.PNLB_Long);
                 n234B1:=trunc((Two_Section_value333.Sheet_Width-j21*Two_Section_PNLvalue33.PNLA_Width)/Two_Section_PNLvalue33.PNLB_Width);
              end;
              //小二区PNLB长排长边
              n223B1:=0;
              n224B1:=0;
              if (Two_Section_value333.Sheet_long-i21*Two_Section_PNLvalue33.PNLA_Long>=Two_Section_PNLvalue33.PNLB_Long)
               and (Two_Section_value333.Sheet_Width>=Two_Section_PNLvalue33.PNLB_Width) then
               begin
                 n223B1:=trunc((Two_Section_value333.Sheet_long-i21*Two_Section_PNLvalue33.PNLA_Long)/Two_Section_PNLvalue33.PNLB_Long);
                 n224B1:=trunc(Two_Section_value333.Sheet_Width/Two_Section_PNLvalue33.PNLB_Width);
              end;
              //小二区长排PNLA长,小三区可排PNLA,则只一种

               rate201:=(n221A1*N222A1+N233A1*N234a1)*Two_Section_PNLvalue33.PNLA_Unit_Long_Number*Two_Section_PNLvalue33.PNLA_Unit_Width_Number;
               if Tem_Calculate_Rate_Type1=1 then  //用单元计算
               begin
                  rate201:=(n221A1*N222A1+N233A1*N234a1)*Two_Section_PNLvalue33.PNLA_Unit_Long_Number*Two_Section_PNLvalue33.PNLA_Unit_Width_Number
                         *Two_Section_PNLvalue33.PNLA_Unit_Long*Two_Section_PNLvalue33.PNLA_Unit_Width;
                  rate201:=rate201/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
               end;
               if Tem_Calculate_Rate_Type1=2 then //用PNL计算
               begin
                  rate201:=(n221A1*N222A1+N233A1*N234a1)
                         *Two_Section_PNLvalue33.PNLA_Long *Two_Section_PNLvalue33.PNLA_Width;
                  rate201:=rate201/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
               END;
              //小二区长排PNLA宽,小三区可排PNLA,则只一种
              rate202:=(n223A1*N224A1+N231A1*N232a1)*Two_Section_PNLvalue33.PNLA_Unit_Long_Number*Two_Section_PNLvalue33.PNLA_Unit_Width_Number;
              if Tem_Calculate_Rate_Type1=1 then  //用单元计算
               begin
                  rate202:=(n223A1*N224A1+N231A1*N232a1)*Two_Section_PNLvalue33.PNLA_Unit_Long_Number*Two_Section_PNLvalue33.PNLA_Unit_Width_Number
                         *Two_Section_PNLvalue33.PNLA_Unit_Long*Two_Section_PNLvalue33.PNLA_Unit_Width;
                  rate202:=rate202/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
               end;
               if Tem_Calculate_Rate_Type1=2 then //用PNL计算
               begin
                  rate202:=(n223A1*N224A1+N231A1*N232a1)
                         *Two_Section_PNLvalue33.PNLA_Long *Two_Section_PNLvalue33.PNLA_Width;
                  rate202:=rate203/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
               END;
              rate203:=(n223A1*N224A1+N233A1*N234a1)*Two_Section_PNLvalue33.PNLA_Unit_Long_Number*Two_Section_PNLvalue33.PNLA_Unit_Width_Number;
              if Tem_Calculate_Rate_Type1=1 then  //用单元计算
               begin
                  rate203:=(n223A1*N224A1+N233A1*N234a1)*Two_Section_PNLvalue33.PNLA_Unit_Long_Number*Two_Section_PNLvalue33.PNLA_Unit_Width_Number
                         *Two_Section_PNLvalue33.PNLA_Unit_Long*Two_Section_PNLvalue33.PNLA_Unit_Width;
                  rate203:=rate203/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
               end;
               if Tem_Calculate_Rate_Type1=2 then //用PNL计算
               begin
                  rate203:=(n223A1*N224A1+N233A1*N234a1)
                         *Two_Section_PNLvalue33.PNLA_Long *Two_Section_PNLvalue33.PNLA_Width;
                  rate203:=rate203/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
               END;
               //小二区长排PNLA长,小三区可排PNLb,则只两种
              rate204:=n221A1*N222A1*Two_Section_PNLvalue33.PNLA_Unit_Long_Number*Two_Section_PNLvalue33.PNLA_Unit_Width_Number
                       +N231B1*N232B1*Two_Section_PNLvalue33.PNLB_Unit_Long_Number*Two_Section_PNLvalue33.PNLB_Unit_Width_Number;
              if Tem_Calculate_Rate_Type1=1 then  //用单元计算
               begin
                  rate204:=n221A1*N222A1*Two_Section_PNLvalue33.PNLA_Unit_Long_Number*Two_Section_PNLvalue33.PNLA_Unit_Width_Number
                                          *Two_Section_PNLvalue33.PNLA_Unit_Long*Two_Section_PNLvalue33.PNLA_Unit_Width
                         +N231B1*N232B1*Two_Section_PNLvalue33.PNLb_Unit_Long_Number*Two_Section_PNLvalue33.PNLb_Unit_Width_Number
                                        *Two_Section_PNLvalue33.PNLb_Unit_Long*Two_Section_PNLvalue33.PNLb_Unit_Width;
                  rate204:=rate204/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
               end;
               if Tem_Calculate_Rate_Type1=2 then //用PNL计算
               begin
                  rate204:=n221A1*N222A1*Two_Section_PNLvalue33.PNLA_Long *Two_Section_PNLvalue33.PNLA_Width
                           +N231B1*N232B1*Two_Section_PNLvalue33.PNLb_Long *Two_Section_PNLvalue33.PNLb_Width;
                  rate204:=rate204/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
               END;

              rate205:=n221A1*N222A1*Two_Section_PNLvalue33.PNLA_Unit_Long_Number*Two_Section_PNLvalue33.PNLA_Unit_Width_Number
                      +N233B1*N234B1*Two_Section_PNLvalue33.PNLB_Unit_Long_Number*Two_Section_PNLvalue33.PNLB_Unit_Width_Number;

               if Tem_Calculate_Rate_Type1=1 then  //用单元计算
               begin
                  rate205:=n221A1*N222A1*Two_Section_PNLvalue33.PNLA_Unit_Long_Number*Two_Section_PNLvalue33.PNLA_Unit_Width_Number
                                          *Two_Section_PNLvalue33.PNLA_Unit_Long*Two_Section_PNLvalue33.PNLA_Unit_Width
                         +N233B1*N234B1*Two_Section_PNLvalue33.PNLb_Unit_Long_Number*Two_Section_PNLvalue33.PNLb_Unit_Width_Number
                                        *Two_Section_PNLvalue33.PNLb_Unit_Long*Two_Section_PNLvalue33.PNLb_Unit_Width;
                  rate205:=rate205/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
               end;
               if Tem_Calculate_Rate_Type1=2 then //用PNL计算
               begin
                  rate205:=n221A1*N222A1*Two_Section_PNLvalue33.PNLA_Long *Two_Section_PNLvalue33.PNLA_Width
                           +N233B1*N234B1*Two_Section_PNLvalue33.PNLb_Long *Two_Section_PNLvalue33.PNLb_Width;
                  rate205:=rate205/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
               END;
              //小二区长排PNLB长,小三区可排PNLA,则只两种
              rate206:=n221B1*N222B1*Two_Section_PNLvalue33.PNLB_Unit_Long_Number*Two_Section_PNLvalue33.PNLB_Unit_Width_NumbeR
                      +N231A1*N232A1*Two_Section_PNLvalue33.PNLA_Unit_Long_Number*Two_Section_PNLvalue33.PNLA_Unit_Width_Number;
               if Tem_Calculate_Rate_Type1=1 then  //用单元计算
               begin
                  rate206:=N231A1*N232A1*Two_Section_PNLvalue33.PNLA_Unit_Long_Number*Two_Section_PNLvalue33.PNLA_Unit_Width_Number
                                          *Two_Section_PNLvalue33.PNLA_Unit_Long*Two_Section_PNLvalue33.PNLA_Unit_Width
                         +n221B1*N222B1*Two_Section_PNLvalue33.PNLb_Unit_Long_Number*Two_Section_PNLvalue33.PNLb_Unit_Width_Number
                                        *Two_Section_PNLvalue33.PNLb_Unit_Long*Two_Section_PNLvalue33.PNLb_Unit_Width;
                  rate206:=rate206/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
               end;
               if Tem_Calculate_Rate_Type1=2 then //用PNL计算
               begin
                  rate206:=N231A1*N232A1*Two_Section_PNLvalue33.PNLA_Long *Two_Section_PNLvalue33.PNLA_Width
                           +n221B1*N222B1*Two_Section_PNLvalue33.PNLb_Long *Two_Section_PNLvalue33.PNLb_Width;
                  rate206:=rate206/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
               END;
              rate207:=n221B1*N222B1*Two_Section_PNLvalue33.PNLB_Unit_Long_Number*Two_Section_PNLvalue33.PNLB_Unit_Width_NumbeR
                       +N233A1*N234A1*Two_Section_PNLvalue33.PNLA_Unit_Long_Number*Two_Section_PNLvalue33.PNLA_Unit_Width_NumbeR;
              if Tem_Calculate_Rate_Type1=1 then  //用单元计算
               begin
                  rate207:=N233A1*N234A1*Two_Section_PNLvalue33.PNLA_Unit_Long_Number*Two_Section_PNLvalue33.PNLA_Unit_Width_Number
                                          *Two_Section_PNLvalue33.PNLA_Unit_Long*Two_Section_PNLvalue33.PNLA_Unit_Width
                         +n221B1*N222B1*Two_Section_PNLvalue33.PNLb_Unit_Long_Number*Two_Section_PNLvalue33.PNLb_Unit_Width_Number
                                        *Two_Section_PNLvalue33.PNLb_Unit_Long*Two_Section_PNLvalue33.PNLb_Unit_Width;
                  rate207:=rate207/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
               end;
               if Tem_Calculate_Rate_Type1=2 then //用PNL计算
               begin
                  rate207:=N233A1*N234A1*Two_Section_PNLvalue33.PNLA_Long *Two_Section_PNLvalue33.PNLA_Width
                           +n221B1*N222B1*Two_Section_PNLvalue33.PNLb_Long *Two_Section_PNLvalue33.PNLb_Width;
                  rate207:=rate207/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
               END;
              //小二区长排PNLB宽,小三区可排PNLA,则只两种
              rate208:=n223B1*N224B1*Two_Section_PNLvalue33.PNLB_Unit_Long_Number*Two_Section_PNLvalue33.PNLB_Unit_Width_Number
                       +N231A1*N232A1*Two_Section_PNLvalue33.PNLA_Unit_Long_Number*Two_Section_PNLvalue33.PNLA_Unit_Width_NumbeR;

              if Tem_Calculate_Rate_Type1=1 then  //用单元计算
               begin
                  rate208:=N231A1*N232A1*Two_Section_PNLvalue33.PNLA_Unit_Long_Number*Two_Section_PNLvalue33.PNLA_Unit_Width_Number
                                          *Two_Section_PNLvalue33.PNLA_Unit_Long*Two_Section_PNLvalue33.PNLA_Unit_Width
                         +n223B1*N224B1*Two_Section_PNLvalue33.PNLb_Unit_Long_Number*Two_Section_PNLvalue33.PNLb_Unit_Width_Number
                                        *Two_Section_PNLvalue33.PNLb_Unit_Long*Two_Section_PNLvalue33.PNLb_Unit_Width;
                  rate208:=rate208/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
               end;
               if Tem_Calculate_Rate_Type1=2 then //用PNL计算
               begin
                  rate208:=N231A1*N232A1*Two_Section_PNLvalue33.PNLA_Long *Two_Section_PNLvalue33.PNLA_Width
                           +n223B1*N224B1*Two_Section_PNLvalue33.PNLb_Long *Two_Section_PNLvalue33.PNLb_Width;
                  rate208:=rate208/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
               END;


              rate209:=n223B1*N224B1*Two_Section_PNLvalue33.PNLB_Unit_Long_Number*Two_Section_PNLvalue33.PNLB_Unit_Width_Number
                       +N233A1*N234A1*Two_Section_PNLvalue33.PNLA_Unit_Long_Number*Two_Section_PNLvalue33.PNLA_Unit_Width_NumbeR;

              if Tem_Calculate_Rate_Type1=1 then  //用单元计算
               begin
                  rate209:=N233A1*N234A1*Two_Section_PNLvalue33.PNLA_Unit_Long_Number*Two_Section_PNLvalue33.PNLA_Unit_Width_Number
                                          *Two_Section_PNLvalue33.PNLA_Unit_Long*Two_Section_PNLvalue33.PNLA_Unit_Width
                         +n223B1*N224B1*Two_Section_PNLvalue33.PNLb_Unit_Long_Number*Two_Section_PNLvalue33.PNLb_Unit_Width_Number
                                        *Two_Section_PNLvalue33.PNLb_Unit_Long*Two_Section_PNLvalue33.PNLb_Unit_Width;
                  rate209:=rate209/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
               end;
               if Tem_Calculate_Rate_Type1=2 then //用PNL计算
               begin
                  rate209:=N233A1*N234A1*Two_Section_PNLvalue33.PNLA_Long *Two_Section_PNLvalue33.PNLA_Width
                           +n223B1*N224B1*Two_Section_PNLvalue33.PNLb_Long *Two_Section_PNLvalue33.PNLb_Width;
                  rate209:=rate209/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
               END;
              //小二区长排PNLB长,小三区可排PNLB,则只两种
              rate210:=(n221B1*N222B1+N231B1*N232B1)*Two_Section_PNLvalue33.PNLB_Unit_Long_Number*Two_Section_PNLvalue33.PNLB_Unit_Width_Number;
              if Tem_Calculate_Rate_Type1=1 then  //用单元计算
               begin
                  rate210:=(n221B1*N222B1+N231B1*N232B1)*Two_Section_PNLvalue33.PNLb_Unit_Long_Number*Two_Section_PNLvalue33.PNLb_Unit_Width_Number
                         *Two_Section_PNLvalue33.PNLb_Unit_Long*Two_Section_PNLvalue33.PNLb_Unit_Width;
                  rate210:=rate210/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
               end;
               if Tem_Calculate_Rate_Type1=2 then //用PNL计算
               begin
                  rate210:=(n221B1*N222B1+N231B1*N232B1)
                         *Two_Section_PNLvalue33.PNLb_Long *Two_Section_PNLvalue33.PNLb_Width;
                  rate210:=rate210/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
               END;
              rate211:=(n221B1*N222B1+N233B1*N234B1)*Two_Section_PNLvalue33.PNLB_Unit_Long_Number*Two_Section_PNLvalue33.PNLB_Unit_Width_Number;
              if Tem_Calculate_Rate_Type1=1 then  //用单元计算
               begin
                  rate211:=(n221B1*N222B1+N233B1*N234B1)*Two_Section_PNLvalue33.PNLb_Unit_Long_Number*Two_Section_PNLvalue33.PNLb_Unit_Width_Number
                         *Two_Section_PNLvalue33.PNLb_Unit_Long*Two_Section_PNLvalue33.PNLb_Unit_Width;
                  rate211:=rate211/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
               end;
               if Tem_Calculate_Rate_Type1=2 then //用PNL计算
               begin
                  rate211:=(n221B1*N222B1+N233B1*N234B1)
                         *Two_Section_PNLvalue33.PNLb_Long *Two_Section_PNLvalue33.PNLb_Width;
                  rate211:=rate211/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
               END;
              //小二区长排PNLB宽,小三区可排PNLB,则只两种
              rate212:=(n223B1*N224B1+N231B1*N232B1)*Two_Section_PNLvalue33.PNLB_Unit_Long_Number*Two_Section_PNLvalue33.PNLB_Unit_Width_Number;
              if Tem_Calculate_Rate_Type1=1 then  //用单元计算
               begin
                  rate212:=(n223B1*N224B1+N231B1*N232B1)*Two_Section_PNLvalue33.PNLb_Unit_Long_Number*Two_Section_PNLvalue33.PNLb_Unit_Width_Number
                         *Two_Section_PNLvalue33.PNLb_Unit_Long*Two_Section_PNLvalue33.PNLb_Unit_Width;
                  rate212:=rate212/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
               end;
               if Tem_Calculate_Rate_Type1=2 then //用PNL计算
               begin
                  rate212:=(n223B1*N224B1+N231B1*N232B1)
                         *Two_Section_PNLvalue33.PNLb_Long *Two_Section_PNLvalue33.PNLb_Width;
                  rate212:=rate212/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
               END;

              rate213:=(n223B1*N224B1+N233B1*N234B1)*Two_Section_PNLvalue33.PNLB_Unit_Long_Number*Two_Section_PNLvalue33.PNLB_Unit_Width_Number;

              if Tem_Calculate_Rate_Type1=1 then  //用单元计算
               begin
                  rate213:=(n223B1*N224B1+N233B1*N234B1)*Two_Section_PNLvalue33.PNLb_Unit_Long_Number*Two_Section_PNLvalue33.PNLb_Unit_Width_Number
                         *Two_Section_PNLvalue33.PNLb_Unit_Long*Two_Section_PNLvalue33.PNLb_Unit_Width;
                  rate213:=rate213/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
               end;
               if Tem_Calculate_Rate_Type1=2 then //用PNL计算
               begin
                  rate213:=(n223B1*N224B1+N233B1*N234B1)
                         *Two_Section_PNLvalue33.PNLb_Long *Two_Section_PNLvalue33.PNLb_Width;
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

           //小二区PNLA宽排长边   Two_Section_value333.Sheet_Width
             n221A2:=0;
             n222A2:=0;
             if (Two_Section_value333.Sheet_long-i21*Two_Section_PNLvalue33.PNLA_Long>=Two_Section_PNLvalue33.PNLA_Width)
               and (J21*Two_Section_PNLvalue33.PNLA_Width>=Two_Section_PNLvalue33.PNLA_Long) then
               begin
                 n221A2:=trunc((Two_Section_value333.Sheet_long-i21*Two_Section_PNLvalue33.PNLA_Long)/Two_Section_PNLvalue33.PNLA_Width);
                 n222A2:=trunc(J21*Two_Section_PNLvalue33.PNLA_Width/Two_Section_PNLvalue33.PNLA_Long);
              end;
              //小三区PNLA宽排长边  i21*Two_Section_PNLvalue33.PNLA_Long
              n231A2:=0;
              n232A2:=0;
              if (Two_Section_value333.Sheet_long>=Two_Section_PNLvalue33.PNLA_Width)
               and ((Two_Section_value333.Sheet_Width-j21*Two_Section_PNLvalue33.PNLA_Width)>=Two_Section_PNLvalue33.PNLA_Long) then
               begin
                 n231A2:=trunc(Two_Section_value333.Sheet_long/Two_Section_PNLvalue33.PNLA_Width);
                 n232A2:=trunc((Two_Section_value333.Sheet_Width-j21*Two_Section_PNLvalue33.PNLA_Width)/Two_Section_PNLvalue33.PNLA_Long);
              end;
              //小三区PNLA宽排长边
              n233A2:=0;
              n234A2:=0;
              if (Two_Section_value333.Sheet_long>=Two_Section_PNLvalue33.PNLA_Long)
               and ((Two_Section_value333.Sheet_Width-j21*Two_Section_PNLvalue33.PNLA_Width)>=Two_Section_PNLvalue33.PNLA_Width) then
               begin
                 n233A2:=trunc(Two_Section_value333.Sheet_long/Two_Section_PNLvalue33.PNLA_Long);
                 n234A2:=trunc((Two_Section_value333.Sheet_Width-j21*Two_Section_PNLvalue33.PNLA_Width)/Two_Section_PNLvalue33.PNLA_Width);
              end;
              //小二区PNLA长排长边
              n223A2:=0;
              n224A2:=0;
              if (Two_Section_value333.Sheet_long-i21*Two_Section_PNLvalue33.PNLA_Long>=Two_Section_PNLvalue33.PNLA_Long)
               and (J21*Two_Section_PNLvalue33.PNLA_Width>=Two_Section_PNLvalue33.PNLA_Width) then
               begin
                 n223A2:=trunc((Two_Section_value333.Sheet_long-i21*Two_Section_PNLvalue33.PNLA_Long)/Two_Section_PNLvalue33.PNLA_Long);
                 n224A2:=trunc(J21*Two_Section_PNLvalue33.PNLA_Width/Two_Section_PNLvalue33.PNLA_Width);
              end;


              //小二区PNLB宽排长边
              n221B2:=0;
              n222B2:=0;
             if (Two_Section_value333.Sheet_long-i21*Two_Section_PNLvalue33.PNLA_Long>=Two_Section_PNLvalue33.PNLB_Width)
               and (J21*Two_Section_PNLvalue33.PNLA_Width>=Two_Section_PNLvalue33.PNLB_Long) then
               begin
                 n221B2:=trunc((Two_Section_value333.Sheet_long-i21*Two_Section_PNLvalue33.PNLA_Long)/Two_Section_PNLvalue33.PNLB_Width);
                 n222B2:=trunc(J21*Two_Section_PNLvalue33.PNLA_Width/Two_Section_PNLvalue33.PNLB_Long);
              end;
              //小三区PNLB宽排长边
              n231B2:=0;
              n232B2:=0;
              if (Two_Section_value333.Sheet_long>=Two_Section_PNLvalue33.PNLB_Width)
               and ((Two_Section_value333.Sheet_Width-j21*Two_Section_PNLvalue33.PNLA_Width)>=Two_Section_PNLvalue33.PNLB_Long) then
               begin
                 n231B2:=trunc(Two_Section_value333.Sheet_long/Two_Section_PNLvalue33.PNLB_Width);
                 n232B2:=trunc((Two_Section_value333.Sheet_Width-j21*Two_Section_PNLvalue33.PNLA_Width)/Two_Section_PNLvalue33.PNLB_Long);
              end;
              //小三区PNLB宽排长边
              n233B2:=0;
              n234B2:=0;
              if (Two_Section_value333.Sheet_long>=Two_Section_PNLvalue33.PNLB_Long)
               and ((Two_Section_value333.Sheet_Width-j21*Two_Section_PNLvalue33.PNLA_Width)>=Two_Section_PNLvalue33.PNLB_Width) then
               begin
                 n233B2:=trunc(Two_Section_value333.Sheet_long/Two_Section_PNLvalue33.PNLB_Long);
                 n234B2:=trunc((Two_Section_value333.Sheet_Width-j21*Two_Section_PNLvalue33.PNLA_Width)/Two_Section_PNLvalue33.PNLB_Width);
              end;
              //小二区PNLB长排长边
              n223B2:=0;
              n224B2:=0;
              if (Two_Section_value333.Sheet_long-i21*Two_Section_PNLvalue33.PNLA_Long>=Two_Section_PNLvalue33.PNLB_Long)
               and (J21*Two_Section_PNLvalue33.PNLA_Width>=Two_Section_PNLvalue33.PNLB_Width) then
               begin
                 n223B2:=trunc((Two_Section_value333.Sheet_long-i21*Two_Section_PNLvalue33.PNLA_Long)/Two_Section_PNLvalue33.PNLB_Long);
                 n224B2:=trunc(J21*Two_Section_PNLvalue33.PNLA_Width/Two_Section_PNLvalue33.PNLB_Width);
              end;
              //小二区长排PNLA长,小三区可排PNLA,则只一种

              rate221:=(n221A2*N222A2+N233A2*N234a2)*Two_Section_PNLvalue33.PNLA_Unit_Long_Number*Two_Section_PNLvalue33.PNLA_Unit_Width_Number;
              if Tem_Calculate_Rate_Type1=1 then  //用单元计算
               begin
                  rate221:=(n221A2*N222A2+N233A2*N234a2)*Two_Section_PNLvalue33.PNLA_Unit_Long_Number*Two_Section_PNLvalue33.PNLA_Unit_Width_Number
                                          *Two_Section_PNLvalue33.PNLA_Unit_Long*Two_Section_PNLvalue33.PNLA_Unit_Width ;
                  rate221:=rate221/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
               end;
               if Tem_Calculate_Rate_Type1=2 then //用PNL计算
               begin
                  rate221:=(n221A2*N222A2+N233A2*N234a2)*Two_Section_PNLvalue33.PNLA_Long *Two_Section_PNLvalue33.PNLA_Width;
                  rate221:=rate221/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
               END;
                //小二区长排PNLA宽,小三区可排PNLA,则有两种
              rate222:=(n223A2*N224A2+N231A2*N232a2)*Two_Section_PNLvalue33.PNLA_Unit_Long_Number*Two_Section_PNLvalue33.PNLA_Unit_Width_Number;
              if Tem_Calculate_Rate_Type1=1 then  //用单元计算
               begin
                  rate222:=(n223A2*N224A2+N231A2*N232a2)*Two_Section_PNLvalue33.PNLA_Unit_Long_Number*Two_Section_PNLvalue33.PNLA_Unit_Width_Number
                                          *Two_Section_PNLvalue33.PNLA_Unit_Long*Two_Section_PNLvalue33.PNLA_Unit_Width;
                  rate222:=rate222/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
               end;
               if Tem_Calculate_Rate_Type1=2 then //用PNL计算
               begin
                  rate222:=(n223A2*N224A2+N231A2*N232a2)*Two_Section_PNLvalue33.PNLA_Long *Two_Section_PNLvalue33.PNLA_Width ;
                  rate222:=rate222/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
               END;
              rate223:=(n223A2*N224A2+N233A2*N234a2)*Two_Section_PNLvalue33.PNLA_Unit_Long_Number*Two_Section_PNLvalue33.PNLA_Unit_Width_Number;
              if Tem_Calculate_Rate_Type1=1 then  //用单元计算
               begin
                  rate223:=(n223A2*N224A2+N233A2*N234a2)*Two_Section_PNLvalue33.PNLA_Unit_Long_Number*Two_Section_PNLvalue33.PNLA_Unit_Width_Number
                                          *Two_Section_PNLvalue33.PNLA_Unit_Long*Two_Section_PNLvalue33.PNLA_Unit_Width ;
                  rate223:=rate223/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
               end;
               if Tem_Calculate_Rate_Type1=2 then //用PNL计算
               begin
                  rate223:=(n223A2*N224A2+N233A2*N234a2)*Two_Section_PNLvalue33.PNLA_Long *Two_Section_PNLvalue33.PNLA_Width;
                  rate223:=rate223/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
               END;

               //小二区长排PNLA长,小三区可排PNLb,则只两种
              rate224:=n221A2*N222A2*Two_Section_PNLvalue33.PNLA_Unit_Long_Number*Two_Section_PNLvalue33.PNLA_Unit_Width_Number
                     +N231B2*N232B2*Two_Section_PNLvalue33.PNLb_Unit_Long_Number*Two_Section_PNLvalue33.PNLb_Unit_Width_Number;
               if Tem_Calculate_Rate_Type1=1 then  //用单元计算
               begin
                  rate224:=n221A2*N222A2*Two_Section_PNLvalue33.PNLA_Unit_Long_Number*Two_Section_PNLvalue33.PNLA_Unit_Width_Number
                                          *Two_Section_PNLvalue33.PNLA_Unit_Long*Two_Section_PNLvalue33.PNLA_Unit_Width
                         +N231B2*N232B2*Two_Section_PNLvalue33.PNLb_Unit_Long_Number*Two_Section_PNLvalue33.PNLb_Unit_Width_Number
                                        *Two_Section_PNLvalue33.PNLb_Unit_Long*Two_Section_PNLvalue33.PNLb_Unit_Width;
                  rate224:=rate224/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
               end;
               if Tem_Calculate_Rate_Type1=2 then //用PNL计算
               begin
                  rate224:=n221A2*N222A2*Two_Section_PNLvalue33.PNLA_Long *Two_Section_PNLvalue33.PNLA_Width
                           +N231B2*N232B2*Two_Section_PNLvalue33.PNLb_Long *Two_Section_PNLvalue33.PNLb_Width;
                  rate224:=rate224/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
               END;

              rate225:=n221A2*N222A2*Two_Section_PNLvalue33.PNLA_Unit_Long_Number*Two_Section_PNLvalue33.PNLA_Unit_Width_Number
                     +N233B2*N234B2*Two_Section_PNLvalue33.PNLb_Unit_Long_Number*Two_Section_PNLvalue33.PNLb_Unit_Width_Number;
              if Tem_Calculate_Rate_Type1=1 then  //用单元计算
               begin
                  rate225:=n221A2*N222A2*Two_Section_PNLvalue33.PNLA_Unit_Long_Number*Two_Section_PNLvalue33.PNLA_Unit_Width_Number
                                          *Two_Section_PNLvalue33.PNLA_Unit_Long*Two_Section_PNLvalue33.PNLA_Unit_Width
                         +N233B2*N234B2*Two_Section_PNLvalue33.PNLb_Unit_Long_Number*Two_Section_PNLvalue33.PNLb_Unit_Width_Number
                                        *Two_Section_PNLvalue33.PNLb_Unit_Long*Two_Section_PNLvalue33.PNLb_Unit_Width;
                  rate225:=rate225/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
               end;
               if Tem_Calculate_Rate_Type1=2 then //用PNL计算
               begin
                  rate225:=n221A2*N222A2*Two_Section_PNLvalue33.PNLA_Long *Two_Section_PNLvalue33.PNLA_Width
                           +N233B2*N234B2*Two_Section_PNLvalue33.PNLb_Long *Two_Section_PNLvalue33.PNLb_Width;
                  rate225:=rate225/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
               END;

              //小二区长排PNLB长,小三区可排PNLA,则只两种
              rate226:=n221B2*N222B2*Two_Section_PNLvalue33.PNLb_Unit_Long_Number*Two_Section_PNLvalue33.PNLb_Unit_Width_Number
                       +N231A2*N232A2*Two_Section_PNLvalue33.PNLA_Unit_Long_Number*Two_Section_PNLvalue33.PNLA_Unit_Width_Number;
               if Tem_Calculate_Rate_Type1=1 then  //用单元计算
               begin
                  rate226:=N231A2*N232A2*Two_Section_PNLvalue33.PNLA_Unit_Long_Number*Two_Section_PNLvalue33.PNLA_Unit_Width_Number
                                          *Two_Section_PNLvalue33.PNLA_Unit_Long*Two_Section_PNLvalue33.PNLA_Unit_Width
                         +n221B2*N222B2*Two_Section_PNLvalue33.PNLb_Unit_Long_Number*Two_Section_PNLvalue33.PNLb_Unit_Width_Number
                                        *Two_Section_PNLvalue33.PNLb_Unit_Long*Two_Section_PNLvalue33.PNLb_Unit_Width;
                  rate226:=rate226/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
               end;
               if Tem_Calculate_Rate_Type1=2 then //用PNL计算
               begin
                  rate226:=N231A2*N232A2*Two_Section_PNLvalue33.PNLA_Long *Two_Section_PNLvalue33.PNLA_Width
                           +n221B2*N222B2*Two_Section_PNLvalue33.PNLb_Long *Two_Section_PNLvalue33.PNLb_Width;
                  rate226:=rate226/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
               END;

              rate227:=n221B2*N222B2*Two_Section_PNLvalue33.PNLb_Unit_Long_Number*Two_Section_PNLvalue33.PNLb_Unit_Width_Number
                       +N233A2*N234A2*Two_Section_PNLvalue33.PNLA_Unit_Long_Number*Two_Section_PNLvalue33.PNLA_Unit_Width_Number;
              if Tem_Calculate_Rate_Type1=1 then  //用单元计算
               begin
                  rate227:=N233A2*N234A2*Two_Section_PNLvalue33.PNLA_Unit_Long_Number*Two_Section_PNLvalue33.PNLA_Unit_Width_Number
                                          *Two_Section_PNLvalue33.PNLA_Unit_Long*Two_Section_PNLvalue33.PNLA_Unit_Width
                         +n221B2*N222B2*Two_Section_PNLvalue33.PNLb_Unit_Long_Number*Two_Section_PNLvalue33.PNLb_Unit_Width_Number
                                        *Two_Section_PNLvalue33.PNLb_Unit_Long*Two_Section_PNLvalue33.PNLb_Unit_Width;
                  rate227:=rate227/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
               end;
               if Tem_Calculate_Rate_Type1=2 then //用PNL计算
               begin
                  rate227:=N233A2*N234A2*Two_Section_PNLvalue33.PNLA_Long *Two_Section_PNLvalue33.PNLA_Width
                           +n221B2*N222B2*Two_Section_PNLvalue33.PNLb_Long *Two_Section_PNLvalue33.PNLb_Width;
                  rate227:=rate227/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
               END;

              //小二区长排PNLB宽,小三区可排PNLA,则只两种
              rate228:=n223B2*N224B2*Two_Section_PNLvalue33.PNLb_Unit_Long_Number*Two_Section_PNLvalue33.PNLb_Unit_Width_Number
                       +N231A2*N232A2*Two_Section_PNLvalue33.PNLA_Unit_Long_Number*Two_Section_PNLvalue33.PNLA_Unit_Width_Number;
              if Tem_Calculate_Rate_Type1=1 then  //用单元计算
               begin
                  rate228:=N231A2*N232A2*Two_Section_PNLvalue33.PNLA_Unit_Long_Number*Two_Section_PNLvalue33.PNLA_Unit_Width_Number
                                          *Two_Section_PNLvalue33.PNLA_Unit_Long*Two_Section_PNLvalue33.PNLA_Unit_Width
                         +n223B2*N224B2*Two_Section_PNLvalue33.PNLb_Unit_Long_Number*Two_Section_PNLvalue33.PNLb_Unit_Width_Number
                                        *Two_Section_PNLvalue33.PNLb_Unit_Long*Two_Section_PNLvalue33.PNLb_Unit_Width;
                  rate228:=rate228/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
               end;
               if Tem_Calculate_Rate_Type1=2 then //用PNL计算
               begin
                  rate228:=N231A2*N232A2*Two_Section_PNLvalue33.PNLA_Long *Two_Section_PNLvalue33.PNLA_Width
                           +n223B2*N224B2*Two_Section_PNLvalue33.PNLb_Long *Two_Section_PNLvalue33.PNLb_Width;
                  rate228:=rate228/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
               END;

              rate229:=n223B2*N224B2*Two_Section_PNLvalue33.PNLb_Unit_Long_Number*Two_Section_PNLvalue33.PNLb_Unit_Width_Number
                       +N233A2*N234A2*Two_Section_PNLvalue33.PNLA_Unit_Long_Number*Two_Section_PNLvalue33.PNLA_Unit_Width_Number;
              if Tem_Calculate_Rate_Type1=1 then  //用单元计算
               begin
                  rate229:=N233A2*N234A2*Two_Section_PNLvalue33.PNLA_Unit_Long_Number*Two_Section_PNLvalue33.PNLA_Unit_Width_Number
                                          *Two_Section_PNLvalue33.PNLA_Unit_Long*Two_Section_PNLvalue33.PNLA_Unit_Width
                         +n223B2*N224B2*Two_Section_PNLvalue33.PNLb_Unit_Long_Number*Two_Section_PNLvalue33.PNLb_Unit_Width_Number
                                        *Two_Section_PNLvalue33.PNLb_Unit_Long*Two_Section_PNLvalue33.PNLb_Unit_Width;
                  rate229:=rate229/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
               end;
               if Tem_Calculate_Rate_Type1=2 then //用PNL计算
               begin
                  rate229:=N233A2*N234A2*Two_Section_PNLvalue33.PNLA_Long *Two_Section_PNLvalue33.PNLA_Width
                           +n223B2*N224B2*Two_Section_PNLvalue33.PNLb_Long *Two_Section_PNLvalue33.PNLb_Width;
                  rate229:=rate229/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
               END;

              //小二区长排PNLB长,小三区可排PNLB,则只两种
              rate230:=(n221B2*N222B2+N231B2*N232B2)*Two_Section_PNLvalue33.PNLB_Unit_Long_Number*Two_Section_PNLvalue33.PNLB_Unit_Width_Number;
              if Tem_Calculate_Rate_Type1=1 then  //用单元计算
               begin
                  rate230:=(n221B2*N222B2+N231B2*N232B2)*Two_Section_PNLvalue33.PNLb_Unit_Long_Number*Two_Section_PNLvalue33.PNLb_Unit_Width_Number
                                        *Two_Section_PNLvalue33.PNLb_Unit_Long*Two_Section_PNLvalue33.PNLb_Unit_Width;
                  rate230:=rate230/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
               end;
               if Tem_Calculate_Rate_Type1=2 then //用PNL计算
               begin
                  rate230:=(n221B2*N222B2+N231B2*N232B2)*Two_Section_PNLvalue33.PNLb_Long *Two_Section_PNLvalue33.PNLb_Width;
                  rate230:=rate230/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
               END;

              rate231:=(n221B2*N222B2+N233B2*N234B2)*Two_Section_PNLvalue33.PNLB_Unit_Long_Number*Two_Section_PNLvalue33.PNLB_Unit_Width_Number;
              if Tem_Calculate_Rate_Type1=1 then  //用单元计算
               begin
                  rate231:=(n221B2*N222B2+N233B2*N234B2)*Two_Section_PNLvalue33.PNLb_Unit_Long_Number*Two_Section_PNLvalue33.PNLb_Unit_Width_Number
                                        *Two_Section_PNLvalue33.PNLb_Unit_Long*Two_Section_PNLvalue33.PNLb_Unit_Width;
                  rate231:=rate231/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
               end;
               if Tem_Calculate_Rate_Type1=2 then //用PNL计算
               begin
                  rate231:=(n221B2*N222B2+N233B2*N234B2)*Two_Section_PNLvalue33.PNLb_Long *Two_Section_PNLvalue33.PNLb_Width;
                  rate231:=rate231/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
               END;

              //小二区长排PNLB宽,小三区可排PNLB,则只两种
              rate232:=(n223B2*N224B2+N231B2*N232B2)*Two_Section_PNLvalue33.PNLB_Unit_Long_Number*Two_Section_PNLvalue33.PNLB_Unit_Width_Number;
              if Tem_Calculate_Rate_Type1=1 then  //用单元计算
               begin
                  rate232:=(n223B2*N224B2+N231B2*N232B2)*Two_Section_PNLvalue33.PNLb_Unit_Long_Number*Two_Section_PNLvalue33.PNLb_Unit_Width_Number
                                        *Two_Section_PNLvalue33.PNLb_Unit_Long*Two_Section_PNLvalue33.PNLb_Unit_Width;
                  rate232:=rate232/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
               end;
               if Tem_Calculate_Rate_Type1=2 then //用PNL计算
               begin
                  rate223:=(n223B2*N224B2+N231B2*N232B2)*Two_Section_PNLvalue33.PNLb_Long *Two_Section_PNLvalue33.PNLb_Width;
                  rate232:=rate232/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
               END;

              rate233:=(n223B2*N224B2+N233B2*N234B2)*Two_Section_PNLvalue33.PNLB_Unit_Long_Number*Two_Section_PNLvalue33.PNLB_Unit_Width_Number;
              if Tem_Calculate_Rate_Type1=1 then  //用单元计算
               begin
                  rate233:=(n223B2*N224B2+N233B2*N234B2)*Two_Section_PNLvalue33.PNLb_Unit_Long_Number*Two_Section_PNLvalue33.PNLb_Unit_Width_Number
                                        *Two_Section_PNLvalue33.PNLb_Unit_Long*Two_Section_PNLvalue33.PNLb_Unit_Width;
                  rate233:=rate233/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
               end;
               if Tem_Calculate_Rate_Type1=2 then //用PNL计算
               begin
                  rate233:=(n223B2*N224B2+N233B2*N234B2)*Two_Section_PNLvalue33.PNLb_Long *Two_Section_PNLvalue33.PNLb_Width;
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
                tempnl_sheet22.Section_LongA:=Two_Section_PNLvalue33.PNLA_Long;
                tempnl_sheet22.Section_WidthA:=Two_Section_PNLvalue33.PNLA_Width;
                tempnl_sheet22.Section_Long_NumberA:=i21;
                tempnl_sheet22.Section_Width_NumberA:=j21;
                tempnl_sheet22.Section_LongB:=Two_Section_PNLvalue33.PNLb_Width;
                tempnl_sheet22.Section_WidthB:=Two_Section_PNLvalue33.PNLb_Long;
                tempnl_sheet22.Section_Long_NumberB:=n223B2;
                tempnl_sheet22.Section_Width_NumberB:=N224B2;
                tempnl_sheet22.Section_LongB:=Two_Section_PNLvalue33.PNLb_Width;
                tempnl_sheet22.Section_WidthB:=Two_Section_PNLvalue33.PNLb_Long;
                tempnl_sheet22.Section_Long_NumberB:=N233B2;
                tempnl_sheet22.Section_Width_NumberB:=N234B2;
                tempnl_sheet22.Section_Unit_Number:=(n223B2*N224B2+N233B2*N234B2)*Two_Section_PNLvalue33.PNLB_Unit_Long_Number*Two_Section_PNLvalue33.PNLB_Unit_Width_Number+I21*J21*Two_Section_PNLvalue33.PNLA_Unit_Long_Number*Two_Section_PNLvalue33.PNLA_Unit_Width_Number;
             end;
             if  rate232=max21 then 
             begin  //N后的第三位数字表示长宽量是否调换,如为3,4则调换,后面的字母表示是第一种还是第二种排法,A表示第一种排法;B表示第二种排法
                array_type2:=32;   //小二区长排PNLB宽;小三区长排PNLB宽
                tempnl_sheet22.Section_LongA:=Two_Section_PNLvalue33.PNLA_Long;
                tempnl_sheet22.Section_WidthA:=Two_Section_PNLvalue33.PNLA_Width;
                tempnl_sheet22.Section_Long_NumberA:=i21;
                tempnl_sheet22.Section_Width_NumberA:=j21;
                tempnl_sheet22.Section_LongB:=Two_Section_PNLvalue33.PNLb_Width;
                tempnl_sheet22.Section_WidthB:=Two_Section_PNLvalue33.PNLb_Long;
                tempnl_sheet22.Section_Long_NumberB:=n223B2;
                tempnl_sheet22.Section_Width_NumberB:=N224B2;
                tempnl_sheet22.Section_LongB:=Two_Section_PNLvalue33.PNLb_Long;
                tempnl_sheet22.Section_WidthB:=Two_Section_PNLvalue33.PNLb_Width;
                tempnl_sheet22.Section_Long_NumberB:=N231B2;
                tempnl_sheet22.Section_Width_NumberB:=N232B2;
                tempnl_sheet22.Section_Unit_Number:=(n223B2*N224B2+N231B2*N232B2)*Two_Section_PNLvalue33.PNLB_Unit_Long_Number*Two_Section_PNLvalue33.PNLB_Unit_Width_Number+I21*J21*Two_Section_PNLvalue33.PNLA_Unit_Long_Number*Two_Section_PNLvalue33.PNLA_Unit_Width_Number;
             end;
             //小二区长排PNLB长,小三区可排PNLB,则只两种
             if  rate230=max21 then
             begin  //N后的第三位数字表示长宽量是否调换,如为3,4则调换,后面的字母表示是第一种还是第二种排法,A表示第一种排法;B表示第二种排法
                array_type2:=30;   //小二区长排PNLB宽;小三区长排PNLB宽
                tempnl_sheet22.Section_LongA:=Two_Section_PNLvalue33.PNLA_Long;
                tempnl_sheet22.Section_WidthA:=Two_Section_PNLvalue33.PNLA_Width;
                tempnl_sheet22.Section_Long_NumberA:=i21;
                tempnl_sheet22.Section_Width_NumberA:=j21;
                tempnl_sheet22.Section_LongB:=Two_Section_PNLvalue33.PNLb_Long;
                tempnl_sheet22.Section_WidthB:=Two_Section_PNLvalue33.PNLb_Width;
                tempnl_sheet22.Section_Long_NumberB:=n221B2;
                tempnl_sheet22.Section_Width_NumberB:=N222B2;
                tempnl_sheet22.Section_LongB:=Two_Section_PNLvalue33.PNLb_Long;
                tempnl_sheet22.Section_WidthB:=Two_Section_PNLvalue33.PNLb_Width;
                tempnl_sheet22.Section_Long_NumberB:=N231B2;
                tempnl_sheet22.Section_Width_NumberB:=N232B2;
                tempnl_sheet22.Section_Unit_Number:=(n221B2*N222B2+N231B2*N232B2)*Two_Section_PNLvalue33.PNLB_Unit_Long_Number*Two_Section_PNLvalue33.PNLB_Unit_Width_Number+I21*J21*Two_Section_PNLvalue33.PNLA_Unit_Long_Number*Two_Section_PNLvalue33.PNLA_Unit_Width_Number;
             end;
             if  rate231=max21 then
             begin  //N后的第三位数字表示长宽量是否调换,如为3,4则调换,后面的字母表示是第一种还是第二种排法,A表示第一种排法;B表示第二种排法
                array_type2:=31;   //小二区长排PNLB宽;小三区长排PNLB宽
                tempnl_sheet22.Section_LongA:=Two_Section_PNLvalue33.PNLA_Long;
                tempnl_sheet22.Section_WidthA:=Two_Section_PNLvalue33.PNLA_Width;
                tempnl_sheet22.Section_Long_NumberA:=i21;
                tempnl_sheet22.Section_Width_NumberA:=j21;
                tempnl_sheet22.Section_LongB:=Two_Section_PNLvalue33.PNLb_Long ;
                tempnl_sheet22.Section_WidthB:=Two_Section_PNLvalue33.PNLb_Width;
                tempnl_sheet22.Section_Long_NumberB:=n221B2;
                tempnl_sheet22.Section_Width_NumberB:=N222B2;
                tempnl_sheet22.Section_LongB:=Two_Section_PNLvalue33.PNLb_Long;
                tempnl_sheet22.Section_WidthB:=Two_Section_PNLvalue33.PNLb_Width;
                tempnl_sheet22.Section_Long_NumberB:=N231B2;
                tempnl_sheet22.Section_Width_NumberB:=N232B2;
                tempnl_sheet22.Section_Unit_Number:=(n221B2*N222B2+N233B2*N234B2)*Two_Section_PNLvalue33.PNLB_Unit_Long_Number*Two_Section_PNLvalue33.PNLB_Unit_Width_Number+I21*J21*Two_Section_PNLvalue33.PNLA_Unit_Long_Number*Two_Section_PNLvalue33.PNLA_Unit_Width_Number;
             end;
            //小二区长排PNLB宽,小三区可排PNLA,则只两种
            if  rate229=max21 then //rate229:=n223B2*N224B2+N233A2*N234A2
             begin  //N后的第三位数字表示长宽量是否调换,如为3,4则调换,后面的字母表示是第一种还是第二种排法,A表示第一种排法;B表示第二种排法
                array_type2:=29;   //小二区长排PNLB宽;小三区长排PNLB宽
                tempnl_sheet22.Section_LongA:=Two_Section_PNLvalue33.PNLA_Long;
                tempnl_sheet22.Section_WidthA:=Two_Section_PNLvalue33.PNLA_Width;
                tempnl_sheet22.Section_Long_NumberA:=i21;
                tempnl_sheet22.Section_Width_NumberA:=j21;
                tempnl_sheet22.Section_LongB:=Two_Section_PNLvalue33.PNLb_Width;
                tempnl_sheet22.Section_WidthB:=Two_Section_PNLvalue33.PNLb_Long;
                tempnl_sheet22.Section_Long_NumberB:=n223B2;
                tempnl_sheet22.Section_Width_NumberB:=N224B2;
                tempnl_sheet22.Section_LongB:=Two_Section_PNLvalue33.PNLa_Width;
                tempnl_sheet22.Section_WidthB:=Two_Section_PNLvalue33.PNLa_Long;
                tempnl_sheet22.Section_Long_NumberB:=N233A2;
                tempnl_sheet22.Section_Width_NumberB:=N234A2;
               tempnl_sheet22.Section_Unit_Number:=N233A2*N234A2*Two_Section_PNLvalue33.PNLa_Unit_Long_Number*Two_Section_PNLvalue33.PNLa_Unit_Width_Number+n223B2*N224B2*Two_Section_PNLvalue33.PNLB_Unit_Long_Number*Two_Section_PNLvalue33.PNLB_Unit_Width_Number+I21*J21*Two_Section_PNLvalue33.PNLA_Unit_Long_Number*Two_Section_PNLvalue33.PNLA_Unit_Width_Number;
             end;

             if  rate228=max21 then
             begin  //N后的第三位数字表示长宽量是否调换,如为3,4则调换,后面的字母表示是第一种还是第二种排法,A表示第一种排法;B表示第二种排法
                array_type2:=28;   //小二区长排PNLB宽;小三区长排PNLB宽
                tempnl_sheet22.Section_LongA:=Two_Section_PNLvalue33.PNLA_Long;
                tempnl_sheet22.Section_WidthA:=Two_Section_PNLvalue33.PNLA_Width;
                tempnl_sheet22.Section_Long_NumberA:=i21;
                tempnl_sheet22.Section_Width_NumberA:=j21;
                tempnl_sheet22.Section_LongB:=Two_Section_PNLvalue33.PNLb_Width;
                tempnl_sheet22.Section_WidthB:=Two_Section_PNLvalue33.PNLb_Long;
                tempnl_sheet22.Section_Long_NumberB:=n223B2;
                tempnl_sheet22.Section_Width_NumberB:=N224B2;
                tempnl_sheet22.Section_LongB:=Two_Section_PNLvalue33.PNLa_Long;
                tempnl_sheet22.Section_WidthB:=Two_Section_PNLvalue33.PNLa_Width;
                tempnl_sheet22.Section_Long_NumberB:=N231A2;
                tempnl_sheet22.Section_Width_NumberB:=N232A2;
                tempnl_sheet22.Section_Unit_Number:=N231A2*N232A2*Two_Section_PNLvalue33.PNLa_Unit_Long_Number*Two_Section_PNLvalue33.PNLa_Unit_Width_Number
                                                   +n223B2*N224B2*Two_Section_PNLvalue33.PNLB_Unit_Long_Number*Two_Section_PNLvalue33.PNLB_Unit_Width_Number
                                                   +I21*J21*Two_Section_PNLvalue33.PNLA_Unit_Long_Number*Two_Section_PNLvalue33.PNLA_Unit_Width_Number;
             end;

             //小二区长排PNLB长,小三区可排PNLA,则只两种
             if  rate227=max21 then
             begin  //N后的第三位数字表示长宽量是否调换,如为3,4则调换,后面的字母表示是第一种还是第二种排法,A表示第一种排法;B表示第二种排法
                array_type2:=27;   //小二区长排PNLB宽;小三区长排PNLB宽
                tempnl_sheet22.Section_LongA:=Two_Section_PNLvalue33.PNLA_Long;
                tempnl_sheet22.Section_WidthA:=Two_Section_PNLvalue33.PNLA_Width;
                tempnl_sheet22.Section_Long_NumberA:=i21;
                tempnl_sheet22.Section_Width_NumberA:=j21;
                tempnl_sheet22.Section_LongB:=Two_Section_PNLvalue33.PNLb_Long;
                tempnl_sheet22.Section_WidthB:=Two_Section_PNLvalue33.PNLb_Width;
                tempnl_sheet22.Section_Long_NumberB:=n221B2;
                tempnl_sheet22.Section_Width_NumberB:=N222B2;
                tempnl_sheet22.Section_LongB:=Two_Section_PNLvalue33.PNLa_Width;
                tempnl_sheet22.Section_WidthB:=Two_Section_PNLvalue33.PNLa_Long;
                tempnl_sheet22.Section_Long_NumberB:=N233A2;
                tempnl_sheet22.Section_Width_NumberB:=N234A2;
                tempnl_sheet22.Section_Unit_Number:=N233A2*N234A2*Two_Section_PNLvalue33.PNLa_Unit_Long_Number*Two_Section_PNLvalue33.PNLa_Unit_Width_Number
                                                   +n221B2*N222B2*Two_Section_PNLvalue33.PNLB_Unit_Long_Number*Two_Section_PNLvalue33.PNLB_Unit_Width_Number
                                                   +I21*J21*Two_Section_PNLvalue33.PNLA_Unit_Long_Number*Two_Section_PNLvalue33.PNLA_Unit_Width_Number;
             end;

             if  rate226=max21 then
             begin  //N后的第三位数字表示长宽量是否调换,如为3,4则调换,后面的字母表示是第一种还是第二种排法,A表示第一种排法;B表示第二种排法
                array_type2:=26;   //小二区长排PNLB宽;小三区长排PNLB宽
                tempnl_sheet22.Section_LongA:=Two_Section_PNLvalue33.PNLA_Long;
                tempnl_sheet22.Section_WidthA:=Two_Section_PNLvalue33.PNLA_Width;
                tempnl_sheet22.Section_Long_NumberA:=i21;
                tempnl_sheet22.Section_Width_NumberA:=j21;
                tempnl_sheet22.Section_LongB:=Two_Section_PNLvalue33.PNLb_Long;
                tempnl_sheet22.Section_WidthB:=Two_Section_PNLvalue33.PNLb_Width;
                tempnl_sheet22.Section_Long_NumberB:=n221B2;
                tempnl_sheet22.Section_Width_NumberB:=N222B2;
                tempnl_sheet22.Section_LongB:=Two_Section_PNLvalue33.PNLa_Long;
                tempnl_sheet22.Section_WidthB:=Two_Section_PNLvalue33.PNLa_Width;
                tempnl_sheet22.Section_Long_NumberB:=N231A2;
                tempnl_sheet22.Section_Width_NumberB:=N232A2;
                tempnl_sheet22.Section_Unit_Number:=N231A2*N232A2*Two_Section_PNLvalue33.PNLa_Unit_Long_Number*Two_Section_PNLvalue33.PNLa_Unit_Width_Number
                                                   +n221B2*N222B2*Two_Section_PNLvalue33.PNLB_Unit_Long_Number*Two_Section_PNLvalue33.PNLB_Unit_Width_Number
                                                   +I21*J21*Two_Section_PNLvalue33.PNLA_Unit_Long_Number*Two_Section_PNLvalue33.PNLA_Unit_Width_Number;
             end;

             //小二区长排PNLA长,小三区可排PNLb,则只两种
             if  rate225=max21 then // rate225:=n221A2*N222A2+N233B2*N234B2
             begin  //N后的第三位数字表示长宽量是否调换,如为3,4则调换,后面的字母表示是第一种还是第二种排法,A表示第一种排法;B表示第二种排法
                array_type2:=25;   //小二区长排PNLB宽;小三区长排PNLB宽
                tempnl_sheet22.Section_LongA:=Two_Section_PNLvalue33.PNLA_Long;
                tempnl_sheet22.Section_WidthA:=Two_Section_PNLvalue33.PNLA_Width;
                tempnl_sheet22.Section_Long_NumberA:=i21;
                tempnl_sheet22.Section_Width_NumberA:=j21;
                tempnl_sheet22.Section_LongB:=Two_Section_PNLvalue33.PNLa_Long ;
                tempnl_sheet22.Section_WidthB:=Two_Section_PNLvalue33.PNLa_Width ;
                tempnl_sheet22.Section_Long_NumberB:=n221A2;
                tempnl_sheet22.Section_Width_NumberB:=N222A2;
                tempnl_sheet22.Section_LongB:=Two_Section_PNLvalue33.PNLb_Width;
                tempnl_sheet22.Section_WidthB:=Two_Section_PNLvalue33.PNLb_Long;
                tempnl_sheet22.Section_Long_NumberB:=N233B2;
                tempnl_sheet22.Section_Width_NumberB:=N234B2;
                tempnl_sheet22.Section_Unit_Number:=n221A2*N222A2*Two_Section_PNLvalue33.PNLa_Unit_Long_Number*Two_Section_PNLvalue33.PNLa_Unit_Width_Number
                                                   +N233B2*N234B2*Two_Section_PNLvalue33.PNLB_Unit_Long_Number*Two_Section_PNLvalue33.PNLB_Unit_Width_Number
                                                   +I21*J21*Two_Section_PNLvalue33.PNLA_Unit_Long_Number*Two_Section_PNLvalue33.PNLA_Unit_Width_Number;
             end;

             if  rate224=max21 then 
             begin  //N后的第三位数字表示长宽量是否调换,如为3,4则调换,后面的字母表示是第一种还是第二种排法,A表示第一种排法;B表示第二种排法
                array_type2:=24;   //小二区长排PNLB宽;小三区长排PNLB宽
                tempnl_sheet22.Section_LongA:=Two_Section_PNLvalue33.PNLA_Long;
                tempnl_sheet22.Section_WidthA:=Two_Section_PNLvalue33.PNLA_Width;
                tempnl_sheet22.Section_Long_NumberA:=i21;
                tempnl_sheet22.Section_Width_NumberA:=j21;
                tempnl_sheet22.Section_LongB:=Two_Section_PNLvalue33.PNLa_Long;
                tempnl_sheet22.Section_WidthB:=Two_Section_PNLvalue33.PNLa_Width;
                tempnl_sheet22.Section_Long_NumberB:=n221A2;
                tempnl_sheet22.Section_Width_NumberB:=N222A2;
                tempnl_sheet22.Section_LongB:=Two_Section_PNLvalue33.PNLb_Long;
                tempnl_sheet22.Section_WidthB:=Two_Section_PNLvalue33.PNLb_Width;
                tempnl_sheet22.Section_Long_NumberB:=N231B2;
                tempnl_sheet22.Section_Width_NumberB:=N232B2;
                tempnl_sheet22.Section_Unit_Number:=n221A2*N222A2*Two_Section_PNLvalue33.PNLa_Unit_Long_Number*Two_Section_PNLvalue33.PNLa_Unit_Width_Number
                                                   +N231B2*N232B2*Two_Section_PNLvalue33.PNLB_Unit_Long_Number*Two_Section_PNLvalue33.PNLB_Unit_Width_Number
                                                   +I21*J21*Two_Section_PNLvalue33.PNLA_Unit_Long_Number*Two_Section_PNLvalue33.PNLA_Unit_Width_Number;
             end;

             if  rate223=max21 then //rate223:=(n223A2*N224A2+N233A2*N234a2)
             begin  //N后的第三位数字表示长宽量是否调换,如为3,4则调换,后面的字母表示是第一种还是第二种排法,A表示第一种排法;B表示第二种排法
                array_type2:=23;   //小二区长排PNLB宽;小三区长排PNLB宽
                tempnl_sheet22.Section_LongA:=Two_Section_PNLvalue33.PNLA_Long;
                tempnl_sheet22.Section_WidthA:=Two_Section_PNLvalue33.PNLA_Width;
                tempnl_sheet22.Section_Long_NumberA:=i21;
                tempnl_sheet22.Section_Width_NumberA:=j21;
                tempnl_sheet22.Section_LongB:=Two_Section_PNLvalue33.PNLa_Width;
                tempnl_sheet22.Section_WidthB:=Two_Section_PNLvalue33.PNLa_Long;
                tempnl_sheet22.Section_Long_NumberB:=n223A2;
                tempnl_sheet22.Section_Width_NumberB:=N224A2;
                tempnl_sheet22.Section_LongB:=Two_Section_PNLvalue33.PNLa_Width;
                tempnl_sheet22.Section_WidthB:=Two_Section_PNLvalue33.PNLa_Long;
                tempnl_sheet22.Section_Long_NumberB:=N233A2;
                tempnl_sheet22.Section_Width_NumberB:=N234a2;
                tempnl_sheet22.Section_Unit_Number:=(n223A2*N224A2+N233A2*N234a2)*Two_Section_PNLvalue33.PNLa_Unit_Long_Number*Two_Section_PNLvalue33.PNLa_Unit_Width_Number
                                                 //  +n223B2*N224B2*Two_Section_PNLvalue33.PNLB_Unit_Long_Number*Two_Section_PNLvalue33.PNLB_Unit_Width_Number
                                                   +I21*J21*Two_Section_PNLvalue33.PNLA_Unit_Long_Number*Two_Section_PNLvalue33.PNLA_Unit_Width_Number;
             end;

             if  rate222=max21 then //rate222:=(n223A2*N224A2+N231A2*N232a2)
             begin  //N后的第三位数字表示长宽量是否调换,如为3,4则调换,后面的字母表示是第一种还是第二种排法,A表示第一种排法;B表示第二种排法
                array_type2:=22;   //小二区长排PNLB宽;小三区长排PNLB宽
                tempnl_sheet22.Section_LongA:=Two_Section_PNLvalue33.PNLA_Long;
                tempnl_sheet22.Section_WidthA:=Two_Section_PNLvalue33.PNLA_Width;
                tempnl_sheet22.Section_Long_NumberA:=i21;
                tempnl_sheet22.Section_Width_NumberA:=j21;
                tempnl_sheet22.Section_LongB:=Two_Section_PNLvalue33.PNLa_Width;
                tempnl_sheet22.Section_WidthB:=Two_Section_PNLvalue33.PNLa_Long;
                tempnl_sheet22.Section_Long_NumberB:=n223A2;
                tempnl_sheet22.Section_Width_NumberB:=N224A2;
                tempnl_sheet22.Section_LongB:=Two_Section_PNLvalue33.PNLa_Long;
                tempnl_sheet22.Section_WidthB:=Two_Section_PNLvalue33.PNLa_Width;
                tempnl_sheet22.Section_Long_NumberB:=N231A2;
                tempnl_sheet22.Section_Width_NumberB:=N232a2;
                tempnl_sheet22.Section_Unit_Number:=(n223A2*N224A2+N231A2*N232a2)*Two_Section_PNLvalue33.PNLa_Unit_Long_Number*Two_Section_PNLvalue33.PNLa_Unit_Width_Number
                                                  // +n223B2*N224B2*Two_Section_PNLvalue33.PNLB_Unit_Long_Number*Two_Section_PNLvalue33.PNLB_Unit_Width_Number
                                                   +I21*J21*Two_Section_PNLvalue33.PNLA_Unit_Long_Number*Two_Section_PNLvalue33.PNLA_Unit_Width_Number;
             end;

             if  rate221=max21 then //rate221:=(n221A2*N222A2+N233A2*N234a2)
             begin  //N后的第三位数字表示长宽量是否调换,如为3,4则调换,后面的字母表示是第一种还是第二种排法,A表示第一种排法;B表示第二种排法
                array_type2:=21;   //小二区长排PNLB宽;小三区长排PNLB宽
                tempnl_sheet22.Section_LongA:=Two_Section_PNLvalue33.PNLA_Long;
                tempnl_sheet22.Section_WidthA:=Two_Section_PNLvalue33.PNLA_Width;
                tempnl_sheet22.Section_Long_NumberA:=i21;
                tempnl_sheet22.Section_Width_NumberA:=j21;
                tempnl_sheet22.Section_LongB:=Two_Section_PNLvalue33.PNLa_Long;
                tempnl_sheet22.Section_WidthB:=Two_Section_PNLvalue33.PNLa_Width;
                tempnl_sheet22.Section_Long_NumberB:=n221A2;
                tempnl_sheet22.Section_Width_NumberB:=N222A2;
                tempnl_sheet22.Section_LongB:=Two_Section_PNLvalue33.PNLa_Width;
                tempnl_sheet22.Section_WidthB:=Two_Section_PNLvalue33.PNLa_Long;
                tempnl_sheet22.Section_Long_NumberB:=N233A2;
                tempnl_sheet22.Section_Width_NumberB:=N234a2;
                tempnl_sheet22.Section_Unit_Number:=(n221A2*N222A2+N233A2*N234a2)*Two_Section_PNLvalue33.PNLa_Unit_Long_Number*Two_Section_PNLvalue33.PNLa_Unit_Width_Number
                                                   //+n223B2*N224B2*Two_Section_PNLvalue33.PNLB_Unit_Long_Number*Two_Section_PNLvalue33.PNLB_Unit_Width_Number
                                                   +I21*J21*Two_Section_PNLvalue33.PNLA_Unit_Long_Number*Two_Section_PNLvalue33.PNLA_Unit_Width_Number;
             end;
             {以下第一种排法,以上第二种排法}
             if  rate213=max21 then // rate213:=(n223B1*N224B1+N233B1*N234B1)
             begin  //N后的第三位数字表示长宽量是否调换,如为3,4则调换,后面的字母表示是第一种还是第二种排法,A表示第一种排法;B表示第二种排法
                array_type2:=13;   //小二区长排PNLB宽;小三区长排PNLB宽
                tempnl_sheet22.Section_LongA:=Two_Section_PNLvalue33.PNLA_Long;
                tempnl_sheet22.Section_WidthA:=Two_Section_PNLvalue33.PNLA_Width;
                tempnl_sheet22.Section_Long_NumberA:=i21;
                tempnl_sheet22.Section_Width_NumberA:=j21;
                tempnl_sheet22.Section_LongB:=Two_Section_PNLvalue33.PNLb_Width;
                tempnl_sheet22.Section_WidthB:=Two_Section_PNLvalue33.PNLb_Long;
                tempnl_sheet22.Section_Long_NumberB:=n223B1;
                tempnl_sheet22.Section_Width_NumberB:=N224B1;
                tempnl_sheet22.Section_LongB:=Two_Section_PNLvalue33.PNLb_Width;
                tempnl_sheet22.Section_WidthB:=Two_Section_PNLvalue33.PNLb_Long;
                tempnl_sheet22.Section_Long_NumberB:=N233B1;
                tempnl_sheet22.Section_Width_NumberB:=N234B1;
                tempnl_sheet22.Section_Unit_Number:=(n223B1*N224B1+N233B1*N234B1)*Two_Section_PNLvalue33.PNLB_Unit_Long_Number*Two_Section_PNLvalue33.PNLB_Unit_Width_Number
                                                   +I21*J21*Two_Section_PNLvalue33.PNLA_Unit_Long_Number*Two_Section_PNLvalue33.PNLA_Unit_Width_Number;
             end;

             if  rate212=max21 then //  rate212:=(n223B1*N224B1+N231B1*N232B1)
             begin  //N后的第三位数字表示长宽量是否调换,如为3,4则调换,后面的字母表示是第一种还是第二种排法,A表示第一种排法;B表示第二种排法
                array_type2:=12;   //小二区长排PNLB宽;小三区长排PNLB宽
                tempnl_sheet22.Section_LongA:=Two_Section_PNLvalue33.PNLA_Long;
                tempnl_sheet22.Section_WidthA:=Two_Section_PNLvalue33.PNLA_Width;
                tempnl_sheet22.Section_Long_NumberA:=i21;
                tempnl_sheet22.Section_Width_NumberA:=j21;
                tempnl_sheet22.Section_LongB:=Two_Section_PNLvalue33.PNLb_Width;
                tempnl_sheet22.Section_WidthB:=Two_Section_PNLvalue33.PNLb_Long;
                tempnl_sheet22.Section_Long_NumberB:=n223B1;
                tempnl_sheet22.Section_Width_NumberB:=N224B1;
                tempnl_sheet22.Section_LongB:=Two_Section_PNLvalue33.PNLb_Long;
                tempnl_sheet22.Section_WidthB:=Two_Section_PNLvalue33.PNLb_Width;
                tempnl_sheet22.Section_Long_NumberB:=N231B1;
                tempnl_sheet22.Section_Width_NumberB:=N232B1;
                tempnl_sheet22.Section_Unit_Number:=(n223B1*N224B1+N231B1*N232B1)*Two_Section_PNLvalue33.PNLB_Unit_Long_Number*Two_Section_PNLvalue33.PNLB_Unit_Width_Number
                                                   +I21*J21*Two_Section_PNLvalue33.PNLA_Unit_Long_Number*Two_Section_PNLvalue33.PNLA_Unit_Width_Number;
             end;

             if  rate211=max21 then // rate211:=(n221B1*N222B1+N233B1*N234B1)
             begin  //N后的第三位数字表示长宽量是否调换,如为3,4则调换,后面的字母表示是第一种还是第二种排法,A表示第一种排法;B表示第二种排法
                array_type2:=11;   //小二区长排PNLB宽;小三区长排PNLB宽
                tempnl_sheet22.Section_LongA:=Two_Section_PNLvalue33.PNLA_Long;
                tempnl_sheet22.Section_WidthA:=Two_Section_PNLvalue33.PNLA_Width;
                tempnl_sheet22.Section_Long_NumberA:=i21;
                tempnl_sheet22.Section_Width_NumberA:=j21;
                tempnl_sheet22.Section_LongB:=Two_Section_PNLvalue33.PNLb_Long;
                tempnl_sheet22.Section_WidthB:=Two_Section_PNLvalue33.PNLb_Width;
                tempnl_sheet22.Section_Long_NumberB:=n221B1;
                tempnl_sheet22.Section_Width_NumberB:=N222B1;
                tempnl_sheet22.Section_LongB:=Two_Section_PNLvalue33.PNLb_Width;
                tempnl_sheet22.Section_WidthB:=Two_Section_PNLvalue33.PNLb_Long;
                tempnl_sheet22.Section_Long_NumberB:=N233B1;
                tempnl_sheet22.Section_Width_NumberB:=N234B1;
                tempnl_sheet22.Section_Unit_Number:=//(n221A2*N222A2+N233A2*N234a2)*Two_Section_PNLvalue33.PNLa_Unit_Long_Number*Two_Section_PNLvalue33.PNLa_Unit_Width_Number
                                                   (n221B1*N222B1+N233B1*N234B1)*Two_Section_PNLvalue33.PNLB_Unit_Long_Number*Two_Section_PNLvalue33.PNLB_Unit_Width_Number
                                                   +I21*J21*Two_Section_PNLvalue33.PNLA_Unit_Long_Number*Two_Section_PNLvalue33.PNLA_Unit_Width_Number;
             end;

             if  rate210=max21 then // rate210:=(n221B1*N222B1+N231B1*N232B1)
             begin  //N后的第三位数字表示长宽量是否调换,如为3,4则调换,后面的字母表示是第一种还是第二种排法,A表示第一种排法;B表示第二种排法
                array_type2:=10;   //小二区长排PNLB宽;小三区长排PNLB宽
                tempnl_sheet22.Section_LongA:=Two_Section_PNLvalue33.PNLA_Long;
                tempnl_sheet22.Section_WidthA:=Two_Section_PNLvalue33.PNLA_Width;
                tempnl_sheet22.Section_Long_NumberA:=i21;
                tempnl_sheet22.Section_Width_NumberA:=j21;
                tempnl_sheet22.Section_LongB:=Two_Section_PNLvalue33.PNLb_Width;
                tempnl_sheet22.Section_WidthB:=Two_Section_PNLvalue33.PNLb_Long;
                tempnl_sheet22.Section_Long_NumberB:=n221B1;
                tempnl_sheet22.Section_Width_NumberB:=N222B1;
                tempnl_sheet22.Section_LongB:=Two_Section_PNLvalue33.PNLb_Width;
                tempnl_sheet22.Section_WidthB:=Two_Section_PNLvalue33.PNLb_Long;
                tempnl_sheet22.Section_Long_NumberB:=N231B1;
                tempnl_sheet22.Section_Width_NumberB:=N232B1;
                tempnl_sheet22.Section_Unit_Number:=//(n221A2*N222A2+N233A2*N234a2)*Two_Section_PNLvalue33.PNLa_Unit_Long_Number*Two_Section_PNLvalue33.PNLa_Unit_Width_Number
                                                   (n221B1*N222B1+N231B1*N232B1)*Two_Section_PNLvalue33.PNLB_Unit_Long_Number*Two_Section_PNLvalue33.PNLB_Unit_Width_Number
                                                   +I21*J21*Two_Section_PNLvalue33.PNLA_Unit_Long_Number*Two_Section_PNLvalue33.PNLA_Unit_Width_Number;
             end;

             if  rate209=max21 then //   rate209:=n223B1*N224B1+N233A1*N234A1
             begin  //N后的第三位数字表示长宽量是否调换,如为3,4则调换,后面的字母表示是第一种还是第二种排法,A表示第一种排法;B表示第二种排法
                array_type2:=9;   //小二区长排PNLB宽;小三区长排PNLB宽
                tempnl_sheet22.Section_LongA:=Two_Section_PNLvalue33.PNLA_Long;
                tempnl_sheet22.Section_WidthA:=Two_Section_PNLvalue33.PNLA_Width;
                tempnl_sheet22.Section_Long_NumberA:=i21;
                tempnl_sheet22.Section_Width_NumberA:=j21;
                tempnl_sheet22.Section_LongB:=Two_Section_PNLvalue33.PNLb_Width;
                tempnl_sheet22.Section_WidthB:=Two_Section_PNLvalue33.PNLb_Long;
                tempnl_sheet22.Section_Long_NumberB:=n223B1;
                tempnl_sheet22.Section_Width_NumberB:=N224B1;
                tempnl_sheet22.Section_LongB:=Two_Section_PNLvalue33.PNLa_Width;
                tempnl_sheet22.Section_WidthB:=Two_Section_PNLvalue33.PNLa_Long;
                tempnl_sheet22.Section_Long_NumberB:=N233A2;
                tempnl_sheet22.Section_Width_NumberB:=N234a2;
                tempnl_sheet22.Section_Unit_Number:=N233A1*N234A1*Two_Section_PNLvalue33.PNLa_Unit_Long_Number*Two_Section_PNLvalue33.PNLa_Unit_Width_Number
                                                   +n223B1*N224B1*Two_Section_PNLvalue33.PNLB_Unit_Long_Number*Two_Section_PNLvalue33.PNLB_Unit_Width_Number
                                                   +I21*J21*Two_Section_PNLvalue33.PNLA_Unit_Long_Number*Two_Section_PNLvalue33.PNLA_Unit_Width_Number;
             end;

             if  rate208=max21 then //   rate208:=n223B1*N224B1+N231A1*N232A1
             begin  //N后的第三位数字表示长宽量是否调换,如为3,4则调换,后面的字母表示是第一种还是第二种排法,A表示第一种排法;B表示第二种排法
                array_type2:=8;   //小二区长排PNLB宽;小三区长排PNLB宽
                tempnl_sheet22.Section_LongA:=Two_Section_PNLvalue33.PNLA_Long;
                tempnl_sheet22.Section_WidthA:=Two_Section_PNLvalue33.PNLA_Width;
                tempnl_sheet22.Section_Long_NumberA:=i21;
                tempnl_sheet22.Section_Width_NumberA:=j21;
                tempnl_sheet22.Section_LongB:=Two_Section_PNLvalue33.PNLb_Width;
                tempnl_sheet22.Section_WidthB:=Two_Section_PNLvalue33.PNLb_Long;
                tempnl_sheet22.Section_Long_NumberB:=n223B1;
                tempnl_sheet22.Section_Width_NumberB:=N224B1;
                tempnl_sheet22.Section_LongB:=Two_Section_PNLvalue33.PNLa_Long;
                tempnl_sheet22.Section_WidthB:=Two_Section_PNLvalue33.PNLa_Width;
                tempnl_sheet22.Section_Long_NumberB:=N231A1;
                tempnl_sheet22.Section_Width_NumberB:=N232A1;
                tempnl_sheet22.Section_Unit_Number:=N231A1*N232A1*Two_Section_PNLvalue33.PNLa_Unit_Long_Number*Two_Section_PNLvalue33.PNLa_Unit_Width_Number
                                                   +n223B1*N224B1*Two_Section_PNLvalue33.PNLB_Unit_Long_Number*Two_Section_PNLvalue33.PNLB_Unit_Width_Number
                                                   +I21*J21*Two_Section_PNLvalue33.PNLA_Unit_Long_Number*Two_Section_PNLvalue33.PNLA_Unit_Width_Number;
             end;

             if  rate207=max21 then // rate207:=n221B1*N222B1+N233A1*N234A1
             begin  //N后的第三位数字表示长宽量是否调换,如为3,4则调换,后面的字母表示是第一种还是第二种排法,A表示第一种排法;B表示第二种排法
                array_type2:=7;   //小二区长排PNLB宽;小三区长排PNLB宽
                tempnl_sheet22.Section_LongA:=Two_Section_PNLvalue33.PNLA_Long;
                tempnl_sheet22.Section_WidthA:=Two_Section_PNLvalue33.PNLA_Width;
                tempnl_sheet22.Section_Long_NumberA:=i21;
                tempnl_sheet22.Section_Width_NumberA:=j21;
                tempnl_sheet22.Section_LongB:=Two_Section_PNLvalue33.PNLb_Long;
                tempnl_sheet22.Section_WidthB:=Two_Section_PNLvalue33.PNLb_Width;
                tempnl_sheet22.Section_Long_NumberB:=n221B1;
                tempnl_sheet22.Section_Width_NumberB:=N222B1;
                tempnl_sheet22.Section_LongB:=Two_Section_PNLvalue33.PNLa_Width;
                tempnl_sheet22.Section_WidthB:=Two_Section_PNLvalue33.PNLa_Long;
                tempnl_sheet22.Section_Long_NumberB:=N233A2;
                tempnl_sheet22.Section_Width_NumberB:=N234a2;
                tempnl_sheet22.Section_Unit_Number:=N233A1*N234A1*Two_Section_PNLvalue33.PNLa_Unit_Long_Number*Two_Section_PNLvalue33.PNLa_Unit_Width_Number
                                                   +n221B1*N222B1*Two_Section_PNLvalue33.PNLB_Unit_Long_Number*Two_Section_PNLvalue33.PNLB_Unit_Width_Number
                                                   +I21*J21*Two_Section_PNLvalue33.PNLA_Unit_Long_Number*Two_Section_PNLvalue33.PNLA_Unit_Width_Number;
             end;


             if  rate206=max21 then //  rate206:=n221B1*N222B1+N231A1*N232A1
             begin  //N后的第三位数字表示长宽量是否调换,如为3,4则调换,后面的字母表示是第一种还是第二种排法,A表示第一种排法;B表示第二种排法
                array_type2:=6;   //小二区长排PNLB宽;小三区长排PNLB宽
                tempnl_sheet22.Section_LongA:=Two_Section_PNLvalue33.PNLA_Long;
                tempnl_sheet22.Section_WidthA:=Two_Section_PNLvalue33.PNLA_Width;
                tempnl_sheet22.Section_Long_NumberA:=i21;
                tempnl_sheet22.Section_Width_NumberA:=j21;
                tempnl_sheet22.Section_LongB:=Two_Section_PNLvalue33.PNLb_Long;
                tempnl_sheet22.Section_WidthB:=Two_Section_PNLvalue33.PNLb_Width;
                tempnl_sheet22.Section_Long_NumberB:=n221B1;
                tempnl_sheet22.Section_Width_NumberB:=N222B1;
                tempnl_sheet22.Section_LongB:=Two_Section_PNLvalue33.PNLa_Long;
                tempnl_sheet22.Section_WidthB:=Two_Section_PNLvalue33.PNLa_Width;
                tempnl_sheet22.Section_Long_NumberB:=N231A1;
                tempnl_sheet22.Section_Width_NumberB:=N232A1;
                tempnl_sheet22.Section_Unit_Number:=N231A1*N232A1*Two_Section_PNLvalue33.PNLa_Unit_Long_Number*Two_Section_PNLvalue33.PNLa_Unit_Width_Number
                                                   +n221B1*N222B1*Two_Section_PNLvalue33.PNLB_Unit_Long_Number*Two_Section_PNLvalue33.PNLB_Unit_Width_Number
                                                   +I21*J21*Two_Section_PNLvalue33.PNLA_Unit_Long_Number*Two_Section_PNLvalue33.PNLA_Unit_Width_Number;
             end;

              if  rate205=max21 then //  rate205:=n221A1*N222A1+N233B1*N234B1
             begin  //N后的第三位数字表示长宽量是否调换,如为3,4则调换,后面的字母表示是第一种还是第二种排法,A表示第一种排法;B表示第二种排法
                array_type2:=5;   //小二区长排PNLB宽;小三区长排PNLB宽
                tempnl_sheet22.Section_LongA:=Two_Section_PNLvalue33.PNLA_Long;
                tempnl_sheet22.Section_WidthA:=Two_Section_PNLvalue33.PNLA_Width;
                tempnl_sheet22.Section_Long_NumberA:=i21;
                tempnl_sheet22.Section_Width_NumberA:=j21;
                tempnl_sheet22.Section_LongB:=Two_Section_PNLvalue33.PNLa_Long;
                tempnl_sheet22.Section_WidthB:=Two_Section_PNLvalue33.PNLa_Width;
                tempnl_sheet22.Section_Long_NumberB:=n221A2;
                tempnl_sheet22.Section_Width_NumberB:=N222A2;
                tempnl_sheet22.Section_LongB:=Two_Section_PNLvalue33.PNLb_Width;
                tempnl_sheet22.Section_WidthB:=Two_Section_PNLvalue33.PNLb_Long;
                tempnl_sheet22.Section_Long_NumberB:=N233B1;
                tempnl_sheet22.Section_Width_NumberB:=N234B1;
                tempnl_sheet22.Section_Unit_Number:=n221A1*N222A1*Two_Section_PNLvalue33.PNLa_Unit_Long_Number*Two_Section_PNLvalue33.PNLa_Unit_Width_Number
                                                   +N233B1*N234B1*Two_Section_PNLvalue33.PNLB_Unit_Long_Number*Two_Section_PNLvalue33.PNLB_Unit_Width_Number
                                                   +I21*J21*Two_Section_PNLvalue33.PNLA_Unit_Long_Number*Two_Section_PNLvalue33.PNLA_Unit_Width_Number;
             end;

             if  rate204=max21 then //  rate204:=n221A1*N222A1+N231B1*N232B1
             begin  //N后的第三位数字表示长宽量是否调换,如为3,4则调换,后面的字母表示是第一种还是第二种排法,A表示第一种排法;B表示第二种排法
                array_type2:=4;   //小二区长排PNLB宽;小三区长排PNLB宽
                tempnl_sheet22.Section_LongA:=Two_Section_PNLvalue33.PNLA_Long;
                tempnl_sheet22.Section_WidthA:=Two_Section_PNLvalue33.PNLA_Width;
                tempnl_sheet22.Section_Long_NumberA:=i21;
                tempnl_sheet22.Section_Width_NumberA:=j21;
                tempnl_sheet22.Section_LongB:=Two_Section_PNLvalue33.PNLa_Long;
                tempnl_sheet22.Section_WidthB:=Two_Section_PNLvalue33.PNLa_Width;
                tempnl_sheet22.Section_Long_NumberB:=n221A2;
                tempnl_sheet22.Section_Width_NumberB:=N222A2;
                tempnl_sheet22.Section_LongB:=Two_Section_PNLvalue33.PNLb_Long;
                tempnl_sheet22.Section_WidthB:=Two_Section_PNLvalue33.PNLb_Width;
                tempnl_sheet22.Section_Long_NumberB:=N231B1;
                tempnl_sheet22.Section_Width_NumberB:=N232B1;
                tempnl_sheet22.Section_Unit_Number:=n221A1*N222A1*Two_Section_PNLvalue33.PNLa_Unit_Long_Number*Two_Section_PNLvalue33.PNLa_Unit_Width_Number
                                                   +N231B1*N232B1*Two_Section_PNLvalue33.PNLB_Unit_Long_Number*Two_Section_PNLvalue33.PNLB_Unit_Width_Number
                                                   +I21*J21*Two_Section_PNLvalue33.PNLA_Unit_Long_Number*Two_Section_PNLvalue33.PNLA_Unit_Width_Number;
             end;

             if  rate203=max21 then // rate203:=(n223A1*N224A1+N233A1*N234a1)
             begin  //N后的第三位数字表示长宽量是否调换,如为3,4则调换,后面的字母表示是第一种还是第二种排法,A表示第一种排法;B表示第二种排法
                array_type2:=3;   //小二区长排PNLB宽;小三区长排PNLB宽
                tempnl_sheet22.Section_LongA:=Two_Section_PNLvalue33.PNLA_Long;
                tempnl_sheet22.Section_WidthA:=Two_Section_PNLvalue33.PNLA_Width;
                tempnl_sheet22.Section_Long_NumberA:=i21;
                tempnl_sheet22.Section_Width_NumberA:=j21;
                tempnl_sheet22.Section_LongB:=Two_Section_PNLvalue33.PNLa_Width;
                tempnl_sheet22.Section_WidthB:=Two_Section_PNLvalue33.PNLa_Long;
                tempnl_sheet22.Section_Long_NumberB:=n223A1;
                tempnl_sheet22.Section_Width_NumberB:=N224A1;
                tempnl_sheet22.Section_LongB:=Two_Section_PNLvalue33.PNLa_Width;
                tempnl_sheet22.Section_WidthB:=Two_Section_PNLvalue33.PNLa_Long;
                tempnl_sheet22.Section_Long_NumberB:=N233A1;
                tempnl_sheet22.Section_Width_NumberB:=N234a1;
                tempnl_sheet22.Section_Unit_Number:=(n223A1*N224A1+N233A1*N234a1)*Two_Section_PNLvalue33.PNLa_Unit_Long_Number*Two_Section_PNLvalue33.PNLa_Unit_Width_Number
                                                   +I21*J21*Two_Section_PNLvalue33.PNLA_Unit_Long_Number*Two_Section_PNLvalue33.PNLA_Unit_Width_Number;
             end;

            if  rate202=max21 then //rate202:=(n223A1*N224A1+N231A1*N232a1)
             begin  //N后的第三位数字表示长宽量是否调换,如为3,4则调换,后面的字母表示是第一种还是第二种排法,A表示第一种排法;B表示第二种排法
                array_type2:=2;   //小二区长排PNLB宽;小三区长排PNLB宽
                tempnl_sheet22.Section_LongA:=Two_Section_PNLvalue33.PNLA_Long;
                tempnl_sheet22.Section_WidthA:=Two_Section_PNLvalue33.PNLA_Width;
                tempnl_sheet22.Section_Long_NumberA:=i21;
                tempnl_sheet22.Section_Width_NumberA:=j21;
                tempnl_sheet22.Section_LongB:=Two_Section_PNLvalue33.PNLa_Width;
                tempnl_sheet22.Section_WidthB:=Two_Section_PNLvalue33.PNLa_Long;
                tempnl_sheet22.Section_Long_NumberB:=n223A1;
                tempnl_sheet22.Section_Width_NumberB:=N224A1;
                tempnl_sheet22.Section_LongB:=Two_Section_PNLvalue33.PNLa_Width;
                tempnl_sheet22.Section_WidthB:=Two_Section_PNLvalue33.PNLa_Long;
                tempnl_sheet22.Section_Long_NumberB:=N231A1;
                tempnl_sheet22.Section_Width_NumberB:=N232a1;
                tempnl_sheet22.Section_Unit_Number:=(n223A1*N224A1+N231A1*N232a1)*Two_Section_PNLvalue33.PNLa_Unit_Long_Number*Two_Section_PNLvalue33.PNLa_Unit_Width_Number
                                                   +I21*J21*Two_Section_PNLvalue33.PNLA_Unit_Long_Number*Two_Section_PNLvalue33.PNLA_Unit_Width_Number;
             end;

            if  rate201=max21 then //rate201:=(n221A1*N222A1+N233A1*N234a1)
             begin  //N后的第三位数字表示长宽量是否调换,如为3,4则调换,后面的字母表示是第一种还是第二种排法,A表示第一种排法;B表示第二种排法
                array_type2:=1;   //小二区长排PNLB宽;小三区长排PNLB宽
                tempnl_sheet22.Section_LongA:=Two_Section_PNLvalue33.PNLA_Long;
                tempnl_sheet22.Section_WidthA:=Two_Section_PNLvalue33.PNLA_Width;
                tempnl_sheet22.Section_Long_NumberA:=i21;
                tempnl_sheet22.Section_Width_NumberA:=j21;
                tempnl_sheet22.Section_LongB:=Two_Section_PNLvalue33.PNLa_Long;
                tempnl_sheet22.Section_WidthB:=Two_Section_PNLvalue33.PNLa_Width;
                tempnl_sheet22.Section_Long_NumberB:=n221A1;
                tempnl_sheet22.Section_Width_NumberB:=N222A1;
                tempnl_sheet22.Section_LongB:=Two_Section_PNLvalue33.PNLa_Long ;
                tempnl_sheet22.Section_WidthB:=Two_Section_PNLvalue33.PNLa_Width;
                tempnl_sheet22.Section_Long_NumberB:=N233A1;
                tempnl_sheet22.Section_Width_NumberB:=N234a1;
                tempnl_sheet22.Section_Unit_Number:=(n221A1*N222A1+N233A1*N234a1)*Two_Section_PNLvalue33.PNLa_Unit_Long_Number*Two_Section_PNLvalue33.PNLa_Unit_Width_Number
                                                   +I21*J21*Two_Section_PNLvalue33.PNLA_Unit_Long_Number*Two_Section_PNLvalue33.PNLA_Unit_Width_Number;
             end;
             if  rate200=max21 then //
             begin  //N后的第三位数字表示长宽量是否调换,如为3,4则调换,后面的字母表示是第一种还是第二种排法,A表示第一种排法;B表示第二种排法
                array_type2:=0;   //小二区长排PNLB宽;小三区长排PNLB宽
                tempnl_sheet22.Section_LongA:=Two_Section_PNLvalue33.PNLA_Long;
                tempnl_sheet22.Section_WidthA:=Two_Section_PNLvalue33.PNLA_Width;
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
                tempnl_sheet22.Section_Unit_Number:=n201*n202*Two_Section_PNLvalue33.PNLA_Unit_Long_Number*Two_Section_PNLvalue33.PNLA_Unit_Width_Number;
             end;

          end;
        end;
     end;       {}
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
  begin
     if Leave_Section_falchion_number1=2 then //只分两个区,排法只有AB的一边固定个数
     begin
       n31:=trunc(Three_Section_value333.Sheet_Long/Three_Section_PNLvalue33.PNLA_Long);//排A个数
       n32:=trunc(Three_Section_value333.Sheet_Width/Three_Section_PNLvalue33.PNLA_Width);//排A个数
       n301:=n31;
       n302:=n32;
       rate30:=n301*n302*Three_Section_PNLvalue33.PNLA_Unit_Long_Number*Three_Section_PNLvalue33.PNLA_Unit_Width_Number;
       if Tem_Calculate_Rate_Type1=1 then  //用单元计算
       begin
         rate30:=n301*n302*Three_Section_PNLvalue33.PNLA_Unit_Long_Number*Three_Section_PNLvalue33.PNLA_Unit_Width_Number*Three_Section_PNLvalue33.PNLA_Unit_Long*Three_Section_PNLvalue33.PNLA_Unit_Width;
         rate30:=rate30/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
       end;

       if Tem_Calculate_Rate_Type1=2 then //用PNL计算
       begin
         rate30:=n301*n302*Three_Section_PNLvalue33.PNLA_Long*Three_Section_PNLvalue33.PNLA_Width;
         rate30:=rate30/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
       end;

       for j31:=1 to n32 do //
       begin
          //剩下部分排A,则方向可调换
           n331:=0;
           n341:=0;
           rate31:=0;
           if (Three_Section_value333.Sheet_Long>=Three_Section_PNLvalue33.PNLA_Width) and
              ((Three_Section_value333.Sheet_Width-j31*Three_Section_PNLvalue33.PNLA_Width)>=Three_Section_PNLvalue33.PNLA_Long) then//剩下部分是否可排A,
           begin
              n331:=trunc(Three_Section_value333.Sheet_Long/Three_Section_PNLvalue33.PNLA_Width);
              n341:=trunc((Three_Section_value333.Sheet_Width-j31*Three_Section_PNLvalue33.PNLA_Width)/Three_Section_PNLvalue33.PNLA_Long);
              rate31:=(n31*j31+n331*n341)*Three_Section_PNLvalue33.PNLA_Unit_Long_Number*Three_Section_PNLvalue33.PNLA_Unit_Width_Number;
              if Tem_Calculate_Rate_Type1=1 then  //用单元计算
              begin
                 rate31:=(n31*j31+n331*n341)*Three_Section_PNLvalue33.PNLA_Unit_Long_Number*Three_Section_PNLvalue33.PNLA_Unit_Width_Number*Three_Section_PNLvalue33.PNLA_Unit_Long*Three_Section_PNLvalue33.PNLA_Unit_Width;
                 rate31:=rate31/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
              end;

              if Tem_Calculate_Rate_Type1=2 then //用PNL计算
              begin
                  rate31:=(n31*j31+n331*n341)*Three_Section_PNLvalue33.PNLA_Long*Three_Section_PNLvalue33.PNLA_Width;
                  rate31:=rate31/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
              end

           end;
          //剩下部分排B,有两种情况,即方向会调换
            n332:=0;
            n342:=0;
            rate32:=0;
           if (Three_Section_value333.Sheet_Long>=Three_Section_PNLvalue33.PNLb_Long) and    //长方向排PNLB长
              ((Three_Section_value333.Sheet_Width-j31*Three_Section_PNLvalue33.PNLA_Width)>=Three_Section_PNLvalue33.PNLb_Width) then//剩下部分是否可排b,
           begin
              n332:=trunc(Three_Section_value333.Sheet_Long/Three_Section_PNLvalue33.PNLb_Long);
              n342:=trunc((Three_Section_value333.Sheet_Width-j31*Three_Section_PNLvalue33.PNLA_Width)/Three_Section_PNLvalue33.PNLb_Width);
              rate32:=n31*j31*Three_Section_PNLvalue33.PNLA_Unit_Long_Number*Three_Section_PNLvalue33.PNLA_Unit_Width_Number+n332*n342*Three_Section_PNLvalue33.PNLb_Unit_Long_Number*Three_Section_PNLvalue33.PNLb_Unit_Width_Number;
              if Tem_Calculate_Rate_Type1=1 then  //用单元计算
              begin
                  rate32:=n31*j31*Three_Section_PNLvalue33.PNLA_Unit_Long_Number*Three_Section_PNLvalue33.PNLA_Unit_Width_Number*Three_Section_PNLvalue33.PNLA_Unit_Long*Three_Section_PNLvalue33.PNLA_Unit_Width
                         +n332*n342*Three_Section_PNLvalue33.PNLb_Unit_Long_Number*Three_Section_PNLvalue33.PNLb_Unit_Width_Number*Three_Section_PNLvalue33.PNLb_Unit_Long*Three_Section_PNLvalue33.PNLb_Unit_Width;
                  rate32:=rate32/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
              end;

              if Tem_Calculate_Rate_Type1=2 then //用PNL计算
              begin
                  rate32:=n31*j31*Three_Section_PNLvalue33.PNLA_Long*Three_Section_PNLvalue33.PNLA_Width
                          +n332*n342*Three_Section_PNLvalue33.PNLb_Long*Three_Section_PNLvalue33.PNLb_Width;
                  rate32:=rate32/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
              end

           end;
           n333:=0;
           n343:=0;
           rate33:=0;
           if (Three_Section_value333.Sheet_Long>=Three_Section_PNLvalue33.PNLb_Width) and //长方向排PNLB宽
              ((three_Section_value333.Sheet_Width-j31*Three_Section_PNLvalue33.PNLA_Width)>=Three_Section_PNLvalue33.PNLb_Long) then//剩下部分是否可排b,
           begin
              n333:=trunc(Three_Section_value333.Sheet_Long/Three_Section_PNLvalue33.PNLb_Width);
              n343:=trunc((Three_Section_value333.Sheet_Width-j31*Three_Section_PNLvalue33.PNLA_Width)/Three_Section_PNLvalue33.PNLb_Long);
              rate33:=n31*j31*Three_Section_PNLvalue33.PNLA_Unit_Long_Number*Three_Section_PNLvalue33.PNLA_Unit_Width_Number+n333*n343*Three_Section_PNLvalue33.PNLb_Unit_Long_Number*Three_Section_PNLvalue33.PNLb_Unit_Width_Number;

              if Tem_Calculate_Rate_Type1=1 then  //用单元计算
              begin
                 rate33:=n31*j31*Three_Section_PNLvalue33.PNLA_Unit_Long_Number*Three_Section_PNLvalue33.PNLA_Unit_Width_Number*Three_Section_PNLvalue33.PNLA_Unit_Long*Three_Section_PNLvalue33.PNLA_Unit_Width
                       +n333*n343*Three_Section_PNLvalue33.PNLb_Unit_Long_Number*Three_Section_PNLvalue33.PNLb_Unit_Width_Number*Three_Section_PNLvalue33.PNLb_Unit_Long*Three_Section_PNLvalue33.PNLb_Unit_Width;//PNL数量
                 rate33:=rate33/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
              end;

              if Tem_Calculate_Rate_Type1=2 then //用PNL计算
              begin
                 rate33:=n31*j31*Three_Section_PNLvalue33.PNLA_Long*Three_Section_PNLvalue33.PNLA_Width
                        +n333*n343*Three_Section_PNLvalue33.PNLb_Long*Three_Section_PNLvalue33.PNLb_Width;
                 rate33:=rate33/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
              end

           end;
           //从 rate1,rate2,rate3中找出最大的
           max31:=max(max(max(rate30,rate31),rate32),rate33);
           if (max31>=tem_rate3)  then
           begin
             tem_rate3:=max31;

             if rate33=max31 then
             begin
              array_type3:=3;
              tempnl_sheet33.Section_LongA:=Three_Section_PNLvalue33.PNLA_Long;
              tempnl_sheet33.Section_WidthA:=Three_Section_PNLvalue33.PNLA_Width;
              tempnl_sheet33.Section_Long_NumberA:=n31;
              tempnl_sheet33.Section_Width_NumberA:=j31;
              tempnl_sheet33.Section_LongB:=Three_Section_PNLvalue33.PNLb_Width;
              tempnl_sheet33.Section_WidthB:=Three_Section_PNLvalue33.PNLb_Long;
              tempnl_sheet33.Section_Long_NumberB:=n333;
              tempnl_sheet33.Section_Width_NumberB:=n343;
              tempnl_sheet33.Section_Unit_Number:=n31*j31*Three_Section_PNLvalue33.PNLA_Unit_Long_Number*Three_Section_PNLvalue33.PNLA_Unit_Width_Number+n333*n343*Three_Section_PNLvalue33.PNLb_Unit_Long_Number*Three_Section_PNLvalue33.PNLb_Unit_Width_Number;

              tv31:=n31*j31; //用于计算PNLA与PNLB的个数不数
              tv32:=n333*n343;
              tempnl_sheet33.Section_PNLA_number:=0;
              tempnl_sheet33.Section_PNLB_number:=0;
              function_result:=Change_pnla_pnlb_number1(value_pnla2,TWO_value_pnla2,tv31,tv32,tempnl_sheet33.Section_PNLA_number,tempnl_sheet33.Section_PNLB_number);

             end;
             if rate32=max31 then
             begin
              array_type3:=2;
              tempnl_sheet33.Section_LongA:=Three_Section_PNLvalue33.PNLA_Long;
              tempnl_sheet33.Section_WidthA:=Three_Section_PNLvalue33.PNLA_Width;
              tempnl_sheet33.Section_Long_NumberA:=n31;
              tempnl_sheet33.Section_Width_NumberA:=j31;
              tempnl_sheet33.Section_LongB:=Three_Section_PNLvalue33.PNLb_Long;
              tempnl_sheet33.Section_WidthB:=Three_Section_PNLvalue33.PNLb_Width;
              tempnl_sheet33.Section_Long_NumberB:=n332;
              tempnl_sheet33.Section_Width_NumberB:=n342;
              tempnl_sheet33.Section_Unit_Number:=n31*j31*Three_Section_PNLvalue33.PNLA_Unit_Long_Number*Three_Section_PNLvalue33.PNLA_Unit_Width_Number+n332*n342*Three_Section_PNLvalue33.PNLb_Unit_Long_Number*Three_Section_PNLvalue33.PNLb_Unit_Width_Number;
              tv31:=n31*j31; //用于计算PNLA与PNLB的个数不数
              tv32:=n332*n342;
              tempnl_sheet33.Section_PNLA_number:=0;
              tempnl_sheet33.Section_PNLB_number:=0;
              function_result:=Change_pnla_pnlb_number1(value_pnla2,TWO_value_pnla2,tv31,tv32,tempnl_sheet33.Section_PNLA_number,tempnl_sheet33.Section_PNLB_number);

             end;
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
              tv31:=n31*j31; //用于计算PNLA与PNLB的个数不数
              tv32:=n331*n341;
              tempnl_sheet33.Section_PNLA_number:=0;
              tempnl_sheet33.Section_PNLB_number:=0;
              function_result:=Change_pnla_pnlb_number1(value_pnla2,TWO_value_pnla2,tv31,tv32,tempnl_sheet33.Section_PNLA_number,tempnl_sheet33.Section_PNLa_number);

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
              tv31:=n301*n302; //用于计算PNLA与PNLB的个数不数
              tv32:=0;
              tempnl_sheet33.Section_PNLA_number:=0;
              tempnl_sheet33.Section_PNLB_number:=0;
              function_result:=Change_pnla_pnlb_number1(value_pnla2,TWO_value_pnla2,tv31,tv32,tempnl_sheet33.Section_PNLA_number,tempnl_sheet33.Section_PNLB_number);

             end;

           end;
       end;
     end;
    //3333333
  end;
//--------------三区


  //处理总单元数
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

   if (FResultCountPerSheet>1) and (FResultCount>FResultCountPerSheet) then
   begin
      Summation_rate:=Result_MakeUp2^[(iSheet+1)*FResultCountPerSheet-1].Using_Rate;
      k:=(iSheet+1)*FResultCountPerSheet-1;
      if Result_MakeUp2^[(iSheet+1)*FResultCountPerSheet-2].Using_Rate<Summation_rate then
      begin
        Summation_rate:=Result_MakeUp2^[(iSheet+1)*FResultCountPerSheet-2].Using_Rate;
        k:=(iSheet+1)*FResultCountPerSheet-2;
      end;
      if Result_MakeUp2^[(iSheet+1)*FResultCountPerSheet-3].Using_Rate<Summation_rate then
      begin
        Summation_rate:=Result_MakeUp2^[(iSheet+1)*FResultCountPerSheet-3].Using_Rate;
        k:=(iSheet+1)*FResultCountPerSheet-3;
      end;
   end else
      k:=iSheet;

  if (Leave_Section_falchion_number1=2) and (FResultCount>FResultCountPerSheet) then
  begin
    result_1:=(round(Summation_rate*10000)<round((tem_rate2+tem_rate3+rate_10)*10000)) or
              ( (round(Summation_rate*10000)=round((tem_rate2+tem_rate3+rate_10)*10000)) and
                  ( ((value_pnla2=1) and (pnl_long_number333*pnl_width_number333+tempnl_sheet22.Section_PNLA_number+tempnl_sheet33.Section_PNLA_number+
                     tempnl_sheet22.Section_PNLb_number+tempnl_sheet33.Section_PNLb_number<Result_MakeUp2^[K].PNLA_number_Per_Sheet+Result_MakeUp2^[K].PNLb_number_Per_Sheet)) or
                    ((value_pnla2=2) and (tempnl_sheet22.Section_PNLA_number+tempnl_sheet33.Section_PNLA_number+
                    pnl_long_number333*pnl_width_number333+tempnl_sheet22.Section_PNLb_number+tempnl_sheet33.Section_PNLb_number<Result_MakeUp2^[K].PNLA_number_Per_Sheet+Result_MakeUp2^[K].PNLb_number_Per_Sheet
                    ))
                   )
              ) ;

    if FResultCountPerSheet>1 then
      result_1:=result_1 and
                (  ( ( (round((tem_rate2+tem_rate3+rate_10)*10000)<>round(Result_MakeUp2^[(iSheet+1)*FResultCountPerSheet-1].Using_Rate*10000)) and
                       (round((tem_rate2+tem_rate3+rate_10)*10000)<>round(Result_MakeUp2^[(iSheet+1)*FResultCountPerSheet-2].Using_Rate*10000)) and
                       (round((tem_rate2+tem_rate3+rate_10)*10000)<>round(Result_MakeUp2^[(iSheet+1)*FResultCountPerSheet-3].Using_Rate*10000)) //or
                     ) or (
                           ( (round((tem_rate2+tem_rate3+rate_10)*10000)=round(Result_MakeUp2^[(iSheet+1)*FResultCountPerSheet-1].Using_Rate*10000)) or
                             (round((tem_rate2+tem_rate3+rate_10)*10000)=round(Result_MakeUp2^[(iSheet+1)*FResultCountPerSheet-2].Using_Rate*10000)) or
                             (round((tem_rate2+tem_rate3+rate_10)*10000)=round(Result_MakeUp2^[(iSheet+1)*FResultCountPerSheet-3].Using_Rate*10000))
                           ) and
                             ( ((value_pnla2=1) and (pnl_long_number333*pnl_width_number333+tempnl_sheet22.Section_PNLA_number+tempnl_sheet33.Section_PNLA_number+
                                tempnl_sheet22.Section_PNLb_number+tempnl_sheet33.Section_PNLb_number<Result_MakeUp2^[K].PNLA_number_Per_Sheet+Result_MakeUp2^[K].PNLb_number_Per_Sheet)) or
                               ((value_pnla2=2) and (tempnl_sheet22.Section_PNLA_number+tempnl_sheet33.Section_PNLA_number+
                                pnl_long_number333*pnl_width_number333+tempnl_sheet22.Section_PNLb_number+tempnl_sheet33.Section_PNLb_number<Result_MakeUp2^[K].PNLA_number_Per_Sheet+Result_MakeUp2^[K].PNLb_number_Per_Sheet)
                             )
                   )
                          )
                   )
                );

  end else if (Leave_Section_falchion_number1=2) and (FResultCountPerSheet=1) then
    result_1:=(round(Summation_rate*10000)<round((tem_rate2+tem_rate3+rate_10)*10000)) or
              ( (round(Summation_rate*10000)=round((tem_rate2+tem_rate3+rate_10)*10000)) and
                  ( ((value_pnla2=1) and (pnl_long_number333*pnl_width_number333+tempnl_sheet22.Section_PNLA_number+tempnl_sheet33.Section_PNLA_number+
                     tempnl_sheet22.Section_PNLb_number+tempnl_sheet33.Section_PNLb_number<Result_MakeUp2^[K].PNLA_number_Per_Sheet+Result_MakeUp2^[K].PNLb_number_Per_Sheet)) or
                    ((value_pnla2=2) and (tempnl_sheet22.Section_PNLA_number+tempnl_sheet33.Section_PNLA_number+
                    pnl_long_number333*pnl_width_number333+tempnl_sheet22.Section_PNLb_number+tempnl_sheet33.Section_PNLb_number<Result_MakeUp2^[K].PNLA_number_Per_Sheet+Result_MakeUp2^[K].PNLb_number_Per_Sheet
                    ))
                   )
              ) ;




   if ((FResultCount<=FResultCountPerSheet) and (FResultCountPerSheet>1)) or result_1 then //利用率比以前的大,则取现在的
   begin
     if (FResultCountPerSheet>1) and (FResultCount<=FResultCountPerSheet) then
     begin
       if (round(Summation_rate*10000)=round((tem_rate2+tem_rate3+rate_10)*10000)) and
          (value332.PNLA_Unit_Long*value332.PNLA_Unit_Width=Result_MakeUp2^[iSheet*FResultCountPerSheet+FResultCount-2].PNLA_Unit_Long*Result_MakeUp2^[iSheet*FResultCountPerSheet+FResultCount-2].PNLA_Unit_Width)
        then exit;
       K:=iSheet*FResultCountPerSheet+FResultCount-1;
       FResultCount:=FResultCount+1;
     end ;
     Summation_rate:=tem_rate2+tem_rate3+rate_10;

       { MaxPnlNumber2:=temMaxPnlNumber2;
        Summation_rate:=tem_rate2+tem_rate3+rate_10;
        TEM_Falchion_Number2:=Falchion_Number1;//
        Falchion_Number1:=TEM_Falchion_Number1;//开刀数量
        }
     if  value_pnla2=1  then
     begin
       Result_MakeUp2^[K].PNLA_number_Per_Sheet:=pnl_long_number333*pnl_width_number333+tempnl_sheet22.Section_PNLA_number+tempnl_sheet33.Section_PNLA_number ;
       Result_MakeUp2^[K].PNLb_number_Per_Sheet:=tempnl_sheet22.Section_PNLb_number+tempnl_sheet33.Section_PNLb_number;
     end;
     if  value_pnla2=2  then
     begin
       Result_MakeUp2^[K].PNLA_number_Per_Sheet:=tempnl_sheet22.Section_PNLA_number+tempnl_sheet33.Section_PNLA_number ;
       Result_MakeUp2^[K].PNLb_number_Per_Sheet:=pnl_long_number333*pnl_width_number333+tempnl_sheet22.Section_PNLb_number+tempnl_sheet33.Section_PNLb_number;
     end;
     //将结果输出,一区用value32,二区用value3,三区用value3,以下输出PNLA与PNLB内容
     Result_MakeUp2^[K].Draw_type:=type333;//用于画图
     Result_MakeUp2^[K].PNLA_Unit_Long:=value332.PNLA_Unit_Long ;
     Result_MakeUp2^[K].PNLA_Unit_Width :=value332.PNLA_Unit_Width ;
     Result_MakeUp2^[K].PNLA_Unit_Long_Space :=value332.PNLA_Unit_Long_Space ;
     Result_MakeUp2^[K].PNLA_Unit_Width_Space :=value332.PNLA_Unit_Width_Space ;
     Result_MakeUp2^[K].PNLA_Unit_Long_ToPNL :=value332.PNLA_Unit_Long_ToPNL ;
     Result_MakeUp2^[K].PNLA_Unit_Width_ToPNL :=value332.PNLA_Unit_Width_ToPNL ;
     Result_MakeUp2^[K].PNLA_Unit_Long_Number :=value332.PNLA_Unit_Long_Number ;
     Result_MakeUp2^[K].PNLA_Unit_Width_Number :=value332.PNLA_Unit_Width_Number ;
     Result_MakeUp2^[K].PNLA_Long :=value332.PNLA_Long  ;
     Result_MakeUp2^[K].PNLA_Width :=value332.PNLA_Width ;

     Result_MakeUp2^[K].PNLb_Unit_Long:=value332.PNLb_Unit_Long ;
     Result_MakeUp2^[K].PNLb_Unit_Width :=value332.PNLb_Unit_Width ;
     Result_MakeUp2^[K].PNLb_Unit_Long_Space :=value332.PNLb_Unit_Long_Space ;
     Result_MakeUp2^[K].PNLb_Unit_Width_Space :=value332.PNLb_Unit_Width_Space ;
     Result_MakeUp2^[K].PNLb_Unit_Long_ToPNL :=value332.PNLb_Unit_Long_ToPNL ;
     Result_MakeUp2^[K].PNLb_Unit_Width_ToPNL :=value332.PNLb_Unit_Width_ToPNL ;
     Result_MakeUp2^[K].PNLb_Unit_Long_Number :=value332.PNLb_Unit_Long_Number ;
     Result_MakeUp2^[K].PNLb_Unit_Width_Number :=value332.PNLb_Unit_Width_Number ;
     Result_MakeUp2^[K].PNLb_Long :=value332.PNLb_Long  ;
     Result_MakeUp2^[K].PNLb_Width :=value332.PNLb_Width ;
     //一区,以下一区内容,
     Result_MakeUp2^[K].One_Section_Long:=value332.PNLA_Long;
     Result_MakeUp2^[K].One_Section_Width:=value332.PNLA_Width;
     Result_MakeUp2^[K].One_Section_Long_Number:=pnl_long_number333;
     Result_MakeUp2^[K].One_Section_Width_Number:=pnl_width_number333;
     Result_MakeUp2^[K].One_Section_Unit_Number:=pnl_long_number333*pnl_width_number333*value332.PNLa_Unit_Long_Number*value332.PNLa_Unit_Width_Number;
      if Two_Section_Draw_value333=2 then
      begin     //调换长宽与长宽个数
         //二区,以下二区内容
        Result_MakeUp2^[K].Two_Section_LongA:=tempnl_sheet22.Section_Widtha;  //
        Result_MakeUp2^[K].Two_Section_WidthA:=tempnl_sheet22.Section_Longa ;
        Result_MakeUp2^[K].Two_Section_Long_NumberA:=tempnl_sheet22.Section_Width_Numbera;
        Result_MakeUp2^[K].Two_Section_Width_NumberA:=tempnl_sheet22.Section_Long_Numbera ;
        Result_MakeUp2^[K].Two_Section_LongB:=tempnl_sheet22.Section_Widthb ;
        Result_MakeUp2^[K].Two_Section_WidthB:=tempnl_sheet22.Section_Longb ;
        Result_MakeUp2^[K].Two_Section_Long_NumberB:=tempnl_sheet22.Section_Width_NumberB;
        Result_MakeUp2^[K].Two_Section_Width_NumberB:=tempnl_sheet22.Section_Long_NumberB;
        Result_MakeUp2^[K].Two_Section_Longc:=tempnl_sheet22.Section_Widthc ;
        Result_MakeUp2^[K].Two_Section_Widthc:=tempnl_sheet22.Section_Longc ;
        Result_MakeUp2^[K].Two_Section_Long_Numberc:=tempnl_sheet22.Section_Width_Numberc;
        Result_MakeUp2^[K].Two_Section_Width_Numberc:=tempnl_sheet22.Section_Long_Numberc;
        Result_MakeUp2^[K].Two_Section_Unit_Number:=tempnl_sheet22.Section_Unit_Number;

        Result_MakeUp2^[K].Two_Section_Array_type:=Two_Section_Draw_value333;
      end else  if Two_Section_Draw_value333=1 then
      begin
        //二区,以下二区内容
        Result_MakeUp2^[K].Two_Section_LongA:=tempnl_sheet22.Section_LongA ;
        Result_MakeUp2^[K].Two_Section_WidthA:=tempnl_sheet22.Section_WidthA ;
        Result_MakeUp2^[K].Two_Section_Long_NumberA:=tempnl_sheet22.Section_Long_NumberA ;
        Result_MakeUp2^[K].Two_Section_Width_NumberA:=tempnl_sheet22.Section_Width_NumberA;
        Result_MakeUp2^[K].Two_Section_LongB:=tempnl_sheet22.Section_LongB ;
        Result_MakeUp2^[K].Two_Section_WidthB:=tempnl_sheet22.Section_WidthB ;
        Result_MakeUp2^[K].Two_Section_Long_NumberB:=tempnl_sheet22.Section_Long_NumberB;
        Result_MakeUp2^[K].Two_Section_Width_NumberB:=tempnl_sheet22.Section_Width_NumberB;
        Result_MakeUp2^[K].Two_Section_Longc:=tempnl_sheet22.Section_Longc ;
        Result_MakeUp2^[K].Two_Section_Widthc:=tempnl_sheet22.Section_Widthc ;
        Result_MakeUp2^[K].Two_Section_Long_Numberc:=tempnl_sheet22.Section_Long_NumberB;
        Result_MakeUp2^[K].Two_Section_Width_Numberc:=tempnl_sheet22.Section_Width_Numberc;

        Result_MakeUp2^[K].Two_Section_Unit_Number:=tempnl_sheet22.Section_Unit_Number;
        Result_MakeUp2^[K].Two_Section_Array_type:=Two_Section_Draw_value333;//array_type2;
      end;
      if Three_Section_Draw_value333=2 then
      begin   // 对调长宽与长宽个数
        Result_MakeUp2^[K].three_Section_LongA:=  tempnl_sheet33.Section_WidthA ;
        Result_MakeUp2^[K].three_Section_WidthA:=tempnl_sheet33.Section_LongA ;
        Result_MakeUp2^[K].three_Section_Long_NumberA:=tempnl_sheet33.Section_Width_NumberA;
        Result_MakeUp2^[K].three_Section_Width_NumberA:= tempnl_sheet33.Section_Long_NumberA ;

        Result_MakeUp2^[K].three_Section_LongB:=tempnl_sheet33.Section_WidthB ;
        Result_MakeUp2^[K].three_Section_WidthB:= tempnl_sheet33.Section_LongB ;
        Result_MakeUp2^[K].three_Section_Long_NumberB:=tempnl_sheet33.Section_Width_NumberB;
        Result_MakeUp2^[K].three_Section_Width_NumberB:=tempnl_sheet33.Section_Long_NumberB;

        Result_MakeUp2^[K].three_Section_Longc:=tempnl_sheet33.Section_Widthc ;
        Result_MakeUp2^[K].three_Section_Widthc:= tempnl_sheet33.Section_Longc ;
        Result_MakeUp2^[K].three_Section_Long_Numberc:=tempnl_sheet33.Section_Width_Numberc;
        Result_MakeUp2^[K].three_Section_Width_Numberc:=tempnl_sheet33.Section_Long_Numberc;

        Result_MakeUp2^[K].three_Section_Unit_Number:=tempnl_sheet33.Section_Unit_Number;
        Result_MakeUp2^[K].Three_Section_Array_type:=Three_Section_Draw_value333;//array_type3;
      end else  if Three_Section_Draw_value333=1 then
      begin
        //三区,以下三区内容
        Result_MakeUp2^[K].three_Section_LongA:=tempnl_sheet33.Section_LongA ;
        Result_MakeUp2^[K].three_Section_WidthA:=tempnl_sheet33.Section_WidthA ;
        Result_MakeUp2^[K].three_Section_Long_NumberA:=tempnl_sheet33.Section_Long_NumberA ;
        Result_MakeUp2^[K].three_Section_Width_NumberA:=tempnl_sheet33.Section_Width_NumberA;
        Result_MakeUp2^[K].three_Section_LongB:=tempnl_sheet33.Section_LongB ;
        Result_MakeUp2^[K].three_Section_WidthB:=tempnl_sheet33.Section_WidthB ;
        Result_MakeUp2^[K].three_Section_Long_NumberB:=tempnl_sheet33.Section_Long_NumberB;
        Result_MakeUp2^[K].three_Section_Width_NumberB:=tempnl_sheet33.Section_Width_NumberB;

        Result_MakeUp2^[K].three_Section_Longc:=tempnl_sheet33.Section_Longc ;
        Result_MakeUp2^[K].three_Section_Widthc:=tempnl_sheet33.Section_Widthc ;
        Result_MakeUp2^[K].three_Section_Long_Numberc:=tempnl_sheet33.Section_Long_Numberc;
        Result_MakeUp2^[K].three_Section_Width_Numberc:=tempnl_sheet33.Section_Width_Numberc;

        Result_MakeUp2^[K].three_Section_Unit_Number:=tempnl_sheet33.Section_Unit_Number;
        Result_MakeUp2^[K].Three_Section_Array_type:=Three_Section_Draw_value333;
      end;
     Result_MakeUp2^[K].Sheet_Long:=value333_sheet.Sheet_Long;//大料长
     Result_MakeUp2^[K].Sheet_Width:=value333_sheet.Sheet_Width;//大料宽


     if Tem_Calculate_Rate_Type1=1 then //用单元计算
     begin
       Result_MakeUp2^[K].Pnl_Using_Rate:=Summation_rate;
       Result_MakeUp2^[K].Unit_Using_Rate:=Summation_rate;
       Result_MakeUp2^[K].Using_Rate:=Summation_rate;
     end;
     if Tem_Calculate_Rate_Type1=2 then //用PNL计算
     begin
       Result_MakeUp2^[K].Unit_Using_Rate:=Result_MakeUp2^[K].One_Section_Unit_Number*Result_MakeUp2^[K].two_Section_Unit_Number*Result_MakeUp2^[K].three_Section_Unit_Number*value332.PNLA_Unit_Long*value332.PNLA_Unit_Width/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
       Result_MakeUp2^[K].Pnl_Using_Rate:=Summation_rate;
       Result_MakeUp2^[K].Using_Rate:=Summation_rate;
     end;

     if Tem_Calculate_Rate_Type1=0 then
     begin
          Result_MakeUp2^[K].Pnl_Using_Rate:=Summation_rate;
          Result_MakeUp2^[K].Using_Rate:=Summation_rate*value332.PNLA_Unit_Long*value332.PNLA_Unit_Width/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
          Result_MakeUp2^[K].unit_Using_Rate:=Result_MakeUp2^[K].Using_Rate;
     end;
  end; //1
end;

function TCutSheet2.Calculate_Unit_TwoPNL(var VALUE: TParam_PCB2): BOOLEAN;
VAR
 i1,i1_1,I2,j1,J2,i101,
 n1,n2,n3,n4,N5,N6,N7,N8 :integer;  //最多能排单元个数

 Result_Unit_size,tem_Result_Unit_size:TResult_PNL2;//存放A,B板的排版情况
 function_resul22:boolean;
 sheet_size0:TParam_Sheet2;
 X,Y:currency;
begin

   Result:=false;
   if (VALUE.PNLA_Long_Max<=VALUE.PNLA_Long_Min) or (VALUE.PNLA_Width_Max<=VALUE.PNLA_Width_Min) then
   begin
     showmessage('上下限输入错误!');
     exit;
   end;
   if (VALUE.PNLb_Long_Max<=VALUE.PNLb_Long_Min) or (VALUE.PNLb_Width_Max<=VALUE.PNLb_Width_Min) then
   begin
     showmessage('上下限输入错误!');
     exit;
   end;

   X:=VALUE.Unit_Long_ToPNL;
   Y:=VALUE.Unit_Width_ToPNL;
   while VALUE.Unit_Long_ToPNL>=VALUE.Unit_Long_ToPNL_min  do
   begin
     while VALUE.Unit_Width_ToPNL>=VALUE.Unit_Width_ToPNL_min  do
     begin
       //最多能排单元个数
       n1:=trunc((VALUE.PNLA_Long_Min -2*VALUE.Unit_Long_ToPNL+value.Unit_Long_Space ) / (VALUE.Unit_Long+value.Unit_Long_Space) );
       n2:=trunc((VALUE.PNLA_Long_MAX -2*VALUE.Unit_Long_ToPNL+value.Unit_Long_Space ) / (VALUE.Unit_Long+value.Unit_Long_Space) );
       n3:=trunc((VALUE.PNLA_WIDTH_Min -2*VALUE.Unit_Width_ToPNL +value.Unit_Width_Space ) / (VALUE.Unit_Width+value.Unit_Width_Space) );
       n4:=trunc((VALUE.PNLA_WIDTH_MAX -2*VALUE.Unit_Width_ToPNL+value.Unit_Width_Space ) / (VALUE.Unit_Width+value.Unit_Width_Space) );

       n5:=trunc((VALUE.PNLb_Long_Min -2*VALUE.Unit_Long_ToPNL+value.Unit_Long_Space ) / (VALUE.Unit_Long+value.Unit_Long_Space) );

       n6:=trunc((VALUE.PNLb_Long_MAX -2*VALUE.Unit_Long_ToPNL+value.Unit_Long_Space ) / (VALUE.Unit_Long+value.Unit_Long_Space) );
       n7:=trunc((VALUE.PNLb_WIDTH_Min -2*VALUE.Unit_Width_ToPNL+value.Unit_Width_Space ) / (VALUE.Unit_Width+value.Unit_Width_Space) );
       n8:=trunc((VALUE.PNLb_WIDTH_MAX -2*VALUE.Unit_Width_ToPNL+value.Unit_Width_Space ) / (VALUE.Unit_Width+value.Unit_Width_Space) );

       if (VALUE.PNLA_Long_Min -2*VALUE.Unit_Long_ToPNL+value.Unit_Long_Space ) / (VALUE.Unit_Long+value.Unit_Long_Space)-n1>0 then  n1:=n1+1;

       if (VALUE.PNLA_WIDTH_Min -2*VALUE.Unit_Width_ToPNL+value.Unit_Width_Space ) / (VALUE.Unit_Width+value.Unit_Width_Space)-n3>0 then  n3:=n3+1;

       if (VALUE.PNLb_Long_Min -2*VALUE.Unit_Long_ToPNL+value.Unit_Long_Space ) / (VALUE.Unit_Long+value.Unit_Long_Space)-n5>0 then  n5:=n5+1;

       if (VALUE.PNLb_WIDTH_Min -2*VALUE.Unit_Width_ToPNL+value.Unit_Width_Space ) / (VALUE.Unit_Width+value.Unit_Width_Space)-n7>0 then  n7:=n7+1;

       if  (n1>n2) or (n3>n4) or (n5>n6) or (n7>n8) then
       begin
         i101:=0;
       end  else
       begin
         i101:=1;
       end;
       Calculate_Flag1:=Calculate_Flag1+i101;//用于计算是否可排出后种排法
       if (n1<0)or (n3<0)then
       begin
         showmessage('输入的上下限错误!');
         exit;
       end;
       if (n5<0)or (n7<0)then
       begin
         showmessage('输入的下限错误!');
         exit;
       end;
       for i1:=n1 to n2 do
       begin  //1
         for i2:=n3 to n4 do
         begin   //2
               for j1:=n5 to n6 do
               begin  //3
                  for j2:=n7 to n8 do
                  begin  //4
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

                     Result_Unit_size.PNLb_Unit_Long:=value.Unit_Long;
                     Result_Unit_size.PNLb_Unit_Width:=value.Unit_Width ;
                     Result_Unit_size.PNLb_Unit_Long_Space:=value.Unit_Long_Space ;
                     Result_Unit_size.PNLb_Unit_Width_Space:=value.Unit_Width_Space;
                     Result_Unit_size.PNLb_Unit_Long_ToPNL:=value.Unit_Long_ToPNL ;
                     Result_Unit_size.PNLb_Unit_Width_ToPNL:=value.Unit_Width_ToPNL;
                     Result_Unit_size.PNLb_Unit_Long_Number:=j1;
                     Result_Unit_size.PNLb_Unit_Width_Number:=j2;
                     Result_Unit_size.PNLb_Long:=value.Unit_Long*j1+(j1-1)*value.Unit_Long_Space+2*value.Unit_Long_ToPNL;
                     Result_Unit_size.PNLb_Width:=value.Unit_Width*j2+(j2-1)*value.Unit_Width_Space+2*value.Unit_Width_ToPNL;

                     for i1_1:=low(Param_Sheet2^) to high(Param_Sheet2^) do
                     begin
                       IF (Param_Sheet2^[i1_1].Sheet_Long>0) and (Param_Sheet2^[i1_1].Sheet_Width>0) then //大料长宽大料0,才处理
                       begin
                         //此处调用排PNL函数, Calculate_TwoPNL_Sheet_1,有如下情况:
                         //1.大料长宽对调;2.PNLA与PNLB所有尺寸对调;3.大料长宽对调且PNLA与PNLB所有尺寸对调
                         if  FResultCountPerSheet=1 then
                             Summation_rate:=Result_MakeUp2^[i1_1].Using_Rate
                         else if Result_MakeUp2^[i1_1].Using_Rate=0 then
                            FResultCount:=1;  //一种大料排首次
                         tem_Result_Unit_size:=Result_Unit_size;
                         sheet_size0.Sheet_Long:=Param_Sheet2^[i1_1].Sheet_Long;
                         sheet_size0.Sheet_Width:=Param_Sheet2^[i1_1].Sheet_Width;
                         if (sheet_size0.Sheet_Long>=Result_Unit_size.PNLA_Long ) and (sheet_size0.Sheet_Width>Result_Unit_size.PNLA_Width)then
                              function_resul22:=Calculate_TwoPNL_Sheet_1(tem_Result_Unit_size,sheet_size0,1,i1_1);

                          //对调大料长宽
                          sheet_size0.Sheet_Long:=Param_Sheet2^[i1_1].Sheet_Width ;
                          sheet_size0.Sheet_Width:=Param_Sheet2^[i1_1].Sheet_Long;
                          if (sheet_size0.Sheet_Long>=Result_Unit_size.PNLA_Long ) and (sheet_size0.Sheet_Width>Result_Unit_size.PNLA_Width)then
                              function_resul22:=Calculate_TwoPNL_Sheet_1(tem_Result_Unit_size,sheet_size0,1,i1_1);
                             //对调pnla,pnlb
                             tem_Result_Unit_size.PNLA_Unit_Long:=Result_Unit_size.PNLB_Unit_Long;
                             tem_Result_Unit_size.PNLA_Unit_Width:=Result_Unit_size.PNLb_Unit_Width;
                             tem_Result_Unit_size.PNLA_Unit_Long_Space:=Result_Unit_size.PNLb_Unit_Long_Space;
                             tem_Result_Unit_size.PNLA_Unit_Width_Space:=Result_Unit_size.PNLb_Unit_Width_Space;
                             tem_Result_Unit_size.PNLA_Unit_Long_ToPNL:=Result_Unit_size.PNLb_Unit_Long_ToPNL;
                             tem_Result_Unit_size.PNLA_Unit_Width_ToPNL:=Result_Unit_size.PNLb_Unit_Width_ToPNL;
                             tem_Result_Unit_size.PNLA_Unit_Long_Number:=Result_Unit_size.PNLb_Unit_Long_Number;
                             tem_Result_Unit_size.PNLA_Unit_Width_Number:=Result_Unit_size.PNLb_Unit_Width_Number;
                             tem_Result_Unit_size.PNLA_Long:=Result_Unit_size.PNLB_Long;
                             tem_Result_Unit_size.PNLA_Width:=Result_Unit_size.PNLb_Width;

                             tem_Result_Unit_size.PNLb_Unit_Long:=Result_Unit_size.PNLa_Unit_Long;
                             tem_Result_Unit_size.PNLb_Unit_Width:=Result_Unit_size.PNLA_Unit_Width;
                             tem_Result_Unit_size.PNLb_Unit_Long_Space:=Result_Unit_size.PNLA_Unit_Long_Space;
                             tem_Result_Unit_size.PNLb_Unit_Width_Space:=Result_Unit_size.PNLA_Unit_Width_Space;
                             tem_Result_Unit_size.PNLb_Unit_Long_ToPNL:=Result_Unit_size.PNLA_Unit_Long_ToPNL;
                             tem_Result_Unit_size.PNLb_Unit_Width_ToPNL:=Result_Unit_size.PNLA_Unit_Width_ToPNL;
                             tem_Result_Unit_size.PNLb_Unit_Long_Number:=Result_Unit_size.PNLA_Unit_Long_Number;
                             tem_Result_Unit_size.PNLb_Unit_Width_Number:=Result_Unit_size.PNLA_Unit_Width_Number;
                             tem_Result_Unit_size.PNLb_Long:=Result_Unit_size.PNLa_Long;
                             tem_Result_Unit_size.PNLb_Width:=Result_Unit_size.PNLA_Width;

                             sheet_size0.Sheet_Long:=Param_Sheet2^[i1_1].Sheet_Long;
                             sheet_size0.Sheet_Width:=Param_Sheet2^[i1_1].Sheet_Width;
                             if (sheet_size0.Sheet_Long>=Result_Unit_size.PNLA_Long ) and (sheet_size0.Sheet_Width>Result_Unit_size.PNLA_Width)then
                                 function_resul22:=Calculate_TwoPNL_Sheet_1(tem_Result_Unit_size,sheet_size0,2,i1_1);

                              //对调pnla,pnlb,与对调大料长宽

                              sheet_size0.Sheet_Long:=Param_Sheet2^[i1_1].Sheet_Width ;
                              sheet_size0.Sheet_Width:=Param_Sheet2^[i1_1].Sheet_Long;
                              if (sheet_size0.Sheet_Long>=Result_Unit_size.PNLA_Long ) and (sheet_size0.Sheet_Width>Result_Unit_size.PNLA_Width)then
                                 function_resul22:=Calculate_TwoPNL_Sheet_1(tem_Result_Unit_size,sheet_size0,2,i1_1);


                       end;
                     end;
                  end; //4
               end; //3
         end; //2
       end; //1
       VALUE.Unit_Width_ToPNL:=VALUE.Unit_Width_ToPNL-1;
     end;
     VALUE.Unit_Width_ToPNL:=Y;
     VALUE.Unit_Long_ToPNL:=VALUE.Unit_Long_ToPNL-1;
   end;
   VALUE.Unit_Long_ToPNL:=X;
   VALUE.Unit_Width_ToPNL:=Y;
end;

function TCutSheet2.Get_Calculate_Result_Number: integer;
begin
   Result:=0;
end;

function TCutSheet2.Get_Echange_Unit_To_PNL_Space: boolean;
begin
   Result:=Echange_Unit_To_PNL_Space1;
end;

function TCutSheet2.Get_Echange_Unit_To_Unit_Space: boolean;
begin
    Result:=Echange_Unit_To_Unit_Space1;
end;

function TCutSheet2.Get_Input_PCB_SIZE_TwoPNL_1: TParam_PCB2;
begin
  Result:=Param_PCB2;
end;

function TCutSheet2.Get_Input_Sheet_Size_TwoPNL_1(Index: integer): TParam_Sheet2;
begin
   Result:=Param_Sheet2^[index];
end;

function TCutSheet2.Get_Leave_Section_falchion_number: integer;
begin
   Result:=Leave_Section_falchion_number1;
end;

function TCutSheet2.Get_tresult_makeup_using_Sheet_TwoPNL_1(index: integer): TResult_MakeUp2;
begin
  Result:=Result_MakeUp2^[index];
end;

procedure TCutSheet2.Set_Echange_Unit_To_PNL_Space(
  const Value: boolean);
begin
  Echange_Unit_To_PNL_Space1:=value;
end;

procedure TCutSheet2.Set_Echange_Unit_To_Unit_Space(
  const Value: boolean);
begin
   Echange_Unit_To_Unit_Space1:=value;
end;

procedure TCutSheet2.Set_Input_PCB_SIZE_TwoPNL_1(const Value: TParam_PCB2);
begin
  Param_PCB2:=Value;
end;

procedure TCutSheet2.Set_Input_Sheet_Size_TwoPNL_1(Index: integer; const Value: TParam_Sheet2);
begin
   Param_Sheet2^[index]:=value;
end;

procedure TCutSheet2.Set_Leave_Section_falchion_number1(const Value: integer);
begin
 Leave_Section_falchion_number1:=value;
end;

procedure TCutSheet2.Set_tresult_makeup_using_Sheet_TwoPNL_1(index: integer; const Value: TResult_MakeUp2);
begin
   Result_MakeUp2^[index]:=value;
end;

function TCutSheet2.Get_Calculate_Array_Complete_Percent: TProgressBar;
begin
   Result:=Tem_TProgressBar1;
end;

procedure TCutSheet2.Set_Calculate_Array_Complete_Percent(const Value: TProgressBar);
begin
   Tem_TProgressBar1:=Value;
end;

function TCutSheet2.Get_Calculate_Array_Complete_Time: boolean;
begin
   Result:=Tem_Calculate_Array_Complete_Time_Display;
end;

procedure TCutSheet2.Set_Calculate_Array_Complete_Time(const Value: boolean);
begin
   Tem_Calculate_Array_Complete_Time_Display:=Value;
end;

function TCutSheet2.Get_Tem_Calculate_Rate_Type1: integer;
begin
  Result:=Tem_Calculate_Rate_Type1;
end;

procedure TCutSheet2.Set_Tem_Calculate_Rate_Type1(const Value: integer);
begin
   Tem_Calculate_Rate_Type1:=value;
end;

function TCutSheet2.Get_Calculate_Falchion_Number_Equality_Hold: boolean;
begin
   Result:=Calculate_Falchion_Number_Equality_Hold_1;
end;

procedure TCutSheet2.Set_Calculate_Falchion_Number_Equality_Hold(
  const Value: boolean);
begin
   Calculate_Falchion_Number_Equality_Hold_1:=Value;
end;

function TCutSheet2.Echange_Two_And_Three_Section_Data(var value1: array of TResult_MakeUp2): boolean;
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

function TCutSheet2.Pnla_PnlB_number(var value1: array of TResult_MakeUp2): boolean;
var
i: integer;
begin
   for i:=low(value1) to high(value1) do
   begin
     value1[i].PNLA_number_Per_Sheet:=0;
     value1[i].PNLb_number_Per_Sheet:=0;

     if ((value1[i].one_Section_Long=value1[i].PNLA_Long)  and (value1[i].one_Section_width=value1[i].PNLA_width))
       or ((value1[i].one_Section_Long=value1[i].PNLA_width)  and (value1[i].one_Section_width=value1[i].PNLA_Long))
     then
     begin
        value1[i].PNLA_number_Per_Sheet:=value1[i].one_Section_Long_Number*value1[i].one_Section_width_Number+ value1[i].PNLA_number_Per_Sheet;
     end
     else if ((value1[i].one_Section_Long=value1[i].PNLb_Long)  and (value1[i].one_Section_width=value1[i].PNLb_width))
       or ((value1[i].one_Section_Long=value1[i].PNLb_width)  and (value1[i].one_Section_width=value1[i].PNLb_Long))
     then
     begin
        value1[i].PNLb_number_Per_Sheet:=value1[i].one_Section_Long_Number*value1[i].one_Section_width_Number+ value1[i].PNLb_number_Per_Sheet;
     end;

     if ((value1[i].Two_Section_LongA=value1[i].PNLA_Long)  and (value1[i].Two_Section_WidthA=value1[i].PNLA_width))
       or ((value1[i].Two_Section_LongA=value1[i].PNLA_width)  and (value1[i].Two_Section_WidthA=value1[i].PNLA_Long))
     then
     begin
        value1[i].PNLA_number_Per_Sheet:=value1[i].Two_Section_Long_NumberA*value1[i].Two_Section_width_NumberA+ value1[i].PNLA_number_Per_Sheet;
     end
     else if ((value1[i].Two_Section_LongA=value1[i].PNLb_Long)  and (value1[i].Two_Section_WidthA=value1[i].PNLb_width))
       or ((value1[i].Two_Section_LongA=value1[i].PNLb_width)  and (value1[i].Two_Section_WidthA=value1[i].PNLb_Long))
     then
     begin
        value1[i].PNLb_number_Per_Sheet:=value1[i].Two_Section_Long_NumberA*value1[i].Two_Section_width_NumberA+ value1[i].PNLb_number_Per_Sheet;
     end;
     if ((value1[i].Two_Section_Longb=value1[i].PNLA_Long)  and (value1[i].Two_Section_Widthb=value1[i].PNLA_width))
       or ((value1[i].Two_Section_Longb=value1[i].PNLA_width)  and (value1[i].Two_Section_Widthb=value1[i].PNLA_Long))
     then
     begin
        value1[i].PNLA_number_Per_Sheet:=value1[i].Two_Section_Long_Numberb*value1[i].Two_Section_width_Numberb+ value1[i].PNLA_number_Per_Sheet;
     end
     else if ((value1[i].Two_Section_Longb=value1[i].PNLb_Long)  and (value1[i].Two_Section_Widthb=value1[i].PNLb_width))
       or ((value1[i].Two_Section_Longb=value1[i].PNLb_width)  and (value1[i].Two_Section_Widthb=value1[i].PNLb_Long))
     then
     begin
        value1[i].PNLb_number_Per_Sheet:=value1[i].Two_Section_Long_Numberb*value1[i].Two_Section_width_Numberb+ value1[i].PNLb_number_Per_Sheet;
     end;

     if ((value1[i].Three_Section_LongA=value1[i].PNLA_Long)  and (value1[i].Three_Section_WidthA=value1[i].PNLA_width))
       or ((value1[i].Three_Section_LongA=value1[i].PNLA_width)  and (value1[i].Three_Section_WidthA=value1[i].PNLA_Long))
     then
     begin
        value1[i].PNLA_number_Per_Sheet:=value1[i].Three_Section_Long_NumberA*value1[i].Three_Section_width_NumberA+ value1[i].PNLA_number_Per_Sheet;
     end
     else if ((value1[i].Three_Section_LongA=value1[i].PNLb_Long)  and (value1[i].Three_Section_WidthA=value1[i].PNLb_width))
       or ((value1[i].Three_Section_LongA=value1[i].PNLb_width)  and (value1[i].Three_Section_WidthA=value1[i].PNLb_Long))
     then
     begin
        value1[i].PNLb_number_Per_Sheet:=value1[i].Three_Section_Long_NumberA*value1[i].Three_Section_width_NumberA+ value1[i].PNLb_number_Per_Sheet;
     end;
     if ((value1[i].Three_Section_Longb=value1[i].PNLA_Long)  and (value1[i].Three_Section_Widthb=value1[i].PNLA_width))
       or ((value1[i].Three_Section_Longb=value1[i].PNLA_width)  and (value1[i].Three_Section_Widthb=value1[i].PNLA_Long))
     then
     begin
        value1[i].PNLA_number_Per_Sheet:=value1[i].Three_Section_Long_Numberb*value1[i].Three_Section_width_Numberb+ value1[i].PNLA_number_Per_Sheet;
     end
     else if ((value1[i].Three_Section_Longb=value1[i].PNLb_Long)  and (value1[i].Three_Section_Widthb=value1[i].PNLb_width))
       or ((value1[i].Three_Section_Longb=value1[i].PNLb_width)  and (value1[i].Three_Section_Widthb=value1[i].PNLb_Long))
     then
     begin
        value1[i].PNLb_number_Per_Sheet:=value1[i].Three_Section_Long_Numberb*value1[i].Three_Section_width_Numberb+ value1[i].PNLb_number_Per_Sheet;
     end;
   end;
end;


function TCutSheet2.Change_pnla_pnlb_number1(const  PnlA2, PnlB2,valuen1,valuen2: integer; var Two_pnlA2,Two_PnlB2: integer): BOOLEAN;
begin
   Result:=FALSE;
    if PnlA2=1 then //一区为PNLA  新增
    begin
        if PnlB2=1 then
        begin
             Two_pnlA2:=Two_pnlA2+valuen1;
             Two_PnlB2:=Two_PnlB2+valuen2;
        end;
        if PnlB2=2 then
        begin
             Two_pnlA2:=Two_pnlA2+valuen2;
             Two_PnlB2:=Two_PnlB2+valuen1;
        end;
    end;
    if PnlA2=2 then //一区为PNLB 新增
    begin
        if PnlB2=1 THEN
        BEGIN
             Two_pnlA2:=Two_pnlA2+valuen2;
             Two_PnlB2:=Two_PnlB2+valuen1;
        end;
        if PnlB2=2 THEN
        BEGIN
             Two_pnlA2:=Two_pnlA2+valuen1;
             Two_PnlB2:=Two_PnlB2+valuen2;
        end;
    end;
    Result:=true;
end;

function TCutSheet2.Get_Change_PNL_Long_Width: boolean;
begin
    result:=Change_PNL_Long_Width1;
end;

function TCutSheet2.Get_No_Calculate_Falchion_Number: boolean;
begin
    result:=No_Calculate_Falchion_Number1;
end;

procedure TCutSheet2.Set_Change_PNL_Long_Width(const Value: boolean);
begin
   Change_PNL_Long_Width1:=value;
end;

procedure TCutSheet2.Set_No_Calculate_Falchion_Number(const Value: boolean);
begin
   No_Calculate_Falchion_Number1:=value;
end;

constructor TCutSheet2.Create(ASheet: PAParam_Sheet2;
  AResult_MakeUp: PAResult_MakeUp2;iResultCountPerSheet:integer);
begin
  inherited Create;
  Param_Sheet2:=ASheet;
  Result_MakeUp2:=AResult_MakeUp;
  FResultCountPerSheet:=iResultCountPerSheet;
end;

procedure TCutSheet2.Sort_Result;
  procedure QuickSort(var A:TAResult_MakeUp2; iLo, iHi: Integer;AscOrd:boolean=true);
  var
    Lo, Hi: Integer;
    Mid:currency;
    T: TResult_MakeUp2;
  begin
    Lo := iLo;
    Hi := iHi;
    Mid := A[(Lo + Hi) div 2].Using_Rate;
    repeat
      if AscOrd then
      begin
        while A[Lo].Using_Rate > Mid do Inc(Lo);
        while A[Hi].Using_Rate < Mid do  Dec(Hi);
      end else begin
        while A[Lo].Using_Rate < Mid do Inc(Lo);
        while A[Hi].Using_Rate > Mid do  Dec(Hi);
      end;
      if Lo <= Hi then
      begin
        T := A[Lo];
        A[Lo]:= A[Hi];
        A[Hi]:= T;
        Inc(Lo);
        Dec(Hi);
      end;
    until Lo > Hi;
    if Hi > iLo then QuickSort(A, iLo, Hi);
    if Lo < iHi then QuickSort(A, Lo, iHi);
  end;
begin
  QuickSort(Result_MakeUp2^,Low(Result_MakeUp2^), High(Result_MakeUp2^));
end;

end.
