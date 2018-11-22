unit Spell;

interface
uses
  Messages,SysUtils,StdCtrls,Dialogs,ExtCtrls,math,Graphics,wintypes,ComCtrls;

TYPE

   TParam_Set=record//输入的SET信息
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

   TParam_PNLInfo=record //知道PNL内容
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
   TParam_PCB=record
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
     end;


     PAParam_Sheet=^TAParam_Sheet;
     PAResult_MakeUp=^TAResult_MakeUp;

   //用于存大料数组
   TParam_Sheet=record
       Sheet_Long:currency;
       Sheet_Width:currency;
   end;
   TAParam_Sheet=array of TParam_Sheet;

    //存入计算后的结果
   TResult_MakeUp=record
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
      TAResult_MakeUp=array of TResult_MakeUp;

   //临时存放PNL结果,用于存放函数的返回值
    TResult_PNL=record
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

   TCutSheet= class(Tobject)
   private
       unit_to_set_pnl_sheet1:integer;//用于计算是否是要计算从单元排SET再排PNL最后排开料图,1时是
       PNL_Informat33:TParam_PNLInfo;//用于存知道PNL内容的变量
       Input_Set_Size_OnePNL_1:TParam_Set;//用于存SET内容,间距,边距,长宽上下限
       Echange_Unit_To_Unit_Space1:boolean ;  //允许单元长宽间距调换 默认为不调换
       Echange_Unit_To_PNL_Space1:boolean;    //允许单元边距调换 默认为不调换
       Leave_Section_falchion_number1:integer;//剩下开刀数量,=2只允许两个区=3允许三个区
       Summation_rate:real;                 //总利用率
       Tem_Calculate_Rate_Type1:Integer;//计算利用率的方法,1用单元尺寸计算,单元尺寸乘以单元总数再除以大料尺寸;2用PNL尺寸计算,PNL尺寸乘以PNL总个数再除以大料尺寸
       Input_Sheet_Size_OnePNL:PAParam_Sheet;  //存放输入的大料数组
       Input_PCB_SIZE_OnePNL:TParam_PCB;//存放输入的尺寸,为记录型,单元长,宽,间距,边宽,上下限
       PAResult_MakeUp:PAResult_MakeUp; //存放计算后的结果值
       Tem_TProgressBar1:TProgressBar;//用于存放TProgressBar控件,要显示的进度条
       Tem_Calculate_Array_Complete_Time_Display:boolean;//是否显示计算所要的时间
       Falchion_Number1:INTEGER;//开刀数量
       Calculate_Falchion_Number_Equality_Hold_1:boolean;//用于定义是否保留相等的开刀数量
       Calculate_Flag1:integer;//是否进入计算,即可否可以排出一个及一个以上排版
       Change_PNL_Long_Width1:boolean;         //上下限与PNL长宽对应关系
       No_Calculate_Falchion_Number1:boolean;         //不计算刀数

       FResultCountPerSheet:integer;
       FResultCount,FA:integer;

     procedure Sort_Result;
     function Calculate_Unit_To_Set(const Value_Input_Set_Size_OnePNL_1:TParam_Set;VAR Value_Input_PCB_SIZE_OnePNL_1:TParam_PCB):boolean;//从单元到SET
     function PNL_To_SHEET_999():Boolean;//用于PNL排开料图,PNL一定,可用于开余料

     //将二区的PNLA的尺寸迟改为与一区的长宽相等的内容
     function Echange_Two_And_Three_Section_Data(var value1:ARRAY OF TResult_MakeUp):boolean;

     function Calculate_Unit_OnePNL(var VALUE:TParam_PCB):BOOLEAN; //从单元排PNL
     function Calculate_OnePNL_Sheet_1(const value2:TResult_PNL;const value22:TParam_Sheet;iSheet:integer=0):boolean;//从PNL到SHEET
     function Calculate_OnePNL_Sheet_2(const value332,One_Section_PNLvalue33,Three_Section_PNLvalue33:TResult_PNL;const value333_sheet,Two_Section_value333,Three_Section_value333:TParam_Sheet;pnl_long_number3331,pnl_width_number3331,type333,Two_Section_Draw_value333,Three_Section_Draw_value333:integer;iSheet:integer=0):boolean;//从PNL到SHEET

      //用于返回计算的结果个数
    function Get_Calculate_Result_Number: integer;
    function Get_Input_PCB_SIZE_OnePNL_1: TParam_PCB;
    function Get_Input_Sheet_Size_OnePNL_1(Index: integer): TParam_Sheet;
    procedure Set_Input_PCB_SIZE_OnePNL_1(const Value: TParam_PCB);
    procedure Set_Input_Sheet_Size_OnePNL_1(Index: integer;const Value: TParam_Sheet);
    procedure Set_tresult_makeup_using_Sheet_OnePNL_1(index: integer;const Value: TResult_MakeUp);
    function Get_tresult_makeup_using_Sheet_OnePNL_1(index: integer): TResult_MakeUp;
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
    function Get_PNL_Informat3311: TParam_PNLInfo;
    procedure Set_PNL_Informat3311(const Value: TParam_PNLInfo);
    function Get_Input_Set_Size_OnePNL_1111: TParam_Set;
    procedure Set_Input_Set_Size_OnePNL_1111(const Value: TParam_Set);
    function Get_Change_PNL_Long_Width: boolean;
    procedure Set_Change_PNL_Long_Width(const Value: boolean);
    function Get_No_Calculate_Falchion_Number: boolean;
    procedure Set_No_Calculate_Falchion_Number(const Value: boolean);
   public
      constructor Create(ASheet:PAParam_Sheet;AResult_MakeUp:PAResult_MakeUp;iResultCountPerSheet:integer); overload;
      procedure Calculate_SetToPnlToSheet_Array;
      procedure Calculate_PnlToSheet_Array();
      procedure Calculate_Array();
       //剩下的区域允许分几个区,2:两个区;3:三个区,
       property Leave_Section_falchion_number:integer read Get_Leave_Section_falchion_number write Set_Leave_Section_falchion_number1;
       //大料尺寸属性,最大50,从0开始
       property  Input_Sheet_Size[Index:integer]:TParam_Sheet Read Get_Input_Sheet_Size_OnePNL_1 Write Set_Input_Sheet_Size_OnePNL_1;
       //存放输入的尺寸,为记录型,单元长,宽,间距,边宽,上下限
       property Input_PCB_SIZE:TParam_PCB read Get_Input_PCB_SIZE_OnePNL_1 WRITE Set_Input_PCB_SIZE_OnePNL_1;
       //用于返回计算结果
       property Calculate_Result[index:integer]:TResult_MakeUp Read Get_tresult_makeup_using_Sheet_OnePNL_1 Write Set_tresult_makeup_using_Sheet_OnePNL_1;
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
       property Calculate_Rate_Type:integer read Get_Tem_Calculate_Rate_Type1 write Set_Tem_Calculate_Rate_Type1;
       //是否保存刀数相等的
       property   Calculate_Falchion_Number_Equality_Hold:boolean READ Get_Calculate_Falchion_Number_Equality_Hold write Set_Calculate_Falchion_Number_Equality_Hold;
       //得到PNL的内容
       property   PNL_Informat:TParam_PNLInfo read Get_PNL_Informat3311 WRITE Set_PNL_Informat3311;
       //得到SET的要求
       property Input_Set_Size_OnePNL:TParam_Set Read Get_Input_Set_Size_OnePNL_1111 write Set_Input_Set_Size_OnePNL_1111;
       //允许改PNL长宽上下限
       property  Change_PNL_Long_Width:boolean read  Get_Change_PNL_Long_Width write Set_Change_PNL_Long_Width;
       //不计算刀数
       property  No_Calculate_Falchion_Number:boolean  read Get_No_Calculate_Falchion_Number write Set_No_Calculate_Falchion_Number;
   end;
   
