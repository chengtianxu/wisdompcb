unit EditBom;

interface

Uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, DBCtrls, Menus, DB, ADODB,
  ExtCtrls, Mask , Math;

type
  TFrmEditBom = class(TForm)
    stg2: TStringGrid;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    Panel1: TPanel;
    Label2: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Panel3: TPanel;
    Label1: TLabel;
    DBMemo1: TDBMemo;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    Label3: TLabel;
    N4: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure stg2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure stg2DblClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
  private
    { Private declarations }
    StrL:TStringList;
    vCutNoData0492:string;
    vRkey0025:integer;

    function Get_CutNoData0492: string;
    procedure Set_CutNoData0492(const Value: string);
    function Get_Rkey0025: integer;
    procedure Set_Rkey0025(const Value: integer);
    
  public
    { Public declarations }
    property CutNoData0492:string read Get_CutNoData0492 write Set_CutNoData0492 ;
    property Rkey0025:integer read Get_Rkey0025 write Set_Rkey0025 ;
  end;

var
  FrmEditBom: TFrmEditBom;

implementation

USES
   DmUnit1, bominvt,common;

{$R *.dfm}

procedure TFrmEditBom.FormShow(Sender: TObject);

begin
with stg2 do
 begin
  cells[0,0]:='工序代码';
  cells[1,0]:='步骤';
  cells[2,0]:='材料编码';
  cells[3,0]:='材料名称';
  cells[4,0]:='材料规格';
  cells[5,0]:='单位';
  cells[6,0]:='供应商';
  cells[7,0]:='配额';
  cells[8,0]:='类型';
  cells[9,0]:='列印';
  cells[10,0]:='当前库存';
  cells[11,0]:='rkey34';
  cells[12,0]:='rkey17';
  ColWidths[11]:=-1;
  ColWidths[12]:=-1;
  cells[13,0]:='发放数量';
 end;

end;

procedure TFrmEditBom.FormCreate(Sender: TObject);
begin
  StrL:=TStringList.Create;
end;

procedure TFrmEditBom.stg2MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  Column,Row:Integer;
begin
  if button=mbright then
    begin
      stg2.MouseToCell(X,Y,Column,Row);
      if Row<>0 then
        stg2.Row:=Row;
    end;
end;

procedure TFrmEditBom.PopupMenu1Popup(Sender: TObject);
begin
  if stg2.Row=stg2.RowCount-1 then
    begin
      N2.Enabled:=False;
      N3.Enabled:=False;
    end
  else
    begin
      N2.Enabled:=True;
      N3.Enabled:=True;
    end;
end;

procedure TFrmEditBom.stg2DblClick(Sender: TObject);
begin
  if stg2.Row<>stg2.RowCount-1 then
    N2.Click;
end;

function TFrmEditBom.Get_CutNoData0492: string;
begin
  result := vCutNoData0492;
end;

procedure TFrmEditBom.Set_CutNoData0492(const Value: string);
begin
  vCutNoData0492 := value;
end;

function TFrmEditBom.Get_Rkey0025: integer;
begin
  result := vRkey0025 ;
end;

procedure TFrmEditBom.Set_Rkey0025(const Value: integer);
begin
  vRkey0025 := value ;
end;

