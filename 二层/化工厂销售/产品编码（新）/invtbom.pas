unit invtbom;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, Buttons, ExtCtrls, Menus,db,Pick_Item_Single;

type
  TFrm_invtbom = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    stg2: TStringGrid;
    PopupMenu2: TPopupMenu;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    BitBtn3: TBitBtn;
    N1: TMenuItem;
    N2: TMenuItem;
    lbl1: TLabel;
    lbl2: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure PopupMenu2Popup(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure stg2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
  private
    { Private declarations }
     frmPick_Item : TfrmPick_Item_Single;
  public
    { Public declarations }
  end;

var
  Frm_invtbom: TFrm_invtbom;

implementation

uses DM_u, bominvt,common, Frm_main_u,ConstVar;

{$R *.dfm}

procedure TFrm_invtbom.FormActivate(Sender: TObject);
var
 i,stg2rowcount:integer;
begin
with stg2 do
 begin
  cells[0,0]:='材料编码';
  cells[1,0]:='材料名称';
  cells[2,0]:='材料规格';
  cells[3,0]:='单位';
  cells[4,0]:='当前库存';
  cells[5,0]:='配额';
  cells[6,0]:='类型';
  cells[7,0]:='备注';
  cells[8,0]:='rkey17';
  ColWidths[8]:=-1;
 end;
 with dm.Tmp do
  begin
  close;
  sql.Text:=
  'SELECT   Data0017.INV_PART_NUMBER,'+#13+
  'dbo.Data0017.INV_NAME, dbo.Data0017.INV_DESCRIPTION,'+#13+
  'dbo.Data0002.UNIT_NAME, dbo.Data0017.QUAN_ON_HAND, dbo.Data0148.QUAN_BOM,'+#13+
  ' dbo.Data0148.VENDOR,'+#13+
  'Data0148.INVENT_PTR'+#13+
  'FROM   dbo.Data0002 INNER JOIN'+#13+
  '  dbo.Data0017 ON dbo.Data0002.RKEY = dbo.Data0017.STOCK_UNIT_PTR INNER JOIN'+#13+
  '  dbo.Data0148 ON dbo.Data0017.RKEY = dbo.Data0148.INVENT_PTR'+#13+
  'WHERE    (dbo.Data0148.invent_or = 0)'+#13+
  'and data0148.PART_PTR='+dm.D08RKEY.AsString;
  open;
  end;
 stg2.RowCount:=stg2.RowCount+dm.Tmp.RecordCount;

 for i:=1 to dm.Tmp.RecordCount do
 begin
  with stg2 do
   begin
    cells[0,i]:=dm.Tmp.fieldbyname('INV_PART_NUMBER').AsString; //'材料编码';
    cells[1,i]:=dm.Tmp.fieldbyname('INV_NAME').AsString;        //'材料名称';
    cells[2,i]:=dm.Tmp.fieldbyname('INV_DESCRIPTION').AsString; //'材料规格';
    cells[3,i]:=dm.Tmp.fieldbyname('UNIT_NAME').AsString;       //'单位';
    cells[4,i]:=dm.Tmp.fieldbyname('QUAN_ON_HAND').AsString;    //'当前库存';
    cells[5,i]:=dm.Tmp.fieldbyname('QUAN_BOM').AsString;        //'配额';
    cells[6,i]:='标准物料'; //'类型';
    cells[7,i]:=dm.Tmp.fieldbyname('VENDOR').AsString;         //'备注';
    cells[8,i]:=dm.Tmp.fieldbyname('INVENT_PTR').AsString;     //'rkey17';
   end;
  dm.Tmp.Next;
 end;

stg2rowcount:=stg2.RowCount-2;

 with dm.Tmp do
  begin
  close;
  sql.Text:=
   'SELECT   Data0002.UNIT_NAME,'+#13+
   'Data0148.QUAN_BOM,  Data0148.VENDOR,'+#13+
   'Data0148.INVENT_PTR, Data0008.PROD_CODE,'+#13+
   'Data0008.PRODUCT_NAME, Data0008.PRODUCT_DESC, Data0008.qty_onhand'+#13+
   'FROM         dbo.Data0002 INNER JOIN'+#13+
   '         dbo.Data0008 ON dbo.Data0002.RKEY = dbo.Data0008.unit_ptr INNER JOIN'+#13+
   '         dbo.Data0148 ON dbo.Data0008.RKEY = dbo.Data0148.INVENT_PTR'+#13+
    'WHERE  (dbo.Data0148.invent_or = 1)'+#13+
    'and data0148.PART_PTR='+dm.D08RKEY.AsString;
  open;
  end;
 stg2.RowCount:=stg2.RowCount+dm.Tmp.RecordCount;

 for i:=1 to dm.Tmp.RecordCount do
 begin
  with stg2 do
   begin
    cells[0,i+stg2rowcount] := dm.Tmp.fieldbyname('PROD_CODE').AsString;       //'材料编码';
    cells[1,i+stg2rowcount] := dm.Tmp.fieldbyname('PRODUCT_NAME').AsString;    //'材料名称';
    cells[2,i+stg2rowcount] := dm.Tmp.fieldbyname('PRODUCT_DESC').AsString;    //'材料规格';
    cells[3,i+stg2rowcount] := dm.Tmp.fieldbyname('UNIT_NAME').AsString;       //'单位';
    cells[4,i+stg2rowcount]:=dm.Tmp.fieldbyname('qty_onhand').AsString;        //'当前库存';
    cells[5,i+stg2rowcount]:=dm.Tmp.fieldbyname('QUAN_BOM').AsString;          //'配额';
    cells[6,i+stg2rowcount]:='半成品'; //'类型';
    cells[7,i+stg2rowcount]:=dm.Tmp.fieldbyname('VENDOR').AsString;        //'备注';
    cells[8,i+stg2rowcount]:=dm.Tmp.fieldbyname('INVENT_PTR').AsString;    //'rkey17';
   end;

  dm.Tmp.Next;
 end;
 
end;

procedure TFrm_invtbom.PopupMenu2Popup(Sender: TObject);
begin
if stg2.Cells[1,stg2.Row] <> '' then
if stg2.Row=stg2.RowCount-1 then
 begin
  n4.Enabled:=false;
  n5.Enabled:=false;
 end
else
 begin
  n4.Enabled:=true;
  n5.Enabled:=true;
 end;
end;

procedure TFrm_invtbom.N3Click(Sender: TObject);
var
 i:integer;
begin
 try
 with   TForm_bominvt.Create(application) do
  begin
   if ShowModal=mrok then
    begin
     for i:=1 to stg2.RowCount-2 do
     if (stg2.cells[6,i]=combobox2.Text) and
        (stg2.cells[8,i]=rkey17.Caption) then
      begin
       showmsg('材料编码重复',1);    
       exit;
      end;
     stg2.cells[0,stg2.RowCount-1]:=edit3.Text;      //'材料编码';
     stg2.cells[1,stg2.RowCount-1]:=edit4.Text;      //'材料名称';
     stg2.cells[2,stg2.RowCount-1]:=edit5.Text;      //'材料规格';
     stg2.cells[3,stg2.RowCount-1]:=edit8.Text;      //'单位';
     stg2.cells[4,stg2.RowCount-1]:=edit10.Text;     //'当前库存';
     stg2.cells[5,stg2.RowCount-1]:=edit6.text;      //'配额';
     stg2.cells[6,stg2.RowCount-1]:=combobox2.Text; //'类型';
     stg2.cells[7,stg2.RowCount-1]:=edit7.Text;  //'备注';
     stg2.cells[8,stg2.RowCount-1]:=rkey17.Caption; //'rkey17';
     stg2.RowCount:=stg2.RowCount+1;
     stg2.Row:=stg2.RowCount-2;
    end;
  end;
 finally
  Form_bominvt.Free;
 end;
end;

procedure TFrm_invtbom.N5Click(Sender: TObject);
var
 i:integer;
begin
 for i:=stg2.Row to stg2.RowCount-2 do
  stg2.Rows[i].Text:=stg2.Rows[i+1].Text;
 stg2.RowCount:=stg2.RowCount-1;
end;

procedure TFrm_invtbom.N4Click(Sender: TObject);
var
 i:integer;
begin
 try
  with  TForm_bominvt.Create(application) do
  begin
    edit3.Text:=stg2.cells[0,stg2.row];  //'材料编码';
    edit4.Text:=stg2.cells[1,stg2.row];  //'材料名称';
    edit5.Text:=stg2.cells[2,stg2.row];  //'材料规格';
    edit8.Text:=stg2.cells[3,stg2.row];  //'单位';
    edit10.Text:=stg2.cells[4,stg2.row]; //'当前库存';
    edit6.text:=stg2.cells[5,stg2.row];  //'配额';
    combobox2.ItemIndex:= //'类型';
      combobox2.Items.IndexOf(stg2.cells[6,stg2.row]);
    edit7.Text:=stg2.cells[7,stg2.row]; //'备注';
    rkey17.Caption:=stg2.cells[8,stg2.row]; //'rkey17';
    combobox2.Enabled:=false;

   if ShowModal=mrok then
    begin

     for i:=1 to stg2.RowCount-2 do
     if (stg2.cells[6,i]=combobox2.Text) and
        (stg2.cells[8,i]=rkey17.Caption) and
        (i<>stg2.Row)then
      begin
       showmsg('材料编码重复',1);
       exit;
      end;

     stg2.cells[0,stg2.row]:=edit3.Text;      //'材料编码';
     stg2.cells[1,stg2.row]:=edit4.Text;      //'材料名称';
     stg2.cells[2,stg2.row]:=edit5.Text;      //'材料规格';
     stg2.cells[3,stg2.row]:=edit8.Text;      //'单位';
     stg2.cells[4,stg2.row]:=edit10.Text;     //'当前库存';
     stg2.cells[5,stg2.row]:=edit6.text;      //'配额';
     stg2.cells[6,stg2.row]:=combobox2.Text;  //'类型';
     stg2.cells[7,stg2.row]:=edit7.Text;      //'备注';
     stg2.cells[8,stg2.row]:=rkey17.Caption;  //'rkey17';
    end;
  end;
 finally
  Form_bominvt.Free;
 end;
end;

procedure TFrm_invtbom.stg2MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
 column,row:longint;//右键选择stringgrid控件的方法
begin
    if button=mbright then
     begin
      stg2.MouseToCell(x,y,column,row);
       if not dm.Tmp.IsEmpty  then
        begin
          if row=0 then  stg2.PopupMenu := nil else
                                                      stg2.PopupMenu := PopupMenu2;
                                                      if (row < 0) then
                                                      begin
                                                                n4.Enabled:=false;
                                                                n5.Enabled:=false;
                                                              end else
                                                                    if (row <> 0) then
                                                                    begin
                                                                          stg2.Row:=row;
                                                                          n4.Enabled:=true;
                                                                          n5.Enabled:=true;
                                                                    end;
        end
                                                              else
                                                              begin
                                                                    n4.Enabled:=false;
                                                                    n5.Enabled:=false;
                                                              end;
                                                      end;
end;



procedure TFrm_invtbom.BitBtn3Click(Sender: TObject);
begin
if stg2.RowCount > 2 then
Export_Grid_to_Excel(stg2,'产品材料清单'+dm.D08PROD_CODE.Value+dm.D08PRODUCT_NAME.Value,false);
end;

procedure TFrm_invtbom.BitBtn1Click(Sender: TObject);
var
 i:integer;
begin
dm.ADOCon.BeginTrans;
try
 with dm.Tmp do
  begin
   close;
   sql.Text:=
    'delete data0148 '+
    'where PART_PTR='+dm.D08RKEY.AsString;
    ExecSQL;
  end;

 with dm.Tmp do
  begin
   close;
   sql.Text:=
    'SELECT PART_PTR,INVENT_PTR,QUAN_BOM,'+
    'VENDOR, invent_or FROM  dbo.Data0148 where PART_PTR is null';
    open;
  end;
for i:=1 to stg2.RowCount-2 do
begin
 dm.Tmp.Append;
 dm.Tmp.FieldValues['PART_PTR']:=dm.D08RKEY.Value;
 dm.Tmp.FieldValues['INVENT_PTR']:=stg2.Cells[8,i];
 dm.Tmp.FieldValues['QUAN_BOM']:=stg2.Cells[5,i];
 dm.Tmp.FieldValues['VENDOR']:=stg2.Cells[7,i];
 if stg2.Cells[6,i]='标准物料' then
  dm.Tmp.FieldValues['invent_or']:=0
 else
   dm.Tmp.FieldValues['invent_or']:=1;
 dm.Tmp.Post;
end;
 dm.ADOCon.CommitTrans;
 self.ModalResult:=mrok;
except
 on E: Exception do
  begin
   dm.ADOCon.RollbackTrans;
   messagedlg(E.Message,mterror,[mbcancel],0);
  end;
end;
end;

procedure TFrm_invtbom.N2Click(Sender: TObject);
var
  InputVar: PDlgInput ;
  i,stg2rowcount:integer;
begin

  if (lbl1.Caption <> '') and (lbl2.Caption <> '') then
  begin
      frmPick_Item := TfrmPick_Item_Single.Create(application) ;
      InputVar.Fields := 'PROD_CODE/产品编码/90,PRODUCT_NAME/产品名称/120,'+
                        'PRODUCT_DESC/产品规格/120,ttype_c/类别/50';
      InputVar.Sqlstr :=  'SELECT     dbo.Data0008.*, dbo.Data0007.PR_GRP_CODE, dbo.Data0007.PRODUCT_GROUP_NAME, dbo.Data0002.UNIT_CODE, dbo.Data0002.UNIT_NAME,' +#13
                          +'dbo.Data0034.DEPT_CODE, dbo.Data0034.DEPT_NAME,'+#13
                          +'case when data0008.ttype=0 then ''半成品''  else ''成品'' end ttype_c'+#13
                          +'FROM         dbo.Data0008 INNER JOIN'+#13
                          +'dbo.Data0007 ON dbo.Data0008.PR_GRP_POINTER = dbo.Data0007.RKEY INNER JOIN'+#13
                          +'dbo.Data0002 ON dbo.Data0008.unit_ptr = dbo.Data0002.RKEY INNER JOIN'+#13
                          +'dbo.Data0034 ON dbo.Data0008.DEPT_PTR = dbo.Data0034.RKEY'+#13
                          +'WHERE (data0008.ttype = '+lbl1.Caption+') AND (data0008.RKEY <> '+lbl2.Caption+') order by data0008.prod_code'+#13;
      inputvar.KeyField:='PROD_CODE';
      InputVar.AdoConn := dm.ADOCon;
      if  stg2.RowCount > 2 then
      begin
        if application.MessageBox('原内容将被导入数据替换，是否继续?','提示',mb_yesno)=idyes then
        begin
            frmPick_Item.InitForm_New(InputVar);
            if frmPick_Item.ShowModal=mrok then
            begin
                 if frmPick_Item.adsPick1.FieldByName('ttype').AsString = lbl1.Caption then
                 begin
                     with Stg2 do for i := 1 to RowCount - 1 do Rows[i].Clear;
                     stg2.RowCount := 2;
                      with dm.Tmp do
                      begin
                          close;
                          sql.Text:=
                          'SELECT   Data0017.INV_PART_NUMBER,'+#13+
                          'dbo.Data0017.INV_NAME, dbo.Data0017.INV_DESCRIPTION,'+#13+
                          'dbo.Data0002.UNIT_NAME, dbo.Data0017.QUAN_ON_HAND, dbo.Data0148.QUAN_BOM,'+#13+
                          ' dbo.Data0148.VENDOR,'+#13+
                          'Data0148.INVENT_PTR'+#13+
                          'FROM   dbo.Data0002 INNER JOIN'+#13+
                          '  dbo.Data0017 ON dbo.Data0002.RKEY = dbo.Data0017.STOCK_UNIT_PTR INNER JOIN'+#13+
                          '  dbo.Data0148 ON dbo.Data0017.RKEY = dbo.Data0148.INVENT_PTR'+#13+
                          'WHERE    (dbo.Data0148.invent_or = 0)'+#13+
                          'and data0148.PART_PTR='+  frmPick_Item.adsPick1.FieldByName('rkey').AsString;
                          open;
                      end;
                         stg2.RowCount:=stg2.RowCount+dm.Tmp.RecordCount;

                         for i:=1 to dm.Tmp.RecordCount do
                         begin
                          with stg2 do
                           begin
                            cells[0,i]:=dm.Tmp.fieldbyname('INV_PART_NUMBER').AsString; //'材料编码';
                            cells[1,i]:=dm.Tmp.fieldbyname('INV_NAME').AsString;        //'材料名称';
                            cells[2,i]:=dm.Tmp.fieldbyname('INV_DESCRIPTION').AsString; //'材料规格';
                            cells[3,i]:=dm.Tmp.fieldbyname('UNIT_NAME').AsString;       //'单位';
                            cells[4,i]:=dm.Tmp.fieldbyname('QUAN_ON_HAND').AsString;    //'当前库存';
                            cells[5,i]:=dm.Tmp.fieldbyname('QUAN_BOM').AsString;        //'配额';
                            cells[6,i]:='标准物料'; //'类型';
                            cells[7,i]:=dm.Tmp.fieldbyname('VENDOR').AsString;         //'备注';
                            cells[8,i]:=dm.Tmp.fieldbyname('INVENT_PTR').AsString;     //'rkey17';
                           end;
                          dm.Tmp.Next;
                         end;

                        stg2rowcount:=stg2.RowCount-2;

                         with dm.Tmp do
                          begin
                          close;
                          sql.Text:=
                           'SELECT   Data0002.UNIT_NAME,'+#13+
                           'Data0148.QUAN_BOM,  Data0148.VENDOR,'+#13+
                           'Data0148.INVENT_PTR, Data0008.PROD_CODE,'+#13+
                           'Data0008.PRODUCT_NAME, Data0008.PRODUCT_DESC, Data0008.qty_onhand'+#13+
                           'FROM         dbo.Data0002 INNER JOIN'+#13+
                           '         dbo.Data0008 ON dbo.Data0002.RKEY = dbo.Data0008.unit_ptr INNER JOIN'+#13+
                           '         dbo.Data0148 ON dbo.Data0008.RKEY = dbo.Data0148.INVENT_PTR'+#13+
                            'WHERE  (dbo.Data0148.invent_or = 1)'+#13+
                            'and data0148.PART_PTR='+frmPick_Item.adsPick1.FieldByName('rkey').AsString;
                          open;
                          end;
                         stg2.RowCount:=stg2.RowCount+dm.Tmp.RecordCount;

                         for i:=1 to dm.Tmp.RecordCount do
                         begin
                          with stg2 do
                           begin
                            cells[0,i+stg2rowcount] := dm.Tmp.fieldbyname('PROD_CODE').AsString;       //'材料编码';
                            cells[1,i+stg2rowcount] := dm.Tmp.fieldbyname('PRODUCT_NAME').AsString;    //'材料名称';
                            cells[2,i+stg2rowcount] := dm.Tmp.fieldbyname('PRODUCT_DESC').AsString;    //'材料规格';
                            cells[3,i+stg2rowcount] := dm.Tmp.fieldbyname('UNIT_NAME').AsString;       //'单位';
                            cells[4,i+stg2rowcount]:=dm.Tmp.fieldbyname('qty_onhand').AsString;        //'当前库存';
                            cells[5,i+stg2rowcount]:=dm.Tmp.fieldbyname('QUAN_BOM').AsString;          //'配额';
                            cells[6,i+stg2rowcount]:='半成品'; //'类型';
                            cells[7,i+stg2rowcount]:=dm.Tmp.fieldbyname('VENDOR').AsString;        //'备注';
                            cells[8,i+stg2rowcount]:=dm.Tmp.fieldbyname('INVENT_PTR').AsString;    //'rkey17';
                           end;

                          dm.Tmp.Next;
                         end;
                  end else showmsg('导入产品类型不同，无法导入...',1);
           end;
        end;
      end else  begin

                     frmPick_Item.InitForm_New(InputVar);
            if frmPick_Item.ShowModal=mrok then
            begin
                 if frmPick_Item.adsPick1.FieldByName('ttype').AsString = lbl1.Caption then
                 begin
                     with Stg2 do for i := 1 to RowCount - 1 do Rows[i].Clear;
                     stg2.RowCount := 2;
                      with dm.Tmp do
                      begin
                          close;
                          sql.Text:=
                          'SELECT   Data0017.INV_PART_NUMBER,'+#13+
                          'dbo.Data0017.INV_NAME, dbo.Data0017.INV_DESCRIPTION,'+#13+
                          'dbo.Data0002.UNIT_NAME, dbo.Data0017.QUAN_ON_HAND, dbo.Data0148.QUAN_BOM,'+#13+
                          ' dbo.Data0148.VENDOR,'+#13+
                          'Data0148.INVENT_PTR'+#13+
                          'FROM   dbo.Data0002 INNER JOIN'+#13+
                          '  dbo.Data0017 ON dbo.Data0002.RKEY = dbo.Data0017.STOCK_UNIT_PTR INNER JOIN'+#13+
                          '  dbo.Data0148 ON dbo.Data0017.RKEY = dbo.Data0148.INVENT_PTR'+#13+
                          'WHERE    (dbo.Data0148.invent_or = 0)'+#13+
                          'and data0148.PART_PTR='+  frmPick_Item.adsPick1.FieldByName('rkey').AsString;
                          open;
                      end;
                         stg2.RowCount:=stg2.RowCount+dm.Tmp.RecordCount;

                         for i:=1 to dm.Tmp.RecordCount do
                         begin
                          with stg2 do
                           begin
                            cells[0,i]:=dm.Tmp.fieldbyname('INV_PART_NUMBER').AsString; //'材料编码';
                            cells[1,i]:=dm.Tmp.fieldbyname('INV_NAME').AsString;        //'材料名称';
                            cells[2,i]:=dm.Tmp.fieldbyname('INV_DESCRIPTION').AsString; //'材料规格';
                            cells[3,i]:=dm.Tmp.fieldbyname('UNIT_NAME').AsString;       //'单位';
                            cells[4,i]:=dm.Tmp.fieldbyname('QUAN_ON_HAND').AsString;    //'当前库存';
                            cells[5,i]:=dm.Tmp.fieldbyname('QUAN_BOM').AsString;        //'配额';
                            cells[6,i]:='标准物料'; //'类型';
                            cells[7,i]:=dm.Tmp.fieldbyname('VENDOR').AsString;         //'备注';
                            cells[8,i]:=dm.Tmp.fieldbyname('INVENT_PTR').AsString;     //'rkey17';
                           end;
                          dm.Tmp.Next;
                         end;

                        stg2rowcount:=stg2.RowCount-2;

                         with dm.Tmp do
                          begin
                          close;
                          sql.Text:=
                           'SELECT   Data0002.UNIT_NAME,'+#13+
                           'Data0148.QUAN_BOM,  Data0148.VENDOR,'+#13+
                           'Data0148.INVENT_PTR, Data0008.PROD_CODE,'+#13+
                           'Data0008.PRODUCT_NAME, Data0008.PRODUCT_DESC, Data0008.qty_onhand'+#13+
                           'FROM         dbo.Data0002 INNER JOIN'+#13+
                           '         dbo.Data0008 ON dbo.Data0002.RKEY = dbo.Data0008.unit_ptr INNER JOIN'+#13+
                           '         dbo.Data0148 ON dbo.Data0008.RKEY = dbo.Data0148.INVENT_PTR'+#13+
                            'WHERE  (dbo.Data0148.invent_or = 1)'+#13+
                            'and data0148.PART_PTR='+frmPick_Item.adsPick1.FieldByName('rkey').AsString;
                          open;
                          end;
                         stg2.RowCount:=stg2.RowCount+dm.Tmp.RecordCount;

                         for i:=1 to dm.Tmp.RecordCount do
                         begin
                          with stg2 do
                           begin
                            cells[0,i+stg2rowcount] := dm.Tmp.fieldbyname('PROD_CODE').AsString;       //'材料编码';
                            cells[1,i+stg2rowcount] := dm.Tmp.fieldbyname('PRODUCT_NAME').AsString;    //'材料名称';
                            cells[2,i+stg2rowcount] := dm.Tmp.fieldbyname('PRODUCT_DESC').AsString;    //'材料规格';
                            cells[3,i+stg2rowcount] := dm.Tmp.fieldbyname('UNIT_NAME').AsString;       //'单位';
                            cells[4,i+stg2rowcount]:=dm.Tmp.fieldbyname('qty_onhand').AsString;        //'当前库存';
                            cells[5,i+stg2rowcount]:=dm.Tmp.fieldbyname('QUAN_BOM').AsString;          //'配额';
                            cells[6,i+stg2rowcount]:='半成品'; //'类型';
                            cells[7,i+stg2rowcount]:=dm.Tmp.fieldbyname('VENDOR').AsString;        //'备注';
                            cells[8,i+stg2rowcount]:=dm.Tmp.fieldbyname('INVENT_PTR').AsString;    //'rkey17';
                           end;

                          dm.Tmp.Next;
                         end;
                  end else showmsg('导入产品类型不同，无法导入...',1);
            end;

      end;
  end else   showmsg('系统出现异常，请与管理员联系',1);
end;


procedure TFrm_invtbom.btn1Click(Sender: TObject);
begin
    // ShowMessage(IntToStr(stg2.RowCount));
end;

end.