var
  CutSheet:TCutSheet;


implementation

procedure TCutSheet.Calculate_Array;
var
  tem_Input_PCB_SIZE_OnePNL:TParam_PCB;
  TProgressBar1_Position1,tem1:integer;
begin
   Summation_rate:=0;
   Falchion_Number1:=100;//开刀数量
   Tem_TProgressBar1.Min:=0;
   Tem_TProgressBar1.max:=100;
   TProgressBar1_Position1:=2;
   if Change_PNL_Long_Width1=false then TProgressBar1_Position1:=1;
   Calculate_Flag1:=0;
   if Echange_Unit_To_Unit_Space1 then
   begin
      if Change_PNL_Long_Width1=false then
        TProgressBar1_Position1:=1+TProgressBar1_Position1
      else
        TProgressBar1_Position1:=2+TProgressBar1_Position1;
   end;
   if Echange_Unit_To_PNL_Space1 then
   begin
      if Change_PNL_Long_Width1=false then
        TProgressBar1_Position1:=1+TProgressBar1_Position1
      else
        TProgressBar1_Position1:=2+TProgressBar1_Position1;
   end;
   if (Echange_Unit_To_PNL_Space1) and (Echange_Unit_To_Unit_Space1) then
   begin
      if Change_PNL_Long_Width1=false then
        TProgressBar1_Position1:=1+TProgressBar1_Position1
      else
        TProgressBar1_Position1:=2+TProgressBar1_Position1;
   end;
   tem1:=0;
   if Leave_Section_falchion_number1=0 then Leave_Section_falchion_number1:=2; //没有输入排版方法时,默认为:2,二三区只可以有两部分
   Tem_TProgressBar1.Position:=1;
   //if Tem_Calculate_Rate_Type1=0 then Tem_Calculate_Rate_Type1:=1;//没有输入计算利用率的方法时,默认为:1,以单元计算.

   tem_Input_PCB_SIZE_OnePNL:=Input_PCB_SIZE_OnePNL;
   Calculate_Unit_OnePNL(tem_Input_PCB_SIZE_OnePNL);

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
     Calculate_Unit_OnePNL(tem_Input_PCB_SIZE_OnePNL);
     tem1:=tem1+1;
     Tem_TProgressBar1.Position:=trunc(tem1*100/TProgressBar1_Position1);
   end;
   //允许单元长宽间距调换 默认为不调换  将单元间距交换再调用上面的函数
   if Echange_Unit_To_Unit_Space1 then
   begin
     tem_Input_PCB_SIZE_OnePNL:=Input_PCB_SIZE_OnePNL;
     tem_Input_PCB_SIZE_OnePNL.Unit_Long_Space:=Input_PCB_SIZE_OnePNL.Unit_Width_Space;
     tem_Input_PCB_SIZE_OnePNL.Unit_Width_Space:=Input_PCB_SIZE_OnePNL.Unit_Long_Space;
     Calculate_Unit_OnePNL(tem_Input_PCB_SIZE_OnePNL);
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
       Calculate_Unit_OnePNL(tem_Input_PCB_SIZE_OnePNL);
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
     Calculate_Unit_OnePNL(tem_Input_PCB_SIZE_OnePNL);
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
       Calculate_Unit_OnePNL(tem_Input_PCB_SIZE_OnePNL);
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
     Calculate_Unit_OnePNL(tem_Input_PCB_SIZE_OnePNL);
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
     Calculate_Unit_OnePNL(tem_Input_PCB_SIZE_OnePNL);
     tem1:=tem1+1;
     Tem_TProgressBar1.Position:=trunc(tem1*100/TProgressBar1_Position1);
     end;
   end;
   Echange_Two_And_Three_Section_Data(PAResult_MakeUp^);
   if Calculate_Flag1=0 then  showmessage('请改大上下限范围!请检查!') else Sort_Result;

end;

procedure TCutSheet.Calculate_Array_Complete_Percent_2(
  V_ProgressBar1: TProgressBar; V_ProgressBar1_Position: INTEGER);
begin
  V_ProgressBar1.Position:=V_ProgressBar1_Position;
end;

procedure TCutSheet.Calculate_Array_Complete_Percent_1(
          V_ProgressBar1: TProgressBar; V_ProgressBar1_Min,V_ProgressBar1_MAX: INTEGER);
begin
  V_ProgressBar1.Min:=V_ProgressBar1_Min;
  V_ProgressBar1.Max:=V_ProgressBar1_MAX;
end;

function TCutSheet.Calculate_OnePNL_Sheet_1(const value2: TResult_PNL;//PNLA与PNLB值
                      const value22:TParam_Sheet;iSheet:integer=0): boolean;  //大料长宽
