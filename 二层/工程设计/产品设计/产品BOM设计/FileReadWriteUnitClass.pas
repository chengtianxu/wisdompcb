//Hole_information_1:=THole_information.Create;建立类
//Hole_information_1.initialization_Result_Drill_Hole_information ;初使化类的数据
// Hole_information_1.Result_Drill_Hole_information[n].Hole_Number  取得孔数
//Hole_information_1.Result_Drill_Hole_information[n].Hole_denotation 孔符号
//Hole_information_1.Result_Drill_Hole_information[n].Hole_Size 孔大小
//Hole_information_1.Result_Drill_Hole_information[n].Hole_Size_Unit 单位
//n最多100个,从一开始,如果为0时,不用计算在进去,代表T后面的数字
//读钻孔文件计算孔数  此为类
unit FileReadWriteUnitClass;

interface
uses
  Messages,SysUtils,StdCtrls,Dialogs,ExtCtrls,math,Graphics;
  
  type
    Hole_information =record
       Hole_denotation:string;   //孔符号
       Hole_Number:integer;     //孔数
       Hole_Size:currency;//孔大小
       Hole_Size_Unit:string//孔单位
  end;
   THole_information= CLASS(Tobject)
   private
   { Private declarations }
     Drill_File_content_1:string;
     Drill_Hole_Type_Count_1,Drill_Hole_Type_Count_3,Drill_Hole_Type_Count_5:integer;
     Drill_Hole_Type_Count_2,Drill_Hole_Type_Count_4:array[1..100] of integer;
     Drill_Hole_information:arrAY[0..100] OF Hole_information;
    function IsDigit(ch: string):boolean;
    function Get_Drill_Hole_information(Index: Integer): Hole_information;
    function Get_Drill_Hole_Type_Count: integer;
    procedure Set_Drill_File_content(const Value: string);
    function manage_String(s1:string):boolean;
   public
   { Public declarations }
     //初使化
     procedure initialization_Result_Drill_Hole_information();
     function calculate():boolean;
     //得到字符串
     property Drill_File_content:string write Set_Drill_File_content;
     //孔种类个数
     property Drill_Hole_Type_Count:integer read Get_Drill_Hole_Type_Count;

     //返回计算结果
     property Result_Drill_Hole_information[Index: Integer]: Hole_information read Get_Drill_Hole_information;

   END;


implementation

{ THole_information }

function THole_information.calculate: boolean;
begin
 Result:= manage_String(Drill_File_content_1);
end;

function THole_information.Get_Drill_Hole_information(Index: Integer): Hole_information;
begin
  Result:=Drill_Hole_information[Index];
end;

function THole_information.Get_Drill_Hole_Type_Count: integer;
begin
   Result:=Drill_Hole_Type_Count_1;
end;

procedure THole_information.initialization_Result_Drill_Hole_information;
var
  i:integer;
begin
   //将以前的数据置为空 // Drill_File_content_1:string;
 Drill_Hole_Type_Count_1:=0;
 for i:=low(Drill_Hole_information) to high(Drill_Hole_information) do
  begin
    Drill_Hole_information[i].Hole_denotation:='';    //:arrAY[0..100] OF Hole_information;
    Drill_Hole_information[i].Hole_Number:=0;
    Drill_Hole_information[i].Hole_Size:=0;
    Drill_Hole_information[i].Hole_Size_Unit:='';
  end;
end;

function THole_information.IsDigit(ch: string): boolean;
begin
    result:=false;
   if (ch='0') or (ch='1') or (ch='2') or (ch='3') or (ch='4') or (ch='5') or (ch='6') or (ch='7') or (ch='8') or (ch='9') or (ch='.') then
   begin
     result:=true;
   end;
end;

function THole_information.manage_String(s1: string):boolean;
var
  i,j,i1,Pos_1,Pos_2:integer;
  Tem_string:string;
