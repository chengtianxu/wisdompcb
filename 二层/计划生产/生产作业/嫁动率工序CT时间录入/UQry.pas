unit UQry;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Menus, Grids, Buttons, StdCtrls;

type
  TFrmQry = class(TForm)
    pnl1: TPanel;
    grp1: TGroupBox;
    lbl_field: TLabel;
    edt_Value: TEdit;
    btn_add: TButton;
    lst1: TListBox;
    txt1: TStaticText;
    btn_del: TButton;
    btn_qry: TBitBtn;
    txt2: TStaticText;
    sgrid1: TStringGrid;
    btn_OK: TButton;
    btn_cancel: TButton;
    pm1: TPopupMenu;
    N1: TMenuItem;
    procedure btn_qryClick(Sender: TObject);
    procedure btn_addClick(Sender: TObject);
    procedure lst1Click(Sender: TObject);
    procedure btn_delClick(Sender: TObject);
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

procedure TFrmQry.btn_qryClick(Sender: TObject);
var
  InputVar: PDlgInput ;
begin
try
  frmpick_item_single:=Tfrmpick_item_single.Create(application);

    case self.lst1.ItemIndex of
    0:
    begin
         InputVar.Fields := 'manu_part_number/本厂编号/200,manu_part_desc/品号名称/350';

           InputVar.Sqlstr := 'SELECT  TOP 100 PERCENT  manu_part_number , manu_part_desc  from data0025';
         InputVar.AdoConn := dm.con1;
          InputVar.KeyField := 'manu_part_number';
          frmPick_Item_Single.InitForm_New(InputVar);
          if frmPick_Item_Single.ShowModal=mrok then
          edt_value.Text := frmPick_Item_Single.adsPick.FieldValues['manu_part_number'];

    end;
    1:
     begin
       InputVar.Fields := 'rkey/ID/100,MName/机台名称/300';

          InputVar.Sqlstr := 'SELECT  cid, MNAME FROM  dbo.data0580    ';
         InputVar.AdoConn := dm.con1;
          InputVar.KeyField := 'cid';
          frmPick_Item_Single.InitForm_New(InputVar);
          if frmPick_Item_Single.ShowModal=mrok then
          edt_value.Text := frmPick_Item_Single.adsPick.FieldValues['MNAME'];
     end;
     2:
     begin
       InputVar.Fields := 'DEPT_CODE/工序编号/100,DEPT_NAME/工序名称/300';

          InputVar.Sqlstr := 'SELECT  TOP 100 PERCENT DEPT_CODE, DEPT_NAME FROM  dbo.Data0034 where  TTYPE = 1  ';
         InputVar.AdoConn := dm.con1;
          InputVar.KeyField := 'DEPT_CODE';
          frmPick_Item_Single.InitForm_New(InputVar);
          if frmPick_Item_Single.ShowModal=mrok then
          edt_value.Text := frmPick_Item_Single.adsPick.FieldValues['DEPT_CODE'];
     end;
    3:
     begin
       InputVar.Fields := 'rkey/ID/100,user_full_name/姓名/150';

          InputVar.Sqlstr := 'select  rkey, user_full_name   from data0073 where active_flag=0  ';
         InputVar.AdoConn := dm.con1;
          InputVar.KeyField := 'rkey';
          frmPick_Item_Single.InitForm_New(InputVar);
          if frmPick_Item_Single.ShowModal=mrok then
          edt_value.Text := frmPick_Item_Single.adsPick.FieldValues['user_full_name'];
     end;

     5:
     begin
       InputVar.Fields := 'rkey/ID/100,cname/嫁动率名称/150';

          InputVar.Sqlstr := ' select rkey, cname from data0578   ';
         InputVar.AdoConn := dm.con1;
          InputVar.KeyField := 'rkey';
          frmPick_Item_Single.InitForm_New(InputVar);
          if frmPick_Item_Single.ShowModal=mrok then
          edt_value.Text := frmPick_Item_Single.adsPick.FieldValues['cname'];
     end;




    end;

 finally
  frmPick_Item_Single.adsPick.Close;
  frmPick_Item_Single.Free ;
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

procedure TfrmQry.update_sgrid(sgrid_row: byte);
var
  s:string;
  PStatus:integer;
begin
 sgrid1.Cells[0,sgrid_row]:=lst1.Items[lst1.itemindex];
 sgrid1.Cells[1,sgrid_row]:=edt_value.Text;
 case lst1.ItemIndex of
 0:
  sgrid1.Cells[2,sgrid_row]:='and b.manu_part_number like  ''%'+edt_value.Text+'%'' ';
 1:
  sgrid1.Cells[2,sgrid_row]:='and a.machine = '''+edt_value.Text+''' ';
 2:
  sgrid1.Cells[2,sgrid_row]:='and c.dept_code = '''+edt_value.Text+''' ';
 3:
  sgrid1.Cells[2,sgrid_row]:='and d.user_full_name ='''+edt_value.Text+''' ';
  4:
  sgrid1.Cells[2,sgrid_row]:='and a.stackNum ='+edt_value.Text+' ';
  5:
  sgrid1.Cells[2,sgrid_row]:='and d578.Cname ='''+edt_value.Text+''' ';


 end;
end;

procedure TFrmQry.lst1Click(Sender: TObject);
begin
lbl_field.Caption:=lst1.Items[lst1.itemindex];
edt_value.Text:='';


end;

procedure TFrmQry.btn_delClick(Sender: TObject);
var i :integer;
begin
 
 for i:=1 to sgrid1.RowCount-2 do
 sgrid1.Rows[i].Clear;
 sgrid1.RowCount:=2;


end;

end.