var
  i10,j10,n10,n11:integer;   //用于记录最大能排PNL个数
  function_result001:boolean;
  tepvalue2,tepvalue3:TResult_PNL;
  tem_Sheet_Size_OnePNL2,tem_Sheet_Size_OnePNL3:TParam_Sheet;
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
           function_result001:=Calculate_OnePNL_Sheet_2(value2,tepvalue2,tepvalue3,value22,tem_Sheet_Size_OnePNL2,tem_Sheet_Size_OnePNL3,i10,j10,1,1,1,iSheet);

           //对调二区长宽
           tem_Sheet_Size_OnePNL2.Sheet_Long:=value22.Sheet_Width;//二区长
           tem_Sheet_Size_OnePNL2.Sheet_Width:= value22.Sheet_Long-i10*value2.PNLA_Long;//二区宽
           tem_Sheet_Size_OnePNL3.Sheet_Long:=i10*value2.PNLA_Long;//三区长
           tem_Sheet_Size_OnePNL3.Sheet_Width:=value22.Sheet_Width-j10*value2.PNLA_Width;//三区宽
           tepvalue2:=value2; //用于对调
           tepvalue3:=value2;
           function_result001:=Calculate_OnePNL_Sheet_2(value2,tepvalue2,tepvalue3,value22,tem_Sheet_Size_OnePNL2,tem_Sheet_Size_OnePNL3,i10,j10,1,2,1,iSheet);
           //对调三区长宽
           tem_Sheet_Size_OnePNL2.Sheet_Long:=value22.Sheet_Long-i10*value2.PNLA_Long;//二区长
           tem_Sheet_Size_OnePNL2.Sheet_Width:=value22.Sheet_Width ;//二区宽
           tem_Sheet_Size_OnePNL3.Sheet_Long:=value22.Sheet_Width-j10*value2.PNLA_Width;//三区长
           tem_Sheet_Size_OnePNL3.Sheet_Width:=i10*value2.PNLA_Long;//三区宽
           tepvalue2:=value2; //用于对调
           tepvalue3:=value2;
           function_result001:=Calculate_OnePNL_Sheet_2(value2,tepvalue2,tepvalue3,value22,tem_Sheet_Size_OnePNL2,tem_Sheet_Size_OnePNL3,i10,j10,1,1,2,iSheet);
           //对调二区,三区长宽
           tem_Sheet_Size_OnePNL2.Sheet_Long:=value22.Sheet_Width;//二区长
           tem_Sheet_Size_OnePNL2.Sheet_Width:= value22.Sheet_Long-i10*value2.PNLA_Long;//二区宽
           tem_Sheet_Size_OnePNL3.Sheet_Long:=value22.Sheet_Width-j10*value2.PNLA_Width;//三区长
           tem_Sheet_Size_OnePNL3.Sheet_Width:=i10*value2.PNLA_Long;//三区宽
           tepvalue2:=value2; //用于对调
           tepvalue3:=value2;
           function_result001:=Calculate_OnePNL_Sheet_2(value2,tepvalue2,tepvalue3,value22,tem_Sheet_Size_OnePNL2,tem_Sheet_Size_OnePNL3,i10,j10,1,2,2,iSheet);

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
           function_result001:=Calculate_OnePNL_Sheet_2(value2,tepvalue2,tepvalue3,value22,tem_Sheet_Size_OnePNL2,tem_Sheet_Size_OnePNL3,i10,j10,2,1,1,iSheet);
           //对调二区长宽
           tem_Sheet_Size_OnePNL2.Sheet_Long:=j10*value2.PNLA_Width;//二区长
           tem_Sheet_Size_OnePNL2.Sheet_Width:=value22.Sheet_Long-i10*value2.PNLA_Long ;//二区宽 value22.Sheet_Width
           tem_Sheet_Size_OnePNL3.Sheet_Long:=value22.Sheet_Long;//i10*value2.PNLA_Long;//三区长
           tem_Sheet_Size_OnePNL3.Sheet_Width:=value22.Sheet_Width-j10*value2.PNLA_Width;//三区宽

           tepvalue2:=value2; //用于对调
           tepvalue3:=value2;
           function_result001:=Calculate_OnePNL_Sheet_2(value2,tepvalue2,tepvalue3,value22,tem_Sheet_Size_OnePNL2,tem_Sheet_Size_OnePNL3,i10,j10,2,2,1,iSheet);
           //对调三区长宽
           tem_Sheet_Size_OnePNL2.Sheet_Long:=value22.Sheet_Long-i10*value2.PNLA_Long;//二区长
           tem_Sheet_Size_OnePNL2.Sheet_Width:=j10*value2.PNLA_Width ;//二区宽 value22.Sheet_Width
           tem_Sheet_Size_OnePNL3.Sheet_Long:=value22.Sheet_Width-j10*value2.PNLA_Width;//i10*value2.PNLA_Long;//三区长
           tem_Sheet_Size_OnePNL3.Sheet_Width:=value22.Sheet_Long;//三区宽

           tepvalue2:=value2; //用于对调
           tepvalue3:=value2;
           function_result001:=Calculate_OnePNL_Sheet_2(value2,tepvalue2,tepvalue3,value22,tem_Sheet_Size_OnePNL2,tem_Sheet_Size_OnePNL3,i10,j10,2,1,2,iSheet);
           //对调二区,三区长宽
           tem_Sheet_Size_OnePNL2.Sheet_Long:=j10*value2.PNLA_Width ;//二区长
           tem_Sheet_Size_OnePNL2.Sheet_Width:=value22.Sheet_Long-i10*value2.PNLA_Long;//二区宽 value22.Sheet_Width
           tem_Sheet_Size_OnePNL3.Sheet_Long:=value22.Sheet_Width-j10*value2.PNLA_Width;//i10*value2.PNLA_Long;//三区长
           tem_Sheet_Size_OnePNL3.Sheet_Width:=value22.Sheet_Long;//三区宽

           tepvalue2:=value2; //用于对调
           tepvalue3:=value2;
           function_result001:=Calculate_OnePNL_Sheet_2(value2,tepvalue2,tepvalue3,value22,tem_Sheet_Size_OnePNL2,tem_Sheet_Size_OnePNL3,i10,j10,2,2,2,iSheet);
//-----------------------------
       end;
    end;
    Result:=true;//函数返回假
  end;
end;

