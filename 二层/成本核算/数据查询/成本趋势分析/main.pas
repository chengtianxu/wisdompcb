unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids, DB, DBGrids, Spin, Buttons,dateutils;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    StringGrid1: TStringGrid;
    Edit1: TEdit;
    Label1: TLabel;
    Image1: TImage;
    Image2: TImage;
    Panel2: TPanel;
    vprev: TLabel;
    Label2: TLabel;
    BitBtn1: TBitBtn;
    SpinEdit1: TSpinEdit;
    procedure Button2Click(Sender: TObject);
    procedure StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure StringGrid1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpinEdit1Change(Sender: TObject);
  private
    { Private declarations }

   function find_no(dept_code:string;sgrid:Tstringgrid):integer;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses damo, analysis,common;

{$R *.dfm}

function TForm1.find_no(dept_code:string;sgrid:Tstringgrid):integer;
var
 i:integer;
begin
result:=0;
for i:=2 to sgrid.RowCount-2 do
 if trim(sgrid.Cells[1,i])=dept_code then
  result:=i;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
 application.Terminate;
end;

procedure TForm1.StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
begin
if (acol=5) then
 stringgrid1.Canvas.TextRect(rect,
        rect.Left+10,
        rect.Top+2,
        stringgrid1.Cells[acol,aRow]);

if (acol=5) and (arow>0) and (stringgrid1.Cells[1,1]<>'') then
 IF strtoint(stringgrid1.Cells[acol,arow])=0 THEN
 begin
  Stringgrid1.Canvas.Draw(rect.Left+8,rect.Top,image1.Picture.Graphic);
 end else
  Stringgrid1.Canvas.Draw(rect.Left+8,rect.Top,image2.Picture.Graphic);
end;

procedure TForm1.StringGrid1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
 column,row:longint;
begin
 stringgrid1.MouseToCell(x,y,column,row);
 if (button=mbleft) and (row > 0) and (column = 5) then //标题点击不算
 begin
  IF strtoint(stringgrid1.Cells[5,stringgrid1.row])=0 THEN //选中
   begin
    stringgrid1.Cells[5,stringgrid1.row]:='1';
    edit1.Text:=inttostr(strtoint(edit1.Text)+1);
   end
  else        //放弃
   begin
    stringgrid1.Cells[5,stringgrid1.row]:='0';
    edit1.Text:=inttostr(strtoint(edit1.Text)-1);
   end;
 end;
end;

procedure TForm1.FormShow(Sender: TObject);
var
 i:integer;
begin
 SpinEdit1.MaxValue:=yearof(now);
 SpinEdit1.Value:=SpinEdit1.MaxValue;
 stringgrid1.Cells[0,0]:='序号';
 stringgrid1.Cells[1,0]:='开始日期';
 stringgrid1.Cells[2,0]:='结束日期';
 stringgrid1.Cells[3,0]:='核算日期';
 stringgrid1.Cells[4,0]:='核算人员';
 stringgrid1.Cells[5,0]:='选取';

//if  dm.ADOConnection1.Connected then
//begin

 dm.AQDS451.Close;
 dm.AQDS451.Parameters[0].Value:=spinedit1.Value;
 dm.AQDS451.Open;
 if dm.AQDS451.IsEmpty then
  begin
     stringgrid1.RowCount:=2;
     stringgrid1.rows[1].Text:='';
//   messagedlg('没有核算期间进行分析!',mterror,[mbcancel],0);
//   application.Terminate;
  end
 else
  if not dm.AQDS451.IsEmpty then
  begin
   stringgrid1.RowCount:=dm.AQDS451.RecordCount+1;
   if stringgrid1.RowCount>22 then
    stringgrid1.ColWidths[5]:=50
   else
    stringgrid1.ColWidths[5]:=68;
   for i:=1 to dm.AQDS451.RecordCount do
   begin
    stringgrid1.Cells[0,i]:=dm.AQDS451no.AsString;
    stringgrid1.Cells[1,i]:=dm.AQDS451FM_DATE.AsString;
    stringgrid1.Cells[2,i]:=dm.AQDS451END_DATE.AsString;
    stringgrid1.Cells[3,i]:=dm.AQDS451CLOSED_DATE.AsString;
    stringgrid1.Cells[4,i]:=dm.AQDS451EMPLOYEE_NAME.Value;
    stringgrid1.Cells[5,i]:='0';
    stringgrid1.Cells[6,i]:=dm.AQDS451RKEY.AsString;
    dm.AQDS451.Next;
   end;
  end;