procedure TFrmEditBom.FormActivate(Sender: TObject);
begin
     dm.TemADOQuery1.close;
     dm.TemADOQuery1.sql.Text:=
      'SELECT  TOP 100 PERCENT Data0034.DEPT_CODE,Data0017.INV_PART_NUMBER,'+#13+
      'Data0017.INV_NAME, Data0017.INV_DESCRIPTION,'+#13+
      'Data0468.STEP, Data0468.QUAN_BOM,data0468.invent_or,'+#13+
      'Data0468.INVENT_PTR, Data0468.DEPT_PTR, Data0468.PRINTIT,'+#13+
      'Data0002.UNIT_NAME,data0017.quan_on_hand,data0468.vendor,data0468.QUAN_ISSUED'+#13+
      'FROM   dbo.Data0468 INNER JOIN'+#13+
      'Data0017 ON Data0468.INVENT_PTR = Data0017.RKEY INNER JOIN'+#13+
      'Data0034 ON Data0468.DEPT_PTR = Data0034.RKEY INNER JOIN'+#13+
      'dbo.Data0002 ON dbo.Data0017.STOCK_UNIT_PTR = dbo.Data0002.RKEY'+#13+
      'where Data0468.cut_no='+quotedstr(dm.ADOQALL2CUT_NO.AsString)+#13+
      'and data0468.invent_or=0'+#13+
      'union all'+#13+
      'SELECT  TOP 100 PERCENT Data0034.DEPT_CODE,'+#13+
      'dbo.DATA0556.MAT_CODE, dbo.DATA0556.mat_desc,'+#13+
      'CAST(dbo.DATA0556.LEN_SIZE AS varchar)'+#13+
      '+ ''*'' + CAST(dbo.DATA0556.WEI_SIZE AS varchar) AS invname,'+#13+
      'Data0468.STEP, Data0468.QUAN_BOM,data0468.invent_or,'+#13+
      'Data0468.INVENT_PTR, Data0468.DEPT_PTR, Data0468.PRINTIT,'+#13+
      'Data0002.UNIT_NAME,data0017.quan_on_hand,data0468.vendor,data0468.QUAN_ISSUED'+#13+
      'FROM   dbo.Data0468 INNER JOIN'+#13+
      'Data0556 ON Data0468.INVENT_PTR = Data0556.RKEY INNER JOIN'+#13+
      'Data0034 ON Data0468.DEPT_PTR = Data0034.RKEY INNER JOIN'+#13+
      'Data0017 ON data0556.rkey17 = data0017.RKEY INNER JOIN'+#13+
      'dbo.Data0002 ON dbo.Data0017.STOCK_UNIT_PTR = dbo.Data0002.RKEY'+#13+
      'where Data0468.cut_no='+quotedstr(dm.ADOQALL2CUT_NO.AsString)+#13+
      'and data0468.invent_or=1'+#13+

      'order by  Data0468.STEP';

     dm.TemADOQuery1.open;

     while not dm.TemADOQuery1.Eof do
      begin
       if stg2.Cells[11,stg2.RowCount-2]<>
          dm.TemADOQuery1.fieldbyname('DEPT_PTR').AsString then
        stg2.Cells[0,stg2.RowCount-1]:=dm.TemADOQuery1.fieldbyname('DEPT_CODE').AsString;
       stg2.Cells[1,stg2.RowCount-1]:=dm.TemADOQuery1.fieldbyname('STEP').AsString;

       stg2.Cells[2,stg2.RowCount-1]:=dm.TemADOQuery1.fieldbyname('INV_PART_NUMBER').AsString;
       stg2.Cells[3,stg2.RowCount-1]:=dm.TemADOQuery1.fieldbyname('INV_NAME').AsString;
       stg2.Cells[4,stg2.RowCount-1]:=dm.TemADOQuery1.fieldbyname('INV_DESCRIPTION').AsString;
       stg2.Cells[5,stg2.RowCount-1]:=dm.TemADOQuery1.fieldbyname('UNIT_NAME').AsString;
       stg2.Cells[6,stg2.RowCount-1]:=dm.TemADOQuery1.fieldbyname('vendor').AsString;
       stg2.Cells[7,stg2.RowCount-1]:=
        format('%.8f',[dm.TemADOQuery1.fieldbyname('QUAN_BOM').AsFloat]);
       if dm.TemADOQuery1.fieldbyname('invent_or').AsInteger=0 then
        stg2.Cells[8,stg2.RowCount-1]:='标准'
       else
        stg2.Cells[8,stg2.RowCount-1]:='余料';
       stg2.Cells[9,stg2.RowCount-1]:=dm.TemADOQuery1.fieldbyname('PRINTIT').AsString;


       stg2.Cells[10,stg2.RowCount-1]:= dm.TemADOQuery1.fieldbyname('quan_on_hand').AsString;
       stg2.Cells[11,stg2.RowCount-1]:=dm.TemADOQuery1.fieldbyname('DEPT_PTR').AsString;
       stg2.Cells[12,stg2.RowCount-1]:=dm.TemADOQuery1.fieldbyname('INVENT_PTR').AsString;
       stg2.Cells[13,stg2.RowCount-1]:=dm.TemADOQuery1.fieldbyname('QUAN_ISSUED').AsString;
       stg2.RowCount:=stg2.RowCount+1;
       dm.TemADOQuery1.Next;
      end;  //end with dm.adoquery1 加载BOM