function TCutSheet.Calculate_OnePNL_Sheet_2(
  const value332,One_Section_PNLvalue33,Three_Section_PNLvalue33: TResult_PNL; //value32存放一区的PNLA信息,与PNLB信息,value3存放二,三区的PNLA与PNLB信息
   const  value333_sheet,Two_Section_value333, Three_Section_value333: TParam_Sheet;  //value33_sheet大料长宽,One_Section_value, Three_Section_value:二,三区长宽
  pnl_long_number3331, pnl_width_number3331,type333,Two_Section_Draw_value333,Three_Section_Draw_value333: integer; // pnl_long_number33一区PNLA长个数,pnl_width_number33一区PNLA宽个数,排法
  iSheet:integer=0): boolean;//调用函数时,value3值中和长宽要对调,One_Section_value长宽要对调
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
  k:integer;
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

       for j31:=1 to n32 do
       begin //
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

           end;
       end;
     end;

  end;

//--------------三区

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
      Summation_rate:=PAResult_MakeUp^[(iSheet+1)*FResultCountPerSheet-1].Using_Rate;
      k:=(iSheet+1)*FResultCountPerSheet-1;
      if round(PAResult_MakeUp^[(iSheet+1)*FResultCountPerSheet-2].Using_Rate*100000)<round(Summation_rate*10000) then
      begin
        Summation_rate:=PAResult_MakeUp^[(iSheet+1)*FResultCountPerSheet-2].Using_Rate;
        k:=(iSheet+1)*FResultCountPerSheet-2;
      end;
      if round(PAResult_MakeUp^[(iSheet+1)*FResultCountPerSheet-3].Using_Rate*10000)<round(Summation_rate*10000) then
      begin
        Summation_rate:=PAResult_MakeUp^[(iSheet+1)*FResultCountPerSheet-3].Using_Rate;
        k:=(iSheet+1)*FResultCountPerSheet-3;
      end;
   end else
      k:=iSheet;

  if (Leave_Section_falchion_number1=2) and (FResultCountPerSheet>1) and (FResultCount>FResultCountPerSheet) then
  begin
     result_1:=(round((tem_rate2+tem_rate3+rate_10)*10000)>round(Summation_rate*10000)) or
        ((round((tem_rate2+tem_rate3+rate_10)*10000)=round(Summation_rate*10000)) and (value332.PNLA_Long*value332.PNLA_Width>PAResult_MakeUp^[k].PNLA_Long*PAResult_MakeUp^[k].PNLA_Width)) ;

     if FResultCountPerSheet>1 then
     result_1:=result_1 and (((round((tem_rate2+tem_rate3+rate_10)*10000)<>round(PAResult_MakeUp^[(iSheet+1)*FResultCountPerSheet-1].Using_Rate*10000))
                        and (round((tem_rate2+tem_rate3+rate_10)*10000)<>round(PAResult_MakeUp^[(iSheet+1)*FResultCountPerSheet-2].Using_Rate*10000))
                        and (round((tem_rate2+tem_rate3+rate_10)*10000)<>round(PAResult_MakeUp^[(iSheet+1)*FResultCountPerSheet-3].Using_Rate*10000))) or

                        (((round((tem_rate2+tem_rate3+rate_10)*10000)=round(PAResult_MakeUp^[(iSheet+1)*FResultCountPerSheet-1].Using_Rate*10000)) or
                        (round((tem_rate2+tem_rate3+rate_10)*10000)=round(PAResult_MakeUp^[(iSheet+1)*FResultCountPerSheet-2].Using_Rate*10000)) or
                         (round((tem_rate2+tem_rate3+rate_10)*10000)=round(PAResult_MakeUp^[(iSheet+1)*FResultCountPerSheet-3].Using_Rate*10000))
                          )
                        and (value332.PNLA_Long*value332.PNLA_Width>PAResult_MakeUp^[k].PNLA_Long*PAResult_MakeUp^[k].PNLA_Width))
                        );

  end else if (Leave_Section_falchion_number1=2) and (FResultCountPerSheet=1) then
     result_1:=(round((tem_rate2+tem_rate3+rate_10)*10000)>round(Summation_rate*10000)) or
        ((round((tem_rate2+tem_rate3+rate_10)*10000)=round(Summation_rate*10000)) and (value332.PNLA_Long*value332.PNLA_Width>PAResult_MakeUp^[k].PNLA_Long*PAResult_MakeUp^[k].PNLA_Width)) ;




   if ((FResultCount<=FResultCountPerSheet) and (FResultCountPerSheet>1)) or result_1   then //利用率比以前的大,则取现在的
   begin
     if (FResultCountPerSheet>1) and (FResultCount<=FResultCountPerSheet) then
     begin
       if (round(Summation_rate*10000)=round((tem_rate2+tem_rate3+rate_10)*10000)) and
          (value332.PNLA_Unit_Long*value332.PNLA_Unit_Width=PAResult_MakeUp^[iSheet*FResultCountPerSheet+FResultCount-2].PNLA_Unit_Long*PAResult_MakeUp^[iSheet*FResultCountPerSheet+FResultCount-2].PNLA_Unit_Width)
        then exit;
       K:=iSheet*FResultCountPerSheet+FResultCount-1;
       FResultCount:=FResultCount+1;
     end ;
     Summation_rate:=tem_rate2+tem_rate3+rate_10;

     //将结果输出,一区用value32,二区用value3,三区用value3,以下输出PNLA与PNLB内容
     PAResult_MakeUp^[K].Draw_type:=type333;//用于画图
     PAResult_MakeUp^[k].PNLA_Unit_Long:=value332.PNLA_Unit_Long ;
     PAResult_MakeUp^[k].PNLA_Unit_Width :=value332.PNLA_Unit_Width ;
     PAResult_MakeUp^[k].PNLA_Unit_Long_Space :=value332.PNLA_Unit_Long_Space ;
     PAResult_MakeUp^[k].PNLA_Unit_Width_Space :=value332.PNLA_Unit_Width_Space ;

     PAResult_MakeUp^[k].PNLA_Unit_Long_ToPNL :=value332.PNLA_Unit_Long_ToPNL ;
     PAResult_MakeUp^[k].PNLA_Unit_Width_ToPNL :=value332.PNLA_Unit_Width_ToPNL ;

     PAResult_MakeUp^[k].PNLA_Unit_Long_Number :=value332.PNLA_Unit_Long_Number ;
     PAResult_MakeUp^[k].PNLA_Unit_Width_Number :=value332.PNLA_Unit_Width_Number ;
     PAResult_MakeUp^[k].PNLA_Long :=value332.PNLA_Long  ;
     PAResult_MakeUp^[k].PNLA_Width :=value332.PNLA_Width ;

     //一区,以下一区内容,
     PAResult_MakeUp^[k].One_Section_Long:=value332.PNLA_Long;
     PAResult_MakeUp^[k].One_Section_Width:=value332.PNLA_Width;
     PAResult_MakeUp^[k].One_Section_Long_Number:=pnl_long_number333;
     PAResult_MakeUp^[k].One_Section_Width_Number:=pnl_width_number333;
     PAResult_MakeUp^[k].One_Section_Unit_Number:=pnl_long_number333*pnl_width_number333*value332.PNLa_Unit_Long_Number*value332.PNLa_Unit_Width_Number;

      if Two_Section_Draw_value333=2 then
      begin     //调换长宽与长宽个数
         //二区,以下二区内容
        PAResult_MakeUp^[k].Two_Section_LongA:=tempnl_sheet22.Section_Widtha;  //
        PAResult_MakeUp^[k].Two_Section_WidthA:=tempnl_sheet22.Section_Longa ;
        PAResult_MakeUp^[k].Two_Section_Long_NumberA:=tempnl_sheet22.Section_Width_Numbera;
        PAResult_MakeUp^[k].Two_Section_Width_NumberA:=tempnl_sheet22.Section_Long_Numbera ;
        PAResult_MakeUp^[k].Two_Section_LongB:=tempnl_sheet22.Section_Widthb ;
        PAResult_MakeUp^[k].Two_Section_WidthB:=tempnl_sheet22.Section_Longb ;
        PAResult_MakeUp^[k].Two_Section_Long_NumberB:=tempnl_sheet22.Section_Width_NumberB;
        PAResult_MakeUp^[k].Two_Section_Width_NumberB:=tempnl_sheet22.Section_Long_NumberB;
        PAResult_MakeUp^[k].Two_Section_Longc:=tempnl_sheet22.Section_Widthc ;
        PAResult_MakeUp^[k].Two_Section_Widthc:=tempnl_sheet22.Section_Longc ;
        PAResult_MakeUp^[k].Two_Section_Long_Numberc:=tempnl_sheet22.Section_Width_Numberc;
        PAResult_MakeUp^[k].Two_Section_Width_Numberc:=tempnl_sheet22.Section_Long_Numberc;
        PAResult_MakeUp^[k].Two_Section_Unit_Number:=tempnl_sheet22.Section_Unit_Number;

        PAResult_MakeUp^[k].Two_Section_Array_type:=TWO_Section_Draw_value333;
      end else  if Two_Section_Draw_value333=1 then
      begin
        //二区,以下二区内容
        PAResult_MakeUp^[k].Two_Section_LongA:=tempnl_sheet22.Section_LongA ;
        PAResult_MakeUp^[k].Two_Section_WidthA:=tempnl_sheet22.Section_WidthA ;
        PAResult_MakeUp^[k].Two_Section_Long_NumberA:=tempnl_sheet22.Section_Long_NumberA ;
        PAResult_MakeUp^[k].Two_Section_Width_NumberA:=tempnl_sheet22.Section_Width_NumberA;
        PAResult_MakeUp^[k].Two_Section_LongB:=tempnl_sheet22.Section_LongB ;
        PAResult_MakeUp^[k].Two_Section_WidthB:=tempnl_sheet22.Section_WidthB ;
        PAResult_MakeUp^[k].Two_Section_Long_NumberB:=tempnl_sheet22.Section_Long_NumberB;
        PAResult_MakeUp^[k].Two_Section_Width_NumberB:=tempnl_sheet22.Section_Width_NumberB;
        PAResult_MakeUp^[k].Two_Section_Longc:=tempnl_sheet22.Section_Longc ;
        PAResult_MakeUp^[k].Two_Section_Widthc:=tempnl_sheet22.Section_Widthc ;
        PAResult_MakeUp^[k].Two_Section_Long_Numberc:=tempnl_sheet22.Section_Long_NumberB;
        PAResult_MakeUp^[k].Two_Section_Width_Numberc:=tempnl_sheet22.Section_Width_Numberc;

        PAResult_MakeUp^[k].Two_Section_Unit_Number:=tempnl_sheet22.Section_Unit_Number;
        PAResult_MakeUp^[k].Two_Section_Array_type:=Two_Section_Draw_value333;
      end;
      if Three_Section_Draw_value333=2 then
      begin   // 对调长宽与长宽个数
        PAResult_MakeUp^[k].three_Section_LongA:=  tempnl_sheet33.Section_WidthA ;
        PAResult_MakeUp^[k].three_Section_WidthA:=tempnl_sheet33.Section_LongA ;
        PAResult_MakeUp^[k].three_Section_Long_NumberA:=tempnl_sheet33.Section_Width_NumberA;
        PAResult_MakeUp^[k].three_Section_Width_NumberA:= tempnl_sheet33.Section_Long_NumberA ;

        PAResult_MakeUp^[k].three_Section_LongB:=tempnl_sheet33.Section_WidthB ;
        PAResult_MakeUp^[k].three_Section_WidthB:= tempnl_sheet33.Section_LongB ;
        PAResult_MakeUp^[k].three_Section_Long_NumberB:=tempnl_sheet33.Section_Width_NumberB;
        PAResult_MakeUp^[k].three_Section_Width_NumberB:=tempnl_sheet33.Section_Long_NumberB;

        PAResult_MakeUp^[k].three_Section_Longc:=tempnl_sheet33.Section_Widthc ;
        PAResult_MakeUp^[k].three_Section_Widthc:= tempnl_sheet33.Section_Longc ;
        PAResult_MakeUp^[k].three_Section_Long_Numberc:=tempnl_sheet33.Section_Width_Numberc;
        PAResult_MakeUp^[k].three_Section_Width_Numberc:=tempnl_sheet33.Section_Long_Numberc;

        PAResult_MakeUp^[k].three_Section_Unit_Number:=tempnl_sheet33.Section_Unit_Number;
        PAResult_MakeUp^[k].Three_Section_Array_type:=Three_Section_Draw_value333;//array_type3;
      end else  if Three_Section_Draw_value333=1 then
      begin
        //三区,以下三区内容
        PAResult_MakeUp^[k].three_Section_LongA:=tempnl_sheet33.Section_LongA ;
        PAResult_MakeUp^[k].three_Section_WidthA:=tempnl_sheet33.Section_WidthA ;
        PAResult_MakeUp^[k].three_Section_Long_NumberA:=tempnl_sheet33.Section_Long_NumberA ;
        PAResult_MakeUp^[k].three_Section_Width_NumberA:=tempnl_sheet33.Section_Width_NumberA;
        PAResult_MakeUp^[k].three_Section_LongB:=tempnl_sheet33.Section_LongB ;
        PAResult_MakeUp^[k].three_Section_WidthB:=tempnl_sheet33.Section_WidthB ;
        PAResult_MakeUp^[k].three_Section_Long_NumberB:=tempnl_sheet33.Section_Long_NumberB;
        PAResult_MakeUp^[k].three_Section_Width_NumberB:=tempnl_sheet33.Section_Width_NumberB;

        PAResult_MakeUp^[k].three_Section_Longc:=tempnl_sheet33.Section_Longc ;
        PAResult_MakeUp^[k].three_Section_Widthc:=tempnl_sheet33.Section_Widthc ;
        PAResult_MakeUp^[k].three_Section_Long_Numberc:=tempnl_sheet33.Section_Long_Numberc;
        PAResult_MakeUp^[k].three_Section_Width_Numberc:=tempnl_sheet33.Section_Width_Numberc;

        PAResult_MakeUp^[k].three_Section_Unit_Number:=tempnl_sheet33.Section_Unit_Number;
        PAResult_MakeUp^[k].Three_Section_Array_type:=Three_Section_Draw_value333;//array_type3;       //Three_Section_Draw_value333
      end;
     PAResult_MakeUp^[k].Sheet_Long:=value333_sheet.Sheet_Long;//大料长
     PAResult_MakeUp^[k].Sheet_Width:=value333_sheet.Sheet_Width;//大料宽

     PAResult_MakeUp^[k].Using_Rate:=Summation_rate;

    { if Tem_Calculate_Rate_Type1=1 then //用单元计算
     begin
       PAResult_MakeUp^[k].Pnl_Using_Rate:=Summation_rate;
       PAResult_MakeUp^[k].Unit_Using_Rate:=Summation_rate;
       PAResult_MakeUp^[k].Using_Rate:=Summation_rate;
     end;
     if Tem_Calculate_Rate_Type1=2 then //用PNL计算
     begin
       PAResult_MakeUp^[k].Unit_Using_Rate:=PAResult_MakeUp^[iSheet].One_Section_Unit_Number*PAResult_MakeUp^[0].One_Section_Unit_Number*PAResult_MakeUp^[0].three_Section_Unit_Number*value332.PNLA_Unit_Long*value332.PNLA_Unit_Width/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
       PAResult_MakeUp^[k].Pnl_Using_Rate:=Summation_rate;
       PAResult_MakeUp^[k].Using_Rate:=Summation_rate;
     end;

     if Tem_Calculate_Rate_Type1=0 then
     begin
          PAResult_MakeUp^[k].Pnl_Using_Rate:=Summation_rate;
          PAResult_MakeUp^[k].Using_Rate:=Summation_rate*value332.PNLA_Unit_Long*value332.PNLA_Unit_Width/value333_sheet.Sheet_Long/value333_sheet.Sheet_Width;
          PAResult_MakeUp^[k].unit_Using_Rate:=PAResult_MakeUp^[iSheet].Using_Rate;
     end;  }
     unit_to_set_pnl_sheet1:=1;
  end;