//end;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
 j,i:integer;
begin
if strtoint(edit1.Text)=0 then
 messagedlg('至少需要选择一个核算期间!',mterror,[mbcancel],0)
else
begin
 form2:=tform2.Create(application);
 dm.AQDSAP451.Close;
 dm.AQDSAP451.Open;
 for j:=1 to stringgrid1.RowCount-1 do
 if strtoint(stringgrid1.Cells[5,j])=1 then
 begin
  dm.AQDS451.MoveBy(j-dm.AQDS451.RecNo);
  dm.AQDSAP451.Append;
  for i:=3 to dm.AQDS451.FieldCount-1 do
  dm.AQDSAP451.FieldValues[dm.AQDS451.Fields[i].FieldName]:=
   dm.AQDS451.FieldValues[dm.AQDS451.Fields[i].FieldName];
  dm.AQDSAP451.Post;
  with form2 do
   begin
    sgrid1.ColCount:=sgrid1.ColCount+1;
    sgrid1.Cells[1+dm.AQDSAP451.RecNo,0]:=dm.AQDSAP451END_DATE.AsString;
    sgrid1.Cells[1+dm.AQDSAP451.RecNo,1]:=Formatfloat('#,##0.00',
                                   dm.AQDSAP451closed_stock_matl_cost.Value);
    sgrid1.Cells[1+dm.AQDSAP451.RecNo,2]:=Formatfloat('#,##0.00',
                                   dm.AQDSAP451MATL_CST_IN_WIP_CLOSED.Value);
    sgrid1.Cells[1+dm.AQDSAP451.RecNo,3]:=Formatfloat('#,##0.00',
                                   dm.AQDSAP451OVHD_CST_IN_WIP_CLOSED.Value);
    sgrid1.Cells[1+dm.AQDSAP451.RecNo,4]:=Formatfloat('#,##0.00',
                                   dm.AQDSAP451MATL_CST_IN_SFG_CLOSED.Value);
    sgrid1.Cells[1+dm.AQDSAP451.RecNo,5]:=Formatfloat('#,##0.00',
                                   dm.AQDSAP451OVHD_CST_IN_SFG_CLOSED.Value);
    sgrid1.Cells[1+dm.AQDSAP451.RecNo,6]:=Formatfloat('#,##0.00',
                                   dm.AQDSAP451MATL_CST_IN_FG_CLOSED.Value);
    sgrid1.Cells[1+dm.AQDSAP451.RecNo,7]:=Formatfloat('#,##0.00',
                                   dm.AQDSAP451OVHD_CST_IN_FG_CLOSED.Value);
    sgrid1.Cells[1+dm.AQDSAP451.RecNo,8]:=Formatfloat('#,##0.00',
                               dm.AQDSAP451closed_stock_matl_cost.Value+
                               dm.AQDSAP451closed_wip_cost.Value+
                               dm.AQDSAP451MATL_CST_IN_SFG_CLOSED.Value+
                               dm.AQDSAP451OVHD_CST_IN_SFG_CLOSED.Value+
                               dm.AQDSAP451closed_fg_cost.Value);
    //======================================================================
   sgrid2.ColCount:=sgrid2.ColCount+2;
   sgrid2.Cells[1+dm.AQDSAP451.RecNo*2,0]:=dm.AQDSAP451END_DATE.AsString;
   sgrid2.Cells[2+dm.AQDSAP451.RecNo*2,0]:=dm.AQDSAP451END_DATE.AsString;
   sgrid2.Cells[1+dm.AQDSAP451.RecNo*2,1]:='标准成本';
   sgrid2.Cells[2+dm.AQDSAP451.RecNo*2,1]:='实际成本';

   dm.aqd453.Close;
   dm.aqd453.Parameters[0].Value:=dm.AQDS451RKEY.Value;
   dm.aqd453.Open;
   while not dm.aqd453.Eof do
    begin
     i := find_no(trim(dm.aqd453DEPT_CODE.Value),sgrid2);
     if i>0 then
      begin
       sgrid2.Cells[1+dm.AQDSAP451.RecNo*2,i]:=
                                  dm.aqd453BUDGET_COST.AsString;;
       sgrid2.Cells[2+dm.AQDSAP451.RecNo*2,i]:=
                                  dm.aqd453ACTUAL_COST.AsString;
      end
     else
      begin
       sgrid2.Cells[0,sgrid2.RowCount-1]:=inttostr(sgrid2.RowCount-2);
       sgrid2.Cells[1,sgrid2.RowCount-1]:=dm.aqd453DEPT_CODE.Value;
       sgrid2.Cells[2,sgrid2.RowCount-1]:=dm.aqd453DEPT_NAME.Value;
       sgrid2.Cells[1+dm.AQDSAP451.RecNo*2,sgrid2.RowCount-1]:=
                                  dm.aqd453BUDGET_COST.AsString;;
       sgrid2.Cells[2+dm.AQDSAP451.RecNo*2,sgrid2.RowCount-1]:=
                                  dm.aqd453ACTUAL_COST.AsString;
       sgrid2.RowCount:=sgrid2.RowCount+1;
      end;
     dm.aqd453.Next;
    end;
    //======================================================================
   sgrid3.ColCount:=sgrid3.ColCount+2;
   sgrid3.Cells[1+dm.AQDSAP451.RecNo*2,0]:=dm.AQDSAP451END_DATE.AsString;
   sgrid3.Cells[2+dm.AQDSAP451.RecNo*2,0]:=dm.AQDSAP451END_DATE.AsString;
   sgrid3.Cells[1+dm.AQDSAP451.RecNo*2,1]:='标准费用';
   sgrid3.Cells[2+dm.AQDSAP451.RecNo*2,1]:='实际费用';

   dm.aqd424.Close;
   dm.aqd424.Parameters[0].Value:=dm.AQDS451RKEY.Value;
   dm.aqd424.Open;
   while not dm.aqd424.Eof do
    begin
     i := find_no(trim(dm.aqd424DEPT_CODE.Value),sgrid3);
     if i>0 then
      begin
       sgrid3.Cells[1+dm.AQDSAP451.RecNo*2,i]:=
                                  dm.aqd424std_ovhd.AsString;;
       sgrid3.Cells[2+dm.AQDSAP451.RecNo*2,i]:=
                                  dm.aqd424ovhd.AsString;
      end
     else
      begin
       sgrid3.Cells[0,sgrid3.RowCount-1]:=inttostr(sgrid3.RowCount-2);
       sgrid3.Cells[1,sgrid3.RowCount-1]:=dm.aqd424DEPT_CODE.Value;
       sgrid3.Cells[2,sgrid3.RowCount-1]:=dm.aqd424DEPT_NAME.Value;
       sgrid3.Cells[1+dm.AQDSAP451.RecNo*2,sgrid3.RowCount-1]:=
                                  dm.aqd424std_ovhd.AsString;;
       sgrid3.Cells[2+dm.AQDSAP451.RecNo*2,sgrid3.RowCount-1]:=
                                  dm.aqd424ovhd.AsString;
       sgrid3.RowCount:=sgrid3.RowCount+1;
      end;
     dm.aqd424.Next;
    end;
    //======================================================================
   sgrid4.ColCount:=sgrid4.ColCount+2;
   sgrid4.Cells[1+dm.AQDSAP451.RecNo*2,0]:=dm.AQDSAP451END_DATE.AsString;
   sgrid4.Cells[2+dm.AQDSAP451.RecNo*2,0]:=dm.AQDSAP451END_DATE.AsString;
   sgrid4.Cells[1+dm.AQDSAP451.RecNo*2,1]:='标准成本';
   sgrid4.Cells[2+dm.AQDSAP451.RecNo*2,1]:='实际成本';

   dm.aqd452.Close;
   dm.aqd452.Parameters[0].Value:=dm.AQDS451RKEY.Value;
   dm.aqd452.Open;
   while not dm.aqd452.Eof do
    begin
     i := find_no(trim(dm.aqd452GROUP_NAME.Value),sgrid4);
     if i>0 then
      begin
       sgrid4.Cells[1+dm.AQDSAP451.RecNo*2,i]:=
                                  dm.aqd452BUDGET_COST.AsString;;
       sgrid4.Cells[2+dm.AQDSAP451.RecNo*2,i]:=
                                  dm.aqd452ACTUAL_COST.AsString;
      end
     else
      begin
       sgrid4.Cells[0,sgrid4.RowCount-1]:=inttostr(sgrid4.RowCount-2);
       sgrid4.Cells[1,sgrid4.RowCount-1]:=dm.aqd452GROUP_NAME.Value;
       sgrid4.Cells[2,sgrid4.RowCount-1]:=dm.aqd452GROUP_DESC.Value;
       sgrid4.Cells[1+dm.AQDSAP451.RecNo*2,sgrid4.RowCount-1]:=
                                  dm.aqd452BUDGET_COST.AsString;;
       sgrid4.Cells[2+dm.AQDSAP451.RecNo*2,sgrid4.RowCount-1]:=
                                  dm.aqd452ACTUAL_COST.AsString;
       sgrid4.RowCount:=sgrid4.RowCount+1;
      end;
     dm.aqd452.Next;
    end;
    //======================================================================
    dm.AD441.Close;
    dm.AD441.Parameters[0].Value:=dm.AQDS451RKEY.Value;
    dm.AD441.Open;
    sgrid5.Cells[0,sgrid5.RowCount-1]:=inttostr(sgrid5.RowCount-1);
    sgrid5.Cells[1,sgrid5.RowCount-1]:=dm.AQDSAP451END_DATE.AsString;
    sgrid5.Cells[2,sgrid5.RowCount-1]:=dm.AD441quantity.AsString;
    sgrid5.Cells[3,sgrid5.RowCount-1]:=dm.AD441sqft.AsString;
    sgrid5.Cells[4,sgrid5.RowCount-1]:=dm.AD441rej_cost.AsString;
    sgrid5.Cells[5,sgrid5.RowCount-1]:=dm.AD441YIELD_IN_SQFT.AsString;
    sgrid5.Cells[6,sgrid5.RowCount-1]:=dm.AD441YIELD_IN_AMOUNT.AsString;
    sgrid5.Cells[7,sgrid5.RowCount-1]:=dm.AD441amount_bl.AsString;
    sgrid5.Cells[8,sgrid5.RowCount-1]:=dm.AD441sqft_bl.AsString;

    sgrid5.RowCount:=sgrid5.RowCount+1;
    //======================================================================

   end;
 end;
 form2.sgrid1.FixedCols:=2;
 form2.sgrid2.FixedCols:=3;
 form2.sgrid3.FixedCols:=3;
 form2.sgrid4.FixedCols:=3; 
 dm.aqd453.Close;
 dm.aqd424.Close;
 dm.aqd452.close;
 dm.AD441.Close;
 form2.ShowModal;
 form2.Free;
