unit wip_invt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGridEh, Menus,
  Math,Excel2000,ClipBrd,ComObj;

type
  TForm_wipinvt = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    DBGridEh1: TDBGridEh;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    Edit1: TEdit;
    Label1: TLabel;
    BitBtn3: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure CopyDbDataToExcel(Args:array of const;title_caption:string);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure Edit1Change(Sender: TObject);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
   OldGridWnd : TWndMethod;
   precolumn:Tcolumneh;
   procedure NewGridWnd (var Message : TMessage);
  public
    { Public declarations }
  end;

var
  Form_wipinvt: TForm_wipinvt;

implementation

uses uDM, enter_wipinvt, Unit_sercode, ExcelImport;

{$R *.dfm}

procedure TForm_wipinvt.NewGridWnd(var Message: TMessage);
var IsNeg : Boolean;
begin
 if Message.Msg = WM_MOUSEWHEEL then
 begin
   IsNeg := Short(Message.WParamHi) < 0;
   if IsNeg then
     DBGrideh1.DataSource.DataSet.MoveBy(1)
   else
     DBGrideh1.DataSource.DataSet.MoveBy(-1)
 end
 else
   OldGridWnd(Message);
end;

procedure TForm_wipinvt.CopyDbDataToExcel(Args:array of const;title_caption:string);
var
 iCount, jCount, v_cloumn: Integer;
 XLApp: Variant;
 Sheet: Variant;
 I: Integer;
begin
 Screen.Cursor := crHourGlass;
 if not VarIsEmpty(XLApp) then
 begin
   XLApp.DisplayAlerts := False;
   XLApp.Quit;
   VarClear(XLApp);
 end;
 try
   XLApp := CreateOleObject('Excel.Application');
 except
   Screen.Cursor := crDefault;
   Exit;
 end;
 XLApp.WorkBooks.Add;
 XLApp.SheetsInNewWorkbook := High(Args) + 1;

 for I := Low(Args) to High(Args) do
 begin
   XLApp.WorkBooks[1].WorkSheets[I+1].Name := title_caption;
   Sheet := XLApp.Workbooks[1].WorkSheets[title_caption];
   if not TDBGrideh(Args[I].VObject).DataSource.DataSet.Active then
    begin
     Screen.Cursor := crDefault;
     Exit;
    end;
   TDBGrideh(Args[I].VObject).DataSource.DataSet.DisableControls;
   TDBGrideh(Args[I].VObject).DataSource.DataSet.first;

   v_cloumn:=0;
   for iCount := 0 to TDBGrideh(Args[I].VObject).Columns.Count - 1 do
    if TDBGrideh(Args[I].VObject).Columns.Items[iCount].Visible=true then
     Sheet.Cells[1, iCount + 1 - v_cloumn] :=
     TDBGrideh(Args[I].VObject).Columns.Items[iCount].Title.Caption
    else
     inc(v_cloumn);

   jCount := 1;
   while not TDBGrideh(Args[I].VObject).DataSource.DataSet.Eof do
   begin
     v_cloumn:=0;
     for iCount := 0 to TDBGrideh(Args[I].VObject).Columns.Count - 1 do
      if TDBGrideh(Args[I].VObject).Columns.Items[iCount].Visible=true then
       Sheet.Cells[jCount + 1, iCount + 1 - v_cloumn] :=
       TDBGrideh(Args[I].VObject).Columns.Items[iCount].Field.AsString
      else
       inc(v_cloumn);
     Inc(jCount);
     TDBGrideh(Args[I].VObject).DataSource.DataSet.Next;
   end;

   XlApp.Visible := True;
   TDBGrideh(Args[I].VObject).DataSource.DataSet.EnableControls;
 end;
 Screen.Cursor := crDefault;
end;

procedure TForm_wipinvt.BitBtn1Click(Sender: TObject);
begin
 close;
end;

procedure TForm_wipinvt.N1Click(Sender: TObject);
begin
 form_entinvt:=tform_entinvt.Create(application);
 form_entinvt.dept_ptr := 0;     //新增 2006-12-1
 form_entinvt.invent_ptr := 0; //新增 2006-12-1
 form_entinvt.whouse_ptr := 0; //新增 2008-10-15 andy
 form_entinvt.ShowModal;
 form_entinvt.Free;
end;