end;

function TCutSheet.Calculate_Unit_OnePNL(var VALUE: TParam_PCB): BOOLEAN; //计算单元排PNL
VAR
 i1,i1_1,I2,j1,J2,i101,n1,n2,n3,n4:integer; //最多能排单元个数
 Result_Unit_size,tem_Result_Unit_size:TResult_PNL;//存放A,B板的排版情况
 function_resul22:boolean;
 sheet_size0:TParam_Sheet;
 X,Y:currency;
begin
   Result:=false;
   if (VALUE.PNLA_Long_Max<=VALUE.PNLA_Long_Min) or (VALUE.PNLA_Width_Max<=VALUE.PNLA_Width_Min) then
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
       begin
         for i2:=n3 to n4 do
         begin
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

                     for i1_1:=low(Input_Sheet_Size_OnePNL^) to high(Input_Sheet_Size_OnePNL^) do
                     begin
                       if (Input_Sheet_Size_OnePNL^[i1_1].Sheet_Long>0) and (Input_Sheet_Size_OnePNL^[i1_1].Sheet_Width>0) then //大料长宽大料0,才处理
                       begin
                         //1.大料长宽对调;2.PNLA与PNLB所有尺寸对调;3.大料长宽对调且PNLA与PNLB所有尺寸对调
                         if  FResultCountPerSheet=1 then
                            Summation_rate:=PAResult_MakeUp^[i1_1].Using_Rate
                         else if PAResult_MakeUp^[i1_1].Using_Rate=0 then
                            FResultCount:=1;  //一种大料排首次

                         tem_Result_Unit_size:=Result_Unit_size;
                         sheet_size0.Sheet_Long:=Input_Sheet_Size_OnePNL^[i1_1].Sheet_Long;
                         sheet_size0.Sheet_Width:=Input_Sheet_Size_OnePNL^[i1_1].Sheet_Width;
                         if (sheet_size0.Sheet_Long>=Result_Unit_size.PNLA_Long ) and (sheet_size0.Sheet_Width>Result_Unit_size.PNLA_Width)then
                              function_resul22:=Calculate_OnePNL_Sheet_1(tem_Result_Unit_size,sheet_size0,i1_1);

                          //对调大料长宽
                          tem_Result_Unit_size:=Result_Unit_size;
                          sheet_size0.Sheet_Long:=Input_Sheet_Size_OnePNL^[i1_1].Sheet_Width ;
                          sheet_size0.Sheet_Width:=Input_Sheet_Size_OnePNL^[i1_1].Sheet_Long;
                          if (sheet_size0.Sheet_Long>=Result_Unit_size.PNLA_Long ) and (sheet_size0.Sheet_Width>Result_Unit_size.PNLA_Width)then
                              function_resul22:=Calculate_OnePNL_Sheet_1(tem_Result_Unit_size,sheet_size0,i1_1);
                       end else
                         break;
                     end;

         end;
       end;
       VALUE.Unit_Width_ToPNL:=VALUE.Unit_Width_ToPNL-0.2;
     end;
     VALUE.Unit_Width_ToPNL:=Y;
     VALUE.Unit_Long_ToPNL:=VALUE.Unit_Long_ToPNL-0.2;
   end;
   VALUE.Unit_Long_ToPNL:=X;
   VALUE.Unit_Width_ToPNL:=Y;
