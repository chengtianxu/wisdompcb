unit count_input;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, Menus, ExtCtrls;

type
  TForm_input = class(TForm)
    SGrid1: TStringGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    Sgrid2: TStringGrid;
    Sgrid3: TStringGrid;
    Panel1: TPanel;
    Panel2: TPanel;
    BitBtn3: TBitBtn;
    procedure FormActivate(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure SGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure SGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure BitBtn1Enter(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
  v_colwidth: array[0..6] of integer;
  public
    { Public declarations }
  end;

var
  Form_input: TForm_input;

implementation

uses damo,main,count_add,count_empl_search;
{$R *.dfm}

procedure TForm_input.FormActivate(Sender: TObject);
var
 i:integer;
begin
 sgrid1.Cells[0,0] :='产品名称';
 sgrid1.Cells[1,0] :='产品类型';
 sgrid1.Cells[2,0] :='所在仓库';
 sgrid1.Cells[3,0] :='现有库存';
 sgrid1.Cells[4,0] := '盘点人员';
 sgrid1.Cells[5,0] := '盘点数量';
 sgrid1.Cells[6,0] := '盘点菲号';
 sgrid2.Cells[0,0] :='rkey';//记录所有的明细记录主键
 sgrid2.Cells[1,0] :='counted_by_empl_ptr';
 sgrid3.Cells[0,0] :='rkey';//记录要被删除掉的记录主键
//=====================================================================
edit1.Text:=dm.ado0214EMPLOYEE_NAME.AsString;
edit2.Text:=dm.ado0214DATE_CREATED.AsString;
//=====================================================================
 i:=1;
 dm.aq0215.Close;
 dm.aq0215.Parameters[0].Value:=dm.ado0214RKEY.AsInteger;
 dm.aq0215.Open;
 sgrid1.RowCount := dm.aq0215.RecordCount+2;
 sgrid2.RowCount := dm.aq0215.RecordCount+2;
 if dm.aq0215.IsEmpty then self.BitBtn1.Enabled := false;
 if not dm.Aq0215.IsEmpty then dm.Aq0215.First;
 while not dm.Aq0215.Eof do
  begin
   sgrid1.Cells[0,i] := dm.Aq0215.fieldbyname('product_name').AsString;
   sgrid1.Cells[1,i] := dm.Aq0215.FieldValues['product_group_name'];
   sgrid1.Cells[2,i] := dm.Aq0215.fieldbyname('location').AsString;
   sgrid1.Cells[3,i] := dm.Aq0215.fieldbyname('old_quantity').AsString;
   sgrid1.Cells[4,i] := dm.Aq0215.fieldbyname('EMPLOYEE_NAME').AsString;
   if dm.Aq0215.FieldByName('quantity').Value>=0 then
    sgrid1.Cells[5,i] :=dm.Aq0215.fieldbyname('quantity').AsString;
    sgrid1.Cells[6,i] :=dm.Aq0215.fieldbyname('check_no').AsString;
    sgrid2.Cells[0,i] :=dm.Aq0215.fieldbyname('rkey').AsString;;
    sgrid2.Cells[1,i] :=dm.Aq0215.fieldbyname('counted_by_empl_ptr').AsString;
   i := i+1;
   dm.Aq0215.Next;
  end;
end;


procedure TForm_input.N2Click(Sender: TObject);
begin
 try
  form_empl_search:=tform_empl_search.Create(application);
   if form_empl_search.ShowModal=mrok then
   begin
     sgrid1.Cells[4,sgrid1.row] := form_empl_search.ADOQuery1.fieldbyname('employee_name').AsString;
     sgrid2.Cells[1,sgrid1.row] :=form_empl_search.ADOQuery1.fieldbyname('rkey').AsString;
   end;
 finally
 form_empl_search.Free;
 end;
end;

procedure TForm_input.PopupMenu1Popup(Sender: TObject);
begin
if sgrid1.Row = sgrid1.RowCount-1 then
 begin
  n1.Enabled := false;
  n2.Enabled := false;
 end
else
 begin
  n1.Enabled := true;
  n2.Enabled := true;
 end;
end;

procedure TForm_input.N1Click(Sender: TObject);
var
 i:integer;
begin
if messagedlg('你确定要删除这一条记录吗?',mtconfirmation,[mbyes,mbno],0)=mryes then
begin
 sgrid3.Cells[0,sgrid3.RowCount-1]:=sgrid2.Cells[0,sgrid1.row];
 sgrid3.RowCount:=sgrid3.RowCount+1;   //记录被删除的盘点清单
 for i:=sgrid1.Row to sgrid1.RowCount-2 do
  begin
   sgrid1.Rows[i].Text:=sgrid1.Rows[i+1].Text;
   sgrid2.Rows[i].Text:=sgrid2.Rows[i+1].Text;
  end;
  sgrid1.RowCount:=sgrid1.RowCount-1;
  sgrid2.RowCount:=sgrid2.RowCount-1;
  if sgrid1.RowCount=2 then self.BitBtn1.Enabled:=false;
end;
end;

procedure TForm_input.BitBtn2Click(Sender: TObject);
begin
if messagedlg('你确定要退出输入界面吗?',mtconfirmation,[mbyes,mbno],0)=mryes then
self.Close;
end;

procedure TForm_input.BitBtn1Click(Sender: TObject);
var
 i:integer;
begin
 dm.adodata0215.Close;
 dm.adodata0215.Parameters[0].Value:=dm.ADO0214RKEY.Value;
 dm.adodata0215.Open;
 dm.ADOConnection1.BeginTrans;
//============================编辑盘点清单操作====================================
 try
 for i:=1 to sgrid2.RowCount-2 do
  begin
   if dm.ADOdata0215.Locate('rkey',strtoint(sgrid2.Cells[0,i]),[]) then
   if trim(sgrid1.Cells[5,i])<>'' then
    begin
     dm.ADOdata0215.Edit;
     dm.ADOdata0215.FieldByName('quantity').AsString := sgrid1.Cells[5,i];
     dm.ADOdata0215.FieldByName('counted_by_empl_ptr').AsString :=sgrid2.Cells[1,i] ;
     dm.ADOdata0215.FieldByName('check_no').Value := sgrid1.Cells[6,i];
     dm.ADOdata0215.FieldByName('status').Value:=1;//已输入
     dm.ADOdata0215.post;
    end;
 end;
//===========================删除盘点清单操作===================================
 if sgrid3.RowCount>2 then
 for i:=1 to sgrid3.RowCount-2 do
  if dm.ADOData0215.Locate('rkey',strtoint(sgrid3.Cells[0,i]),[]) then
   begin
    dm.ADOData0215.Edit;
    dm.ADOData0215.FieldByName('status').Value:=2;  //数据已经更新
    dm.ADOData0215.Post;
   end;

  dm.ADOConnection1.CommitTrans;
  messagedlg('数据保存成功!',mtinformation,[mbok],0);
 except
  on e: exception do
   begin
   dm.ADOConnection1.RollbackTrans;
   dm.ADOQuery1.Cancel;
   messagedlg(e.Message,mtwarning,[mbcancel],0);
   end;
  end;
 modalresult:=mrok;
end;

procedure TForm_input.SGrid1KeyPress(Sender: TObject; var Key: Char);
begin
if sgrid1.Col=5 then
 if  not (Key in ['0'..'9', '.', #8, #13]) then abort;
end;

procedure TForm_input.SGrid1SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
 if (arow=sgrid1.RowCount-1) then  canselect:=false ;
end;

procedure TForm_input.BitBtn1Enter(Sender: TObject);
var i:integer;
 begin
 for i:=1 to sgrid1.RowCount-2 do
 begin
 if (sgrid1.Cells[5,i]='') or( strtofloat(sgrid1.Cells[5,i])<0 ) then
 begin
 messagedlg('请输入盘点数量!',mtinformation,[mbok],0);
 self.SGrid1.SetFocus;
 break;
 end;
 end;
end;

procedure TForm_input.FormShow(Sender: TObject);
var i:byte;
begin
for i:=0 to 6 do
  v_colwidth[i]:=sgrid1.ColWidths[i];
end;

procedure TForm_input.FormResize(Sender: TObject);
var i: byte;
begin
for i:=0 to 3 do
v_colwidth[i]:=sgrid1.ColWidths[i]+ round((sgrid1.Width-778)*v_colwidth[i]/50);
end;

procedure TForm_input.BitBtn3Click(Sender: TObject);
 var
   i:integer;
begin
  for i:=1 to self.SGrid1.RowCount-1  do
  begin
    if trim(SGrid1.Cells[5,i])='' then
      SGrid1.Cells[5,i]:=SGrid1.Cells[3,i];
  end;
end;

end.
