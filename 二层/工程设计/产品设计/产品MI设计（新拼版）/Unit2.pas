unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, Menus, StdCtrls, StrUtils, IniFiles;
type
    drill = record
    type0:integer;
    shape:integer;
    drillsize:Double;
    origsize:Double;
    drillsum:Integer;
end;

type
  Tinputform = class(TForm)
    StringGrid1: TStringGrid;
    OpenDialog1: TOpenDialog;
    PopupMenu1: TPopupMenu;
    ComboBox1: TComboBox;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    A1: TMenuItem;
    B1: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure StringGrid1DblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ComboBox1Select(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure N2Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure A1Click(Sender: TObject);
    procedure B1Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
  private
    { Private declarations }
  public
    procedure due(fpath:string);
    { Public declarations }
  end;

var
  inputform: Tinputform;
  function Toolchar(num:Integer):string;
  function instr(orig:string):string;


implementation

uses product_MIDetail;

{$R *.dfm}
var
    CuRow,CuCol:Integer;
    CuRect:TRect;

function Toolchar(num:Integer):string;
var
  t1,t2:integer;
  tmp:string;
begin

        t1:=num div 27;
        t2:=num mod 27;
       if t1<>0 then
       tmp:=chr(64+t1)+chr(65+t2)
       else
       tmp:=chr(64+t2);
       Result:=tmp;
end;


procedure Tinputform.due(fpath: string);
var
  i,j,xpos,ispnl,stat,scl,ii:Integer;
  context:TStringList;
  linestr,tmp:string;
  tools: array of drill;
  layer,sublstr:TStrings;
begin
     context:=TStringList.Create;
     layer:=TStringList.Create;
     ispnl:=0;
     case OpenDialog1.Tag of
     0: begin
           stat:=MessageDlg('是否为原稿钻带',  mtConfirmation, [mbYes, mbNo], 0);
           sublstr:=TStringList.Create;
           context.LoadFromFile(fpath);
           j:=0;
           if Pos('%',context.Text)<1 then
               begin
                   MessageDlg('请确认打开的文件的格式是正式的生产用钻带',mtWarning, [mbOK], 0);
                   Exit;
               end;

           for i:=0 to context.Count-1 do
           begin
              linestr:=context[i];
              case linestr[1] of
              'M','G':;
              'T': begin
                     xpos:=Pos('C',linestr);
                     if xpos>0 then
                        begin
                           SetLength(tools,Length(tools)+1);
                           tmp := '';
                           for ii := xpos + 1 to Length(linestr) do
                           begin
                             if (linestr[ii] in ['0'..'9','.']) then
                              tmp := tmp + linestr[ii]
                             else
                              Break;
                           end;
                           //tmp:=RightStr(linestr,Length(linestr)-xpos);
                           tools[j].drillsize:=StrToFloat(tmp);
                           tools[j].shape:=0;
                           tools[j].type0:=0;
                           if stat = mrYes then
                           begin
                           tools[j].origsize:=StrToFloat(tmp);
                           tools[j].drillsize:=0.0;
                           end
                           else
                           begin
                           tools[j].drillsize:=StrToFloat(tmp);
                           tools[j].origsize:=0.0;
                           end;


                        end;
                        j:=j+1;
                   end;
              '%':j:=-1;

              'X','Y': tools[j].drillsum:=tools[j].drillsum+1;
              end;


           end;
           if stat<>mryes then
      //     if FloatToStr(tools[j].drillsize)='0.5' then
              if MessageDlg('是否为B板钻带',  mtConfirmation, [mbYes, mbNo], 0) =
                mrYes then
                ispnl:=10
                else
                ispnl:=9
              else
              ispnl:=7;
        end;

     1: begin

           context.LoadFromFile(fpath);
           j:=-1;
           stat:=mrYes;
           for i:=1 to context.Count-1 do
           begin
              linestr:=context[i];
              if (Pos(':',linestr)=0) and (linestr[1]<>'=')  then
              layer.Add(linestr)
              else
              begin
                   sublstr:=TStringList.Create;
                   if ExtractStrings([':'],['T','O','L','[',']'],PChar(linestr),sublstr)=2 then
                   begin
                      SetLength(tools,Length(tools)+1);
                      j:=j+1;
                      sublstr.CommaText:=sublstr[1];
                      tools[j].drillsum:=StrToInt(sublstr.values['count']);
                      tools[j].origsize:=StrToFloat(sublstr.values['finish_size']);
                      tools[j].drillsize:=StrToFloat(sublstr.values['drill_size']);
                      if sublstr.values['type']='plated' then
                        tools[j].type0:=0;
                      if sublstr.values['type']='non_plated' then
                        tools[j].type0:=1;
                      if sublstr.values['type']='via' then
                        tools[j].type0:=2;
                      if sublstr.values['shape']='slot' then
                        tools[j].shape:=1
                      else
                        tools[j].shape:=0;


                   end;
                   sublstr.Free;
              end;
           end;
           layer.Free;
        end;

     2: begin


        end;



     end;



     if OpenDialog1.Tag=0 then
     scl:=1
     else
     scl:=1000;


     for i:=1 to Length(tools) do
     begin
          if tools[i-1].shape=0 then
          with  inputform.StringGrid1 do
          begin
               j:=RowCount-1;
               RowCount:=RowCount+1;
               Cells[0,j]:=IntToStr(j);
               Cells[1,j]:='T'+IntToStr(j);
               Cells[2,j]:=Toolchar(j);
               if tools[i-1].origsize<>0.00 then
               Cells[3,j]:=FormatFloat('0.000',tools[i-1].origsize/scl);
               if tools[i-1].type0=1 then
               Cells[4,j]:='N'
               else
               Cells[4,j]:='Y';
               if tools[i-1].drillsize<>0.00 then
               Cells[6,j]:=FormatFloat('0.000',tools[i-1].drillsize/scl);
               if ispnl=0 then ispnl:=7;
               Cells[ispnl,j]:=IntToStr(tools[i-1].drillsum);
               Cells[11,j]:='默认为非工具孔';
          end;


     end;

     for i:=1 to Length(tools) do
     begin
          if tools[i-1].shape=1 then
          with  inputform.StringGrid1 do
          begin
               j:=RowCount-1;
               RowCount:=RowCount+1;
               Cells[0,j]:=IntToStr(j);
               Cells[1,j]:='T'+IntToStr(j);
               Cells[2,j]:=Toolchar(j);
               if tools[i-1].origsize<>0.00 then
               Cells[3,j]:=FormatFloat('0.000',tools[i-1].origsize/scl);
               if tools[i-1].type0=1 then
               Cells[4,j]:='N'
               else
               Cells[4,j]:='Y';
               if tools[i-1].drillsize<>0.00 then
               Cells[6,j]:=FormatFloat('0.000',tools[i-1].drillsize/scl);
               if ispnl=0 then ispnl:=7;
               Cells[ispnl,j]:=FloatToStr(tools[i-1].drillsum);
               Cells[11,j]:='替换填写槽长';
          end;


     end;

     A1.Enabled:=False;
     B1.Enabled:=False;
     case ispnl of
     9: A1.Enabled:=True;
     10: B1.Enabled:=True;
     end;

end;

procedure Tinputform.FormCreate(Sender: TObject);
begin
                                      { 0   1   2     3       4   5     6    7        8       9      10      11 }
    StringGrid1.Rows[0].DelimitedText:='序,刀具,符号,成品孔径,PTH,公差,钻咀,PCS孔数,SET孔数,A板孔数,B板孔数,备注';
end;

procedure Tinputform.StringGrid1SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
    if N4.Checked then
     begin
        //OutputDebugString(PChar('sel列:'+IntToStr(ACol)+';行:'+IntToStr(ARow)+';值:'+StringGrid1.Cells[ACol,ARow]));
        CuRow:=ARow;
        CuCol:=ACol;
        CuRect:=StringGrid1.CellRect(ACol,ARow);
     end;
end;

procedure Tinputform.StringGrid1DblClick(Sender: TObject);
begin
     if N4.Checked then
     begin

       //OutputDebugString(PChar('dblclk'));
       ComboBox1.Items.Clear;
       ComboBox1.Text:='';
       case CuCol of
         4: ComboBox1.Items.DelimitedText:='Y,N' ;
         5: ComboBox1.Items.DelimitedText:='+/-0.05,+/-0.0762,+/-0.08,+0.1/-0,+/-0.10,/';
         11:ComboBox1.Items.DelimitedText:='非工具孔,工具孔';
       end;
       case CuCol of
       4,5,11: begin
                   ComboBox1.Left:=CuRect.Left+1;
                   ComboBox1.Top:=CuRect.Top+1;
                   ComboBox1.Height:=CuRect.Bottom-CuRect.Top;
                   ComboBox1.Width:=CuRect.Right-CuRect.Left;
                   ComboBox1.Visible:=True;
               end;
       end;
     end;
end;

procedure Tinputform.FormShow(Sender: TObject);
var
    i:Integer;
begin
    for i:=1 to StringGrid1.RowCount-1 do
     StringGrid1.Rows[i].Clear;
    StringGrid1.RowCount:=2;
    due(OpenDialog1.FileName);

    case N4.Checked of
    False: Caption:= '钻咀处理 - '+'使用右键-选择 激活快捷编辑功能 进行快速编辑';
    True: Caption:='钻咀处理 - '+'双击想要编辑的单元格按提示修改，单击则自定义修改';
    end;
end;

procedure Tinputform.ComboBox1Select(Sender: TObject);
var
  i,j:Integer;
begin
     //OutputDebugString(PChar(ComboBox1.Text));

     if (CuCol=11) and (comboBox1.Text='工具孔') then
     with StringGrid1 do
     begin
        Cells[2,CuRow]:='/';
        Cells[3,CuRow]:='/';
        Cells[4,CuRow]:='/';
        Cells[5,CuRow]:='/';
        //Cells[7,CuRow]:='/';
        Cells[8,CuRow]:='/';
        j:=0;
        for i:=1 to RowCount-2 do
            if Cells[2,i]<>'/' then
            begin
               j:=j+1;
               Cells[2,i]:=Toolchar(j);
            end;
     end;
     StringGrid1.Cells[CuCol,CuRow]:=ComboBox1.Text;
     ComboBox1.Visible:=False;


end;

function instr(orig:string):string;
begin

end;



procedure Tinputform.FormClose(Sender: TObject; var Action: TCloseAction);
begin
//     Action:=caHide;
end;

procedure Tinputform.N2Click(Sender: TObject);
var
  i:Integer;
begin

     if MessageDlg('如果选择是那么原来钻嘴表数据将被清空是否继续',  
       mtConfirmation, [mbYes, mbNo], 0) = mrYes then
     begin
        Form2.fsg.RowCount:=inputform.StringGrid1.RowCount+1;
        inputform.StringGrid1.ColCount:=inputform.StringGrid1.ColCount-1;
        for i:=1 to StringGrid1.RowCount-1 do
        begin
          Form2.fsg.Rows[i].Clear;
          Form2.fsg.Rows[i].Assign(StringGrid1.Rows[i]);
        end;
        inputform.StringGrid1.ColCount:=inputform.StringGrid1.ColCount+1;
        inputform.Close;
     end;


end;

procedure Tinputform.N6Click(Sender: TObject);
var
  i:Integer;
begin
     for i:=1 to StringGrid1.RowCount-1 do
     begin
         StringGrid1.Cells[CuCol,i]:='';
     end;
end;

procedure Tinputform.N4Click(Sender: TObject);
begin
     N6.Enabled:=N4.Checked;

     case N4.Checked of
    False:Self.Caption:= '钻咀处理 - '+'使用右键-选择 激活快捷编辑功能 进行快速编辑';
    True: Self.Caption:='钻咀处理 - '+'双击想要编辑的单元格按提示修改，单击则自定义修改';
    end;
end;

procedure Tinputform.A1Click(Sender: TObject);
begin
     if Form2.fsg.RowCount<>inputform.StringGrid1.RowCount then
        MessageDlg('不是同一个料号的钻带',  mtConfirmation, [mbOK], 0)
     else
        begin
          Form2.fsg.Cols[9].Assign(StringGrid1.Cols[9]);
          inputform.Close;
        end;

end;

procedure Tinputform.B1Click(Sender: TObject);
begin
     if Form2.fsg.RowCount<>inputform.StringGrid1.RowCount then
        MessageDlg('不是同一个料号的钻带',  mtConfirmation, [mbOK], 0)
     else
        begin
          Form2.fsg.Cols[10].Assign(StringGrid1.Cols[10]);
          inputform.Close;
        end;
end;

procedure Tinputform.N5Click(Sender: TObject);
var
  i,j:Integer;
begin
    j:=Form2.fsg.RowCount-2;
    inputform.StringGrid1.ColCount:=inputform.StringGrid1.ColCount-1;
    //j:=inputform.StringGrid1.RowCount;
    Form2.fsg.RowCount:=Form2.fsg.RowCount+inputform.StringGrid1.RowCount-1;
    for i:=1 to StringGrid1.RowCount-1 do
    begin
      Form2.fsg.Rows[i+j].Assign(StringGrid1.Rows[i]);
    end;
    inputform.StringGrid1.ColCount:=inputform.StringGrid1.ColCount+1;
    with Form2.fsg do
    begin
    for i:=1 to RowCount-2 do
        Cells[0,i]:=IntToStr(i);
    Update;
    end;

    inputform.Close;
end;

end.