end;

function TCutSheet.Get_Calculate_Result_Number: integer;
begin
   Result:=0;
end;

function TCutSheet.Get_Echange_Unit_To_PNL_Space: boolean;
begin
   Result:=Echange_Unit_To_PNL_Space1;
end;

function TCutSheet.Get_Echange_Unit_To_Unit_Space: boolean;
begin
    Result:=Echange_Unit_To_Unit_Space1;
end;

function TCutSheet.Get_Input_PCB_SIZE_OnePNL_1: TParam_PCB;
begin
  Result:=Input_PCB_SIZE_OnePNL;
end;

function TCutSheet.Get_Input_Sheet_Size_OnePNL_1(Index: integer): TParam_Sheet;
begin
   Result:=Input_Sheet_Size_OnePNL^[index];
end;

function TCutSheet.Get_Leave_Section_falchion_number: integer;
begin
   Result:=Leave_Section_falchion_number1;
end;

function TCutSheet.Get_tresult_makeup_using_Sheet_OnePNL_1(index: integer): TResult_MakeUp;
begin
  Result:=PAResult_MakeUp^[index];
end;

procedure TCutSheet.Set_Echange_Unit_To_PNL_Space(const Value: boolean);
begin
  Echange_Unit_To_PNL_Space1:=value;