end;

end;

procedure TForm1.FormCreate(Sender: TObject);

begin
  if not App_Init(dm.ADOConnection1) then
   begin
    ShowMsg('程序启动失败，请联系系统管理员！','提示',1);
    application.Terminate;
   end;
  self.Caption :=Application.Title;

  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd';

end;


procedure TForm1.SpinEdit1Change(Sender: TObject);
var i:Integer;
begin
   dm.AQDS451.Close;
   dm.AQDS451.Parameters[0].Value:=spinedit1.Value;
   dm.AQDS451.Open;
   if dm.AQDS451.IsEmpty then
    begin
     stringgrid1.RowCount:=2;
     stringgrid1.rows[1].Text:='';
    end
   else
    begin
     stringgrid1.RowCount:=dm.AQDS451.RecordCount+1;
     if stringgrid1.RowCount>22 then
      stringgrid1.ColWidths[5]:=50
     else
      stringgrid1.ColWidths[5]:=68;
     for i:=1 to dm.AQDS451.RecordCount do
     begin
      stringgrid1.Cells[0,i]:=dm.AQDS451no.AsString;
      stringgrid1.Cells[1,i]:=dm.AQDS451FM_DATE.AsString;
      stringgrid1.Cells[2,i]:=dm.AQDS451END_DATE.AsString;
      stringgrid1.Cells[3,i]:=dm.AQDS451CLOSED_DATE.AsString;
      stringgrid1.Cells[4,i]:=dm.AQDS451EMPLOYEE_NAME.Value;
      stringgrid1.Cells[5,i]:='0';
      stringgrid1.Cells[6,i]:=dm.AQDS451RKEY.AsString;
      dm.AQDS451.Next;
     end;
    end;
end;

end.