procedure TForm_wipinvt.N2Click(Sender: TObject);
var rkey:integer;
begin
 form_entinvt:=tform_entinvt.Create(application);
 dm.AD462.Edit;
 with form_entinvt do
  begin
   edit6.Text:=dm.AD462warehouse_CODE.Value;
   label9.Caption:=dm.AD462abbr_name.Value;  //新增 2008-10-15 andy
   edit1.Text:=dm.AD462DEPT_CODE.Value;
   label7.Caption:=dm.AD462DEPT_NAME.Value;
   edit2.Text:=dm.AD462INV_PART_NUMBER.Value;
   label6.Caption:=dm.AD462INV_NAME.Value+'-'+dm.AD462INV_DESCRIPTION.Value;
   edit3.Text:=dm.AD462UNIT_NAME.Value;
   edit4.Text:=dm.AD462STD_PRICE.AsString;
   edit5.Text:=dm.AD462QUAN.AsString;

   dept_ptr := dm.AD462DEPT_PTR.Value;     //新增 2006-12-1
   invent_ptr := dm.AD462INVENT_PTR.Value; //新增 2006-12-1
   whouse_ptr := dm.AD462warehouse_PTR.Value; //新增 2008-10-15 andy
  end;
 if form_entinvt.ShowModal=mrok then
 begin
  rkey:=dm.AD462RKEY.Value;
  dm.AD462.Close;
  dm.AD462.Open;
  dm.AD462.Locate('rkey',rkey,[]);
 end
 else dm.AD462.Cancel;
 form_entinvt.Free;
end;

procedure TForm_wipinvt.N3Click(Sender: TObject);
begin
if messagedlg('您确定要删除该条记录吗?',mtconfirmation,[mbyes,mbno],0)=mryes then
begin
 with dm.Qery do
 begin
  close;
  sql.Text:='delete data0462 where rkey='+dm.AD462RKEY.AsString;
  execsql;
 end;
 dm.AD462.Close;
 dm.AD462.Open;
 messagedlg('删除操作成功!',mtinformation,[mbok],0);
end;
end;

procedure TForm_wipinvt.BitBtn2Click(Sender: TObject);
begin
  CopyDbDataToExcel([dbgrideh1],self.Caption);
end;

procedure TForm_wipinvt.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 if dbgrideh1.PopupMenu<>nil then
 begin
  with dm.Qery do
  begin
   close;
   sql.Text:='update data0444'+#13+
   'set MATL_CST_IN_dept_CLOSED=d1.stock_cost'+#13+
   'FROM dbo.Data0444 INNER JOIN'+#13+
   '(SELECT D0443_PTR, SUM(QUAN * STD_PRICE) AS stock_cost'+#13+
   'FROM Data0462'+#13+
   'where data0462.d0443_ptr='+dm.DS444RKEY.AsString+#13+
   'GROUP BY D0443_PTR) d1 ON Data0444.RKEY = d1.D0443_PTR'+#13+
   'where data0444.rkey='+dm.DS444RKEY.AsString;
    execsql;
  end;
 end;
end;

procedure TForm_wipinvt.FormCreate(Sender: TObject);
begin
 OldGridWnd := DBGrideh1.WindowProc;
 DBGrideh1.WindowProc := NewGridWnd;
 precolumn:=dbgrideh1.Columns[0];
end;

procedure TForm_wipinvt.DBGridEh1TitleClick(Column: TColumnEh);
begin
  if column.Title.SortMarker=smupeh then
  begin
    column.Title.SortMarker:=smdowneh;
    dm.ad462.IndexFieldNames:=column.FieldName+' DESC';
  end
  else begin
    column.Title.SortMarker:=smupeh;
    dm.ad462.IndexFieldNames:=column.FieldName;
  end;

  if (column.ReadOnly) and (precolumn.FieldName<>column.FieldName) then
  begin //先把非字符型的column的readonly属性设为false,非字符型不能用edit搜索
    label1.Caption:='搜索：'+column.Title.Caption;
    precolumn.Title.Color:=clbtnface;
    column.Title.Color:=clred;
    precolumn:=column;
    edit1.Text:='';
  end;
  edit1.SetFocus;
end;

procedure TForm_wipinvt.Edit1Change(Sender: TObject);
begin
  if trim(edit1.Text)<>'' then
    dm.ad462.Filter:=precolumn.FieldName+' like ''%'+trim(edit1.text)+'%'''
  else dm.ad462.Filter:='';
end;

procedure TForm_wipinvt.DBGridEh1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (chr(key)='V') and (ssalt in shift) then
    showmessage(dm.AD462.CommandText);
end;

procedure TForm_wipinvt.BitBtn3Click(Sender: TObject);
begin
  Application.CreateForm(TfrmExcelImport, frmExcelImport);
  frmExcelImport.ShowModal;
end;

end.