end;

procedure TCutSheet.Set_Echange_Unit_To_Unit_Space(const Value: boolean);
begin
   Echange_Unit_To_Unit_Space1:=value;
end;

procedure TCutSheet.Set_Input_PCB_SIZE_OnePNL_1(const Value: TParam_PCB);
begin
  Input_PCB_SIZE_OnePNL:=Value;
end;

procedure TCutSheet.Set_Input_Sheet_Size_OnePNL_1(Index: integer; const Value: TParam_Sheet);
begin
   Input_Sheet_Size_OnePNL^[index]:=value;
end;

procedure TCutSheet.Set_Leave_Section_falchion_number1(const Value: integer);
begin
 Leave_Section_falchion_number1:=value;
end;

procedure TCutSheet.Set_tresult_makeup_using_Sheet_OnePNL_1(index: integer; const Value: TResult_MakeUp);
begin
   PAResult_MakeUp^[index]:=value;
end;

function TCutSheet.Get_Calculate_Array_Complete_Percent: TProgressBar;
begin
   Result:=Tem_TProgressBar1;
end;

procedure TCutSheet.Set_Calculate_Array_Complete_Percent(const Value: TProgressBar);
begin
   Tem_TProgressBar1:=Value;
end;

function TCutSheet.Get_Calculate_Array_Complete_Time: boolean;
begin
   Result:=Tem_Calculate_Array_Complete_Time_Display;
end;

procedure TCutSheet.Set_Calculate_Array_Complete_Time(const Value: boolean);
begin
   Tem_Calculate_Array_Complete_Time_Display:=Value;
end;

function TCutSheet.Get_Tem_Calculate_Rate_Type1: integer;
begin
  Result:=Tem_Calculate_Rate_Type1;
end;

procedure TCutSheet.Set_Tem_Calculate_Rate_Type1(const Value: integer);
begin
   Tem_Calculate_Rate_Type1:=value;
end;

function TCutSheet.Get_Calculate_Falchion_Number_Equality_Hold: boolean;
begin
   Result:=Calculate_Falchion_Number_Equality_Hold_1;
end;

procedure TCutSheet.Set_Calculate_Falchion_Number_Equality_Hold(const Value: boolean);
begin
   Calculate_Falchion_Number_Equality_Hold_1:=Value;
end;



function TCutSheet.Echange_Two_And_Three_Section_Data(var
  value1: array of TResult_MakeUp): boolean;//将二区与三区PNLB与一区值相等的内容与二区的PNLA交换一下
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

function TCutSheet.Get_PNL_Informat3311: TParam_PNLInfo;
begin
   Result:=PNL_Informat33;
end;

procedure TCutSheet.Set_PNL_Informat3311(const Value: TParam_PNLInfo);
begin
   PNL_Informat33:=value;
end;

function TCutSheet.PNL_To_SHEET_999(): Boolean;  //用于计算知道PNL内容的大料余料，及其它
var
  i1,i1_1,I2,j1,J2,i101:integer;
  Result_Unit_size,tem_Result_Unit_size:TResult_PNL;//存放A,B板的排版情况
  sheet_size0:TParam_Sheet;
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

   Summation_rate:=0;
     for i1_1:=low(Input_Sheet_Size_OnePNL^) to high(Input_Sheet_Size_OnePNL^) do
     begin
         IF (Input_Sheet_Size_OnePNL^[i1_1].Sheet_Long>0) and (Input_Sheet_Size_OnePNL^[i1_1].Sheet_Width>0) then //大料长宽大料0,才处理
         begin
              tem_Result_Unit_size:=Result_Unit_size;
              sheet_size0.Sheet_Long:=Input_Sheet_Size_OnePNL^[i1_1].Sheet_Long;
              sheet_size0.Sheet_Width:=Input_Sheet_Size_OnePNL^[i1_1].Sheet_Width;
              if (sheet_size0.Sheet_Long>=Result_Unit_size.PNLA_Long ) and (sheet_size0.Sheet_Width>Result_Unit_size.PNLA_Width)then
                 function_resul22:=Calculate_OnePNL_Sheet_1(tem_Result_Unit_size,sheet_size0,i1_1);

                      //对调大料长宽
              sheet_size0.Sheet_Long:=Input_Sheet_Size_OnePNL^[i1_1].Sheet_Width ;
              sheet_size0.Sheet_Width:=Input_Sheet_Size_OnePNL^[i1_1].Sheet_Long;
              if (sheet_size0.Sheet_Long>=Result_Unit_size.PNLA_Long ) and (sheet_size0.Sheet_Width>Result_Unit_size.PNLA_Width)then
                 function_resul22:=Calculate_OnePNL_Sheet_1(tem_Result_Unit_size,sheet_size0,i1_1);
         end;
     end;