end;

procedure TFrmEditBom.N1Click(Sender: TObject);

begin
 try
 with   TForm_bominvt.Create(application) do
  begin
    combobox1.Items.Add(dm.ADOQALL2CUT_NO.Value);
    combobox1.ItemIndex:=0;
    edit1.Text:=dm.ADOQALL2MANU_PART_NUMBER.Value;
    rkey25.Caption:=dm.ADOQALL2d025_rkey.AsString;
   if ShowModal=mrok then
    begin
     stg2.cells[0,stg2.RowCount-1]:=edit2.Text; //'工序代码';
     stg2.cells[1,stg2.RowCount-1]:=edit9.Text; //'步骤';
     stg2.cells[2,stg2.RowCount-1]:=edit3.Text; //'材料编码';
     stg2.cells[3,stg2.RowCount-1]:=edit4.Text; //'材料名称';
     stg2.cells[4,stg2.RowCount-1]:=edit5.Text; //'材料规格';
     stg2.cells[5,stg2.RowCount-1]:=edit8.Text; //'单位';
     stg2.cells[6,stg2.RowCount-1]:=edit7.Text; //'供应商';
     stg2.cells[7,stg2.RowCount-1]:=edit6.text; //'配额';
     stg2.cells[8,stg2.RowCount-1]:=combobox2.Text; //'类型';
     if checkbox1.Checked then
      stg2.cells[9,stg2.RowCount-1]:='Y'
     else
      stg2.cells[9,stg2.RowCount-1]:='N'; //'列印';
     stg2.cells[10,stg2.RowCount-1]:=edit10.Text; //'当前库存';
     stg2.cells[11,stg2.RowCount-1]:=rkey34.caption; //'rkey34';
     stg2.cells[12,stg2.RowCount-1]:=rkey17.Caption; //'rkey17';
     stg2.cells[13,stg2.RowCount-1]:='0'; //发放数量
     stg2.RowCount:=stg2.RowCount+1;
     stg2.Row:=stg2.RowCount-2;
    end;
  end;
 finally
  Form_bominvt.Free;
 end;
end;

procedure TFrmEditBom.N3Click(Sender: TObject);
var
 i:integer;
begin
 for i:=stg2.Row to stg2.RowCount-2 do
  stg2.Rows[i].Text:=stg2.Rows[i+1].Text;
 stg2.RowCount:=stg2.RowCount-1;
end;

procedure TFrmEditBom.N2Click(Sender: TObject);

