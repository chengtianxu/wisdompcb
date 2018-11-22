unit Frm_YCB_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGridEh, ComCtrls, ADODB, DB, DBClient,
  dbcgrids, Mask, DBCtrls;

type
  TFrm_YCB = class(TForm)
    GroupBox1: TGroupBox;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    DBGridEh1: TDBGridEh;
    Button1: TButton;
    Button2: TButton;
    Label1: TLabel;
    Edit1: TEdit;
    DataSource1: TDataSource;
    ADO53_1: TADOQuery;
    ADO53_2: TADOQuery;
    DataSource2: TDataSource;
    DBGridEh2: TDBGridEh;
    procedure FormShow(Sender: TObject);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridEh2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    procedure CkClick(Sender: TObject);
  public
    FDt,Frkey10:string;
    FTag:integer;
    procedure initd; 
  end;

var
  Frm_YCB: TFrm_YCB;

implementation
 uses DM_u;
{$R *.dfm}

{ TFrm_YCB }

procedure TFrm_YCB.initd;
var L,i,j:integer;
begin
  DM.tmp.Close;
  DM.tmp.SQL.Text:='select rkey, code+'' ''+location code  from data0016 where location_type=1 order by 2';
  DM.tmp.Open;
  L:=GroupBox1.Width div 5 ;
  i:=0;
  j:=0;
  while not DM.tmp.Eof do
  begin
    with TCheckBox.Create(self) do
    begin
      left:=L*i+8;
      Top:=30*j+16;
      parent:=GroupBox1;
      tag:=DM.tmp.Fields[0].AsInteger;
      caption:=DM.tmp.Fields[1].AsString;
      checked:=pos('β',caption)=0;
      width:=L-8;
      onClick:=CkClick;
    end;
    if i<4 then inc(i) else begin i:=0;inc(j);end;
    DM.tmp.Next;
  end;
end;

procedure TFrm_YCB.FormShow(Sender: TObject);
begin
  if Ftag<>2 then initd;
  GroupBox1.Visible:=Ftag<>2;
  Button1.Enabled:=Ftag<>2;
  if Ftag=2 then PageControl1.Height:=PageControl1.Height+130;
  CkClick(nil);
end;

procedure TFrm_YCB.CkClick(Sender: TObject);
var i:integer;
    s,sSql:string;
begin
  ADO53_1.Close;
  ADO53_2.Close;
  if Ftag<>2 then
  begin
    for i:=0 to GroupBox1.ControlCount-1 do
      if TCheckBox(GroupBox1.Controls[i]).Checked then s:=s+inttostr(GroupBox1.Controls[i].Tag)+',';
    s:=' (-1,'+s+'-2) ';
    sSql:='SELECT dbo.Data0025.MANU_PART_NUMBER, dbo.Data0025.MANU_PART_DESC, dbo.Data0025.CUSTOMER_PTR, dbo.Data0053.RKEY,'+
                   'dbo.Data0053.QTY_ON_HAND, dbo.Data0016.CODE, dbo.Data0016.LOCATION, dbo.Data0015.WAREHOUSE_CODE,'+
                   'dbo.Data0015.WAREHOUSE_NAME, dbo.Data0053.MFG_DATE, dbo.Data0025.LATEST_PRICE,Data0053.QTY_ON_HAND*Data0025.LATEST_PRICE AllVal '+
                   'FROM dbo.Data0053 INNER JOIN '+
                   'dbo.Data0016 ON dbo.Data0053.LOC_PTR = dbo.Data0016.RKEY INNER JOIN '+
                   'dbo.Data0025 ON dbo.Data0053.CUST_PART_PTR = dbo.Data0025.RKEY INNER JOIN '+
                   'dbo.Data0015 ON dbo.Data0053.WHSE_PTR = dbo.Data0015.RKEY '+
                   'where dbo.Data0025.CUSTOMER_PTR='+Frkey10+
                   ' and Data0053.QTY_ON_HAND>0 and Data0053.LOC_PTR in '+s;

    ADO53_1.SQL.Text:=sSql+' and cast('''+FDt+''' as datetime)-Data0053.MFG_DATE>=60 and SUBSTRING(data0025.manu_part_number, 3, 1)<>''H'' order by dbo.Data0053.MFG_DATE,dbo.Data0025.MANU_PART_NUMBER';
    ADO53_2.SQL.Text:=sSql+' and cast('''+FDt+''' as datetime)-Data0053.MFG_DATE>=30 and SUBSTRING(data0025.manu_part_number, 3, 1)=''H'' order by dbo.Data0053.MFG_DATE,dbo.Data0025.MANU_PART_NUMBER';
  end else begin
    sSql:='SELECT dbo.data0126.*, dbo.Data0016.CODE, dbo.Data0016.LOCATION, dbo.Data0025.MANU_PART_NUMBER, dbo.Data0025.MANU_PART_DESC,'+
          'dbo.Data0015.WAREHOUSE_CODE, dbo.Data0015.WAREHOUSE_NAME, dbo.Data0053.MFG_DATE,Data0126.QTY_ON_HAND*Data0126.LATEST_PRICE AllVal '+
          'FROM dbo.data0126 INNER JOIN '+
                'dbo.Data0053 ON dbo.data0126.rkey53 = dbo.Data0053.RKEY INNER JOIN '+
                'dbo.Data0025 ON dbo.Data0053.CUST_PART_PTR = dbo.Data0025.RKEY INNER JOIN '+
                'dbo.Data0016 ON dbo.Data0053.LOC_PTR = dbo.Data0016.RKEY INNER JOIN '+
                'dbo.Data0015 ON dbo.Data0053.WHSE_PTR = dbo.Data0015.RKEY '+
          'where dbo.data0126.rkey122='+DM.ADO122.FieldByName('rkey').AsString;
    ADO53_1.SQL.Text:=sSql+' and SUBSTRING(data0025.manu_part_number, 3, 1)<>''H'' order by dbo.Data0053.MFG_DATE,dbo.Data0025.MANU_PART_NUMBER';
    ADO53_2.SQL.Text:=sSql+' and SUBSTRING(data0025.manu_part_number, 3, 1)=''H'' order by dbo.Data0053.MFG_DATE,dbo.Data0025.MANU_PART_NUMBER';
  end;
  ADO53_1.Open;
  ADO53_2.Open;
  Edit1.Text:=floattostr(strtofloat(DBGridEh1.GetFooterValue(1,DBGridEh1.Columns[5]))+strtofloat(DBGridEh2.GetFooterValue(1,DBGridEh2.Columns[5])));
end;

procedure TFrm_YCB.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (ssAlt in Shift)  and  (Key=86) then
  showmessage(ADO53_1.SQL.Text);
end;

procedure TFrm_YCB.DBGridEh2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (ssAlt in Shift)  and  (Key=86) then
  showmessage(ADO53_2.SQL.Text);
end;

end.
