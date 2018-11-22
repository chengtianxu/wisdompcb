unit UQry;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Menus, Grids, StdCtrls, Buttons, ComCtrls,DateUtils;

type
  TFrmQry = class(TForm)
    pnl1: TPanel;
    pnl2: TPanel;
    grp1: TGroupBox;
    lbl_field: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl_rkey15: TLabel;
    dtpt1: TDateTimePicker;
    dtp1: TDateTimePicker;
    btn_add: TButton;
    btn_sel: TBitBtn;
    lst1: TListBox;
    txt1: TStaticText;
    dtp2: TDateTimePicker;
    dtpt2: TDateTimePicker;
    txt2: TStaticText;
    sgrid1: TStringGrid;
    btn_OK: TButton;
    btn_cancel: TButton;
    pm1: TPopupMenu;
    N1: TMenuItem;
    edt_value: TEdit;
    procedure lst1Click(Sender: TObject);
    procedure btn_selClick(Sender: TObject);
    procedure btn_addClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);

  private
    { Private declarations }
    procedure update_sgrid(sgrid_row: byte);
  public
    { Public declarations }
  end;

var
  FrmQry: TFrmQry;

implementation

uses UDM,Pick_Item_Single,ConstVar;

{$R *.dfm}

procedure TFrmQry.lst1Click(Sender: TObject);
begin
 
lbl_field.Caption:=lst1.Items[lst1.itemindex];
edt_value.Text:='';
edt_value.Visible:=false;

btn_sel.Visible:=false;
 lbl_field.Visible:=false;
lbl4.Visible:=false;
lbl5.Visible:=false;

dtp1.Visible:=false;
dtp2.Visible:=false;
dtpt1.Visible:=false;
dtpt2.Visible:=false;

 case lst1.ItemIndex of
 0:
 begin
 edt_value.Visible:=true;
  lbl_field.Visible:=true;
 end;

 1:
 begin
  lbl4.Visible:=true;
  lbl5.Visible:=true;
  dtp1.Visible:=true;
  dtp2.Visible:=true;
  dtpt1.Visible:=true;
  dtpt2.Visible:=true;
 end;

 end;

 end;

procedure TFrmQry.btn_selClick(Sender: TObject);
var
  InputVar: PDlgInput ;
begin

  frmpick_item_single:=Tfrmpick_item_single.Create(application);

case self.lst1.ItemIndex of
2:
begin
    InputVar.Fields := 'WAREHOUSE_CODE/工厂代码/100,WAREHOUSE_NAME/工厂名称,ABBR_NAME/工厂简称/500';
    InputVar.Sqlstr := 'SELECT  RKEY, WAREHOUSE_CODE, WAREHOUSE_NAME, ABBR_NAME '+
                        'FROM         Data0015 '+
                        'ORDER BY WAREHOUSE_CODE';
    InputVar.AdoConn := DM.con1;
    InputVar.KeyField := 'WAREHOUSE_CODE';
    frmPick_Item_Single.InitForm_New(InputVar);
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      edt_value.Text := frmPick_Item_Single.adsPick.FieldValues['WAREHOUSE_CODE'];
       lbl_rkey15.Caption := frmPick_Item_Single.adsPick.Fieldbyname('RKEY').AsString;
    end;
end;

4:
 begin
   InputVar.Fields := 'DEPT_CODE/工序编号/100,DEPT_NAME/工序名称/300';

      InputVar.Sqlstr := 'SELECT  TOP 100 PERCENT DEPT_CODE, DEPT_NAME FROM  dbo.Data0034 where  TTYPE = 1  ';
     InputVar.AdoConn := dm.con1;
      InputVar.KeyField := 'DEPT_CODE';
      frmPick_Item_Single.InitForm_New(InputVar);
      if frmPick_Item_Single.ShowModal=mrok then
      edt_value.Text := frmPick_Item_Single.adsPick.FieldValues['DEPT_CODE'];
 end;

end;
end;

procedure TFrmQry.btn_addClick(Sender: TObject);
var
 i:integer;
begin
 for i:=1 to sgrid1.RowCount-2 do
  if sgrid1.Cells[0,i]=lst1.Items[lst1.itemindex]  then
   begin
    update_sgrid(i);
    exit;
   end;

 update_sgrid(sgrid1.RowCount-1);

 sgrid1.RowCount:=sgrid1.RowCount+1;
end;

procedure TFrmQry.update_sgrid(sgrid_row: byte);
var
  s:string;
  PStatus:integer;
begin
 sgrid1.Cells[0,sgrid_row]:=lst1.Items[lst1.itemindex];
 sgrid1.Cells[1,sgrid_row]:=edt_value.Text;
 case lst1.ItemIndex of
 0:    //统计编号：
  sgrid1.Cells[2,sgrid_row]:='and a.BNo = '''+edt_value.Text+''' ';
 1:    //产出日期
 begin
   sgrid1.Cells[1,sgrid1.RowCount-1]:='从'+datetostr(dtp1.date)+'到'+datetostr(dtp2.date);
   sgrid1.Cells[2,sgrid1.RowCount-1]:=
   'and a.adate >= '''+formatdatetime('yyyy-mm-dd',dtp1.date)+
   formatdatetime(' hh:nn:ss',dtpt1.Time)+
   ''' and a.adate <= '''+formatdatetime('yyyy-mm-dd',dtp2.date)+
   formatdatetime(' hh:nn:ss',dtpt2.Time)+''' ';
 end;
 
 end;

 end;


procedure TFrmQry.FormCreate(Sender: TObject);
begin
   dtp1.Date:=IncDay(now,-1);
   dtp2.Date:=Now;
  // dtpt1.Date:=   '08:00:00';

end;

end.