end;

procedure TCutSheet.Calculate_PnlToSheet_Array;
var
  function_resule1:boolean;
begin
   Summation_rate:=0;
   Falchion_Number1:=100;//开刀数量
   Calculate_Flag1:=0;
   if Leave_Section_falchion_number1=0 then Leave_Section_falchion_number1:=2; //没有输入排版方法时,默认为:2,二三区只可以有两部分
   PNL_To_SHEET_999;
   function_resule1:=Echange_Two_And_Three_Section_Data(PAResult_MakeUp^);
end;

procedure TCutSheet.Calculate_SetToPnlToSheet_Array;
var //从单元到SET到PNL到SHEET
  i,j:integer;
  function_resule1:boolean;
  tem_timeTime1,tem_timeTime2,tem_timeTime3: TDateTime;
  TProgressBar1_Position1,tem1:integer;
begin
   tem_timeTime1:=Time;
   Summation_rate:=0;
   Falchion_Number1:=100;//开刀数量
   Tem_TProgressBar1.Min:=0;
   Tem_TProgressBar1.max:=100;
   TProgressBar1_Position1:=2;
   Calculate_Flag1:=0;
   if Echange_Unit_To_Unit_Space1 then
      TProgressBar1_Position1:=2+TProgressBar1_Position1;
   if Echange_Unit_To_PNL_Space1 then
     TProgressBar1_Position1:=2+TProgressBar1_Position1;
   if (Echange_Unit_To_PNL_Space1) and (Echange_Unit_To_Unit_Space1) then
    TProgressBar1_Position1:=2+TProgressBar1_Position1;
   tem1:=0;
   if Leave_Section_falchion_number1=0 then Leave_Section_falchion_number1:=2; //没有输入排版方法时,默认为:2,二三区只可以有两部分
   //没有输入是否计算开刀数量一样要计算时
   Tem_TProgressBar1.Position:=1;
   //if Tem_Calculate_Rate_Type1=0 then Tem_Calculate_Rate_Type1:=1;//没有输入计算利用率的方法时,默认为:1,以单元计算.
   tem1:=tem1+1;
   Tem_TProgressBar1.Position:=trunc(tem1*100/TProgressBar1_Position1);
   function_resule1:=Echange_Two_And_Three_Section_Data(PAResult_MakeUp^);
end;

function TCutSheet.Get_Input_Set_Size_OnePNL_1111: TParam_Set;
begin
   Result:=Input_Set_Size_OnePNL_1;
end;

procedure TCutSheet.Set_Input_Set_Size_OnePNL_1111(const Value: TParam_Set);
begin
  Input_Set_Size_OnePNL_1:=value;
end;

function TCutSheet.Calculate_Unit_To_Set(
  const Value_Input_Set_Size_OnePNL_1: TParam_Set;
  var Value_Input_PCB_SIZE_OnePNL_1: TParam_PCB): boolean;
var
 i,j,n10,n11,n12,n13:integer; //n10,n11,n12,n13存单元个数
 tem_long ,tem_width:currency;//用于存SET长宽
 function_resule1:boolean;
begin
   Result:=false;
   //计算最大与最小能排的SET内的单元数量
   n10:=trunc((Value_Input_Set_Size_OnePNL_1.Set_Long_Min+Value_Input_Set_Size_OnePNL_1.Unit_Long_Space_ToUnit-Value_Input_Set_Size_OnePNL_1.Unit_Long_Space_Toset_1-Value_Input_Set_Size_OnePNL_1.Unit_Long_Space_Toset_2)/Value_Input_Set_Size_OnePNL_1.Unit_Long);

   n11:=trunc((Value_Input_Set_Size_OnePNL_1.Set_Long_Max+Value_Input_Set_Size_OnePNL_1.Unit_Long_Space_ToUnit-Value_Input_Set_Size_OnePNL_1.Unit_Long_Space_Toset_1-Value_Input_Set_Size_OnePNL_1.Unit_Long_Space_Toset_2)/Value_Input_Set_Size_OnePNL_1.Unit_Long);

   n12:=trunc((Value_Input_Set_Size_OnePNL_1.Set_width_Max+Value_Input_Set_Size_OnePNL_1.Unit_width_Space_ToUnit-Value_Input_Set_Size_OnePNL_1.Unit_width_Space_Toset_1-Value_Input_Set_Size_OnePNL_1.Unit_width_Space_Toset_2)/Value_Input_Set_Size_OnePNL_1.Unit_width);

   n13:=trunc((Value_Input_Set_Size_OnePNL_1.Set_width_Min+Value_Input_Set_Size_OnePNL_1.Unit_width_Space_ToUnit-Value_Input_Set_Size_OnePNL_1.Unit_width_Space_Toset_1-Value_Input_Set_Size_OnePNL_1.Unit_width_Space_Toset_2)/Value_Input_Set_Size_OnePNL_1.Unit_width);

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
            PAResult_MakeUp^[0].Long_SET:=0;
       end;
     end;
   end;
   Result:=true;
end;

function TCutSheet.Get_Change_PNL_Long_Width: boolean;
begin
  Result:=Change_PNL_Long_Width1;
end;

procedure TCutSheet.Set_Change_PNL_Long_Width(  const Value: boolean);
begin
   Change_PNL_Long_Width1:=value;
end;

function TCutSheet.Get_No_Calculate_Falchion_Number: boolean;
begin
  result:=No_Calculate_Falchion_Number1;
end;

procedure TCutSheet.Set_No_Calculate_Falchion_Number(const Value: boolean);
begin
  No_Calculate_Falchion_Number1:=value;
end;

constructor TCutSheet.Create(ASheet:PAParam_Sheet;AResult_MakeUp:PAResult_MakeUp;iResultCountPerSheet:integer);
begin
  inherited Create;
  Input_Sheet_Size_OnePNL:=ASheet;
  PAResult_MakeUp:=AResult_MakeUp;
  FResultCountPerSheet:=iResultCountPerSheet;
end;

procedure TCutSheet.Sort_Result;
  procedure QuickSort(var A:TAResult_MakeUp; iLo, iHi: Integer;AscOrd:boolean=true);
  var
    Lo, Hi: Integer;
    Mid:currency;
    T: TResult_MakeUp;
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
  QuickSort(PAResult_MakeUp^,Low(PAResult_MakeUp^), High(PAResult_MakeUp^));
end;


end.