begin
   tem_string:=LowerCase(s1);  //将字符串转为小写
   if s1='' then Result:=false; //字符串为空时,不计算
  try
   if s1<>'' then //字符串不为空时处理
   begin
      //showmessage(tem_string);
      //处理METRIC,LZ或者METRIC,TZ行
      if  pos('metric',tem_string)>0 then
      begin
         //含METRIC行,单位
         i:=low(Drill_Hole_information);
         Drill_Hole_information[i].Hole_Size_Unit:='Metric';  //钻孔单位mm毫米
      end;
      //处理INCH,LZ或者INCH,TZ行
      if  pos('inch',tem_string)>0 then
      begin
         //含INCH行,单位
         i:=low(Drill_Hole_information);
         Drill_Hole_information[i].Hole_Size_Unit:='Inch'; // 钻孔单位INCH英寸
      end;

       //处理T__C__F__S__行
      //取得钻孔大小
      //if  (pos('t',tem_string)=1) and (pos(' ',tem_string)<length(tem_string)) and (pos('f',tem_string)=0) and (pos('i',tem_string)=0)  and (pos('e',tem_string)=0) and (pos('atc',tem_string)=0)) then
      {
      if  (pos('t',tem_string)=1) and (pos(' ',tem_string)>0) and (pos(' ',tem_string)<length(tem_string)) and  (pos('i',tem_string)=0) and ((pos('metric',tem_string)=0) and (pos('detect',tem_string)=0) and (pos('atc',tem_string)=0)) then
      begin
        //含TXX与CXX行,孔的大小
        // showmessage(copy(tem_string,pos_1+1,pos_2-2));
          Pos_1:=pos('t',tem_string);
          Pos_2:=pos(' ',tem_string);
         //i:=strtoint(copy(trim(tem_string,pos_1+1,pos_2-2))); //钻孔序号
         i:=strtoint(copy(tem_string,pos_1+1,pos_2-2)); //钻孔序号
         //Drill_Hole_information[i].Hole_Number :=i;
         Drill_Hole_information[i].Hole_denotation:=trim(copy(tem_string,pos_1,pos_2-1));
         j:=low(Drill_Hole_information);
         Drill_Hole_information[i].Hole_Size_Unit:=Drill_Hole_information[j].Hole_Size_Unit ;
         i1:=0;
      //  for j:=pos_2+1 to length(tem_string)-pos_2 do
        //
         for j:=pos_2+1 to length(tem_string) do
         begin
           //if copy(tem_string,j,1)='  ' then
          // begin
             //if IsDigit(copy(tem_string,j,1))=false then
            // if copy(tem_string,j,1) in ['0'..'9','.'] then
             //begin
            //   i1:=i1+11;

               //break;
             //end;
           //end;
         end;

        Drill_Hole_information[i].Hole_Size:=StrToCurr(trim(copy(tem_string,pos_2+1,j-pos_2-i1))); //
         // showmessage(currtostr(Drill_Hole_information[i].Hole_Size));
      end;
      }
      //含有T数字C数字FS
      {
      if  (pos('t',tem_string)=1) and (pos('c',tem_string)>0)  and  (pos('i',tem_string)=0) and ((pos('metric',tem_string)=0) and (pos('detect',tem_string)=0) and (pos('inch',tem_string)=0) and (pos('atc',tem_string)=0)) then
      begin
        //含TXX与CXX行,孔的大小
        // showmessage(copy(tem_string,pos_1+1,pos_2-2));
          Pos_1:=pos('t',tem_string);
          Pos_2:=pos('c',tem_string);
         //i:=strtoint(copy(trim(tem_string,pos_1+1,pos_2-2))); //钻孔序号
         i:=strtoint(copy(tem_string,pos_1+1,pos_2-2)); //钻孔序号
         //Drill_Hole_information[i].Hole_Number :=i;
         Drill_Hole_information[i].Hole_denotation:=trim(copy(tem_string,pos_1,pos_2-1));
         j:=low(Drill_Hole_information);
         Drill_Hole_information[i].Hole_Size_Unit:=Drill_Hole_information[j].Hole_Size_Unit ;
         i1:=0;
        //for j:=pos_2+1 to length(tem_string)-pos_2 do

         for j:=pos_2+1 to length(tem_string) do
         begin
           //if copy(tem_string,j,1)='  ' then
           //begin
             if IsDigit(copy(tem_string,j,1))=false then
             //if copy(tem_string,j,1) in ['0'..'9','.'] then
             begin
               i1:=i1+11;

               break;
             end;
           //end;
         end;

        Drill_Hole_information[i].Hole_Size:=StrToCurr(trim(copy(tem_string,pos_2+1,j-pos_2-i1))); //
         // showmessage(currtostr(Drill_Hole_information[i].Hole_Size));
      end;
      }




       ////处理T__行,去掉DETECT,ON与ATC,ON与fmat与T__C__F__S__,含有T的行,处理T后面跟数字,没有其宏观世它的
      if  (pos('t',tem_string)=1) then //第一个是T  and (pos('c',tem_string)=0) and (pos(' ',tem_string)=0) and  (pos('i',tem_string)=0) and ((pos('metric',tem_string)=0) and (pos('detect',tem_string)=0) and (pos('atc',tem_string)=0)) then
      begin
          Pos_1:=pos('t',tem_string);
         //含TXX行 ,第几个孔行
         IF (pos('c',tem_string)>0) then //含C,取钻符号与钻嘴大小
         begin

           Pos_2:=pos('c',tem_string);
           i1:=0;
           for j:=pos_2+1 to length(tem_string) do
           begin
             if IsDigit(copy(tem_string,j,1))=false then
             begin
                i1:=1;
                break;
             end;
           end;
            i:=strtoint(trim(copy(tem_string,2,Pos_2-2)));
        //    showmessage(inttostr(i));
           Drill_Hole_information[i].Hole_Size:=StrToCurr(trim(copy(tem_string,pos_2+1,j-pos_2-i1)));//孔径大小
         END;//有T数字C数字行

         IF (pos(' ',tem_string)>0) and ((pos('i',tem_string)=0)) then //含空格,取钻符号与钻嘴大小,钻嘴大小由空格到最后
         begin

           Pos_2:=pos(' ',tem_string);
           //i1:=0;
          // for j:=pos_2+1 to length(tem_string) do
          // begin
          //   if IsDigit(copy(tem_string,j,1))=false then
          //   begin
          //      i1:=1;
          //      break;
          //   end;
          // end;
         // showmessage(trim(copy(tem_string,pos_2+1,length(tem_string)-pos_2)));
           i:=strtoint(trim(copy(tem_string,2,Pos_2-2)));
          // showmessage(inttostr(i));
           Drill_Hole_information[i].Hole_Size:=StrToCurr(trim(copy(tem_string,pos_2+1,length(tem_string)-pos_2)));//j-pos_2-i1)));//孔径大小
         END;//有T数字C数字行


           I1:=0;
           for j:=2 to length(tem_string) do   // 只有T后面数字
           begin
             if IsDigit(copy(tem_string,j,1))=false then
             begin
                i1:=1;
                break;
             end;
           end;
           IF I1=0 THEN
           BEGIN
             Drill_Hole_Type_Count_1:=Drill_Hole_Type_Count_1+1;
             Drill_Hole_information[Drill_Hole_Type_Count_1].Hole_denotation:=tem_string;//trim(copy(tem_string,pos_1,pos_2-1)); //钻孔符号
             Drill_Hole_Type_Count_3:=strtoint(trim(copy(tem_string,pos_1+1,length(tem_string)-pos_1)));//pos_2-1-pos_1)));
           END;








      end;

      //处理M25行
      if pos('m25',tem_string)>0 then
      begin
           //M25行
           Drill_Hole_Type_Count_2[Drill_Hole_Type_Count_3]:=0;
           Drill_Hole_Type_Count_4[Drill_Hole_Type_Count_3]:=0;
           Drill_Hole_Type_Count_5:=1; //计算重复标志,1有重复,0无重复
      end;
      //处理M08行
      if pos('m08',tem_string)>0 then
      begin
           //M08行
           Drill_Hole_Type_Count_5:=0;//将计算重复标志值改为0,标志重复结束
      end;
      //处理R__M02X__Y__行
      if   ((pos('x',tem_string)>0) or (pos('y',tem_string)>0))  and (pos('m',tem_string)=0) then //or ((pos('y',tem_string)=0)) and (pos('m',tem_string)=0) then
      begin
         //只有X,Y座标
         //无重复,直接计算孔数,将结果赋给Drill_Hole_information[Drill_Hole_Type_Count_3].Hole_Number
         //有重复时,将重复孔数计算出,将结果赋给出Drill_Hole_Type_Count_2[Drill_Hole_Type_Count_3]
         if Drill_Hole_Type_Count_5=0 then
         begin
            Drill_Hole_information[Drill_Hole_Type_Count_3].Hole_Number:=Drill_Hole_information[Drill_Hole_Type_Count_3].Hole_Number +1;
         end
         else
         begin
           Drill_Hole_Type_Count_2[Drill_Hole_Type_Count_3]:=Drill_Hole_Type_Count_2[Drill_Hole_Type_Count_3]+1;
         end;
      end;
      //处理M01行
      if   pos('m01',tem_string)>0 then
      begin
          //重复个数,含M01
          //计算重复孔数量,将值赋给Drill_Hole_Type_Count_4[Drill_Hole_Type_Count_3],以便在M01下面有多个M02时用
          Drill_Hole_Type_Count_4[Drill_Hole_Type_Count_3]:= Drill_Hole_Type_Count_2[Drill_Hole_Type_Count_3];
      end;
      //处理M02行
      if   pos('m02',tem_string)>0 then
      begin
         //重复个数,含M02
         //计算总孔数,将值赋给Drill_Hole_information[Drill_Hole_Type_Count_3].Hole_Number
          Pos_1:=pos('r',tem_string); //计算重复个数用
          Pos_2:=pos('m',tem_string); //计算重复个数用
         if pos_1=0 then
         begin
           Drill_Hole_Type_Count_2[Drill_Hole_Type_Count_3]:=Drill_Hole_Type_Count_4[Drill_Hole_Type_Count_3]*2;
         end
         else
         begin
           Drill_Hole_Type_Count_2[Drill_Hole_Type_Count_3]:= Drill_Hole_Type_Count_4[Drill_Hole_Type_Count_3]*strtoint(copy(tem_string,pos_1+1,pos_2-2));
         end;
         Drill_Hole_information[Drill_Hole_Type_Count_3].Hole_Number:=Drill_Hole_Type_Count_2[Drill_Hole_Type_Count_3]+Drill_Hole_information[Drill_Hole_Type_Count_3].Hole_Number;
      end;


     Result:=true;
   end;
  except
  end;
end;

procedure THole_information.Set_Drill_File_content(const Value: string);
begin//输入的字符串
   Drill_File_content_1:=Value;
end;

end.