begin
 try
 with   TForm_bominvt.Create(application) do
  begin
    combobox1.Items.Add(dm.ADOQALL2CUT_NO.Value);
    combobox1.ItemIndex:=0;
    edit1.Text:=dm.ADOQALL2MANU_PART_NUMBER.Value;
    rkey25.Caption:=dm.ADOQALL2d025_rkey.AsString;

    edit9.Text:=stg2.cells[1,stg2.row]; //'步骤';
    edit3.Text:=stg2.cells[2,stg2.row]; //'材料编码';
    edit4.Text:=stg2.cells[3,stg2.row]; //'材料名称';
    edit5.Text:=stg2.cells[4,stg2.row]; //'材料规格';
    edit8.Text:=stg2.cells[5,stg2.row]; //'单位';
    edit7.Text:=stg2.cells[6,stg2.row]; //'供应商';
    edit6.text:=stg2.cells[7,stg2.row]; //'配额';
    combobox2.ItemIndex:= //'类型';
      combobox2.Items.IndexOf(stg2.cells[8,stg2.row]);
    checkbox1.Checked:=
     stg2.cells[9,stg2.row]='Y'; //'列印';

    edit10.Text:=stg2.cells[10,stg2.row]; //'当前库存';

    rkey34.caption:=stg2.cells[11,stg2.row]; //'rkey34';
    rkey17.Caption:=stg2.cells[12,stg2.row]; //'rkey17';
    combobox1.Enabled:=false;
    combobox2.Enabled:=false;
   if ShowModal=mrok then
    begin
      stg2.cells[0,stg2.row]:=edit2.Text; //'工序代码';
      stg2.cells[1,stg2.row]:=edit9.Text; //'步骤';
      stg2.cells[2,stg2.row]:=edit3.Text; //'材料编码';
      stg2.cells[3,stg2.row]:=edit4.Text; //'材料名称';
      stg2.cells[4,stg2.row]:=edit5.Text; //'材料规格';
      stg2.cells[5,stg2.row]:=edit8.Text; //'单位';
      stg2.cells[6,stg2.row]:=edit7.Text; //'供应商';
      stg2.cells[7,stg2.row]:=edit6.text; //'配额';
      stg2.cells[8,stg2.row]:=combobox2.Text; //'类型';
      if checkbox1.Checked then
       stg2.cells[9,stg2.row]:='Y'
      else
       stg2.cells[9,stg2.row]:='N'; //'列印';
      stg2.cells[10,stg2.row]:=edit10.Text; //'当前库存';

      stg2.cells[11,stg2.row]:=rkey34.caption; //'rkey34';
      stg2.cells[12,stg2.row]:=rkey17.Caption; //'rkey17';
    end;
  end;
 finally
  Form_bominvt.Free;
 end;
end;


procedure TFrmEditBom.BitBtn1Click(Sender: TObject);
var
 i_j:integer;
 sql_text:string;
begin
 dm.ADOConnection1.BeginTrans;
 try
 sql_text:='delete data0468 where CUT_NO='+quotedstr(dm.ADOQALL2CUT_NO.Value);
 dm.TemADOQuery1.Close;
 dm.TemADOQuery1.SQL.Text:=sql_text;
 dm.TemADOQuery1.ExecSQL;

 dm.AQY468.Close;
 dm.AQY468.Parameters.ParamByName('CUT_NO').Value:=dm.ADOQALL2CUT_NO.Value;
 dm.AQY468.Open;
 for i_j:=1 to stg2.RowCount-2 do
  begin
   dm.AQY468.Append;
   dm.AQY468CUT_NO.Value:=dm.ADOQALL2CUT_NO.Value;
   dm.AQY468SO_NO.AsVariant:=dm.ADOQALL2SO_NO.AsVariant;
   dm.AQY468STEP.Value:=strtoint(stg2.cells[1,i_j]);
   dm.AQY468DEPT_PTR.Value:=strtoint(stg2.cells[11,i_j]);
   dm.AQY468INVENT_PTR.Value:=strtoint(stg2.cells[12,i_j]);
   dm.AQY468QUAN_BOM.Value:=strtofloat(stg2.cells[7,i_j]);
   dm.AQY468STATUS.Value:=0;
   dm.AQY468VENDOR.Value:=stg2.Cells[6,i_j];
   if stg2.Cells[8,i_j]='标准' then
    dm.AQY468Invent_or.Value:=0
   else
    dm.AQY468Invent_or.Value:=1;
   dm.AQY468printit.Value:=stg2.Cells[9,i_j];
   dm.AQY468.Post;
  end; //end for i_j
 dm.ADOQALL2.Post;
 dm.ADOConnection1.CommitTrans ;
 showmsg('修改保存成功',1);
 self.ModalResult:=mrok;
except
 on E: Exception do
  begin
   dm.ADOConnection1.RollbackTrans;
   messagedlg(E.Message,mterror,[mbcancel],0);
  end;
end;
end;

procedure TFrmEditBom.N4Click(Sender: TObject);
var
 i:integer;
begin
  for i:=1 to stg2.RowCount-2 do
  begin
    stg2.cells[7,i] := FloatToStr(Ceil(strtofloat(stg2.cells[7,i])));
  end;

end;

end.
