unit pasModify;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGridEh, Menus;

type
  TfrmModify = class(TForm)
    pnl1: TPanel;
    pnl2: TPanel;
    pnl3: TPanel;
    btnSave: TBitBtn;
    btnCancel: TBitBtn;
    lbl1: TLabel;
    edtDept: TEdit;
    btnSearch: TBitBtn;
    lbl2: TLabel;
    edtName: TEdit;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    edtDev: TEdit;
    edtReq: TEdit;
    edtHas: TEdit;
    sgDetail: TStringGrid;
    cbb1: TComboBox;
    pm1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure sgDetailSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure cbb1Exit(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure edtDevKeyPress(Sender: TObject; var Key: Char);
    procedure btnSaveClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure N2Click(Sender: TObject);
  private
    { Private declarations }
  public
    status:Integer;
    { Public declarations }
  end;

var
  frmModify: TfrmModify;

implementation

uses Pick_Item_Single,ConstVar, Demo;

{$R *.dfm}

procedure TfrmModify.FormCreate(Sender: TObject);
begin
  sgDetail.Cells[0,0]:='类型';
  sgDetail.Cells[1,0]:='项目名称';
  sgDetail.ColWidths[2]:= -1;
  cbb1.Visible:= False;
end;

procedure TfrmModify.sgDetailSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  if ACol = 0 then
  begin
    cbb1.Left := sgDetail.Left;
    if (ARow<sgDetail.TopRow)  then
      cbb1.Top := sgDetail.Top+(ARow - sgDetail.TopRow+2)* sgDetail.DefaultRowHeight + (ARow - sgDetail.TopRow+5)
    else if (((ARow + 3 - sgDetail.TopRow ) * sgDetail.DefaultRowHeight) > sgDetail.Height) then
      cbb1.Top := sgDetail.Top+(ARow - sgDetail.TopRow)* sgDetail.DefaultRowHeight + (ARow - sgDetail.TopRow+4)
    else
     cbb1.Top := sgDetail.Top+(ARow - sgDetail.TopRow+1)* sgDetail.DefaultRowHeight + (ARow - sgDetail.TopRow+4);
    cbb1.Visible:= True;
    cbb1.SetFocus;
  end
  else
    cbb1.Visible:= False;
  if ACol = 1 then
   sgDetail.Options:= sgDetail.Options + [goEditing];
end;

procedure TfrmModify.cbb1Exit(Sender: TObject);
begin
  sgDetail.Cells[0,sgDetail.Row]:= cbb1.Text;
  sgDetail.Cells[2,sgDetail.Row]:= IntToStr(cbb1.ItemIndex);
//  if  Trim(sgDetail.Cells[0,sgDetail.Row]) <> '' then
//    sgDetail.RowCount := sgDetail.RowCount + 1;
  cbb1.Visible:= False;
end;

procedure TfrmModify.btnSearchClick(Sender: TObject);
var
  InputVar:PDlgInput;
begin
  frmPick_Item_Single:=TfrmPick_Item_Single.Create(nil);
  try
    InputVar.Fields := 'departmentcode/部门编号/180,departmentname/部门名称/250';
    InputVar.Sqlstr := 'select rkey,departmentcode,departmentname from datadepartment where invalid=0 ORDER by departmentcode';
    Inputvar.KeyField:='';

    InputVar.AdoConn := dm.con1 ;
    frmPick_Item_Single.InitForm_New(InputVar);
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      edtDept.Text:= frmPick_Item_Single.adsPick.fieldbyname('departmentcode').AsString;
      edtDept.Tag:=frmPick_Item_Single.adsPick.fieldbyname('rKey').AsInteger;
    end;
  finally
    frmPick_Item_Single.Free;
  end;
end;

procedure TfrmModify.N1Click(Sender: TObject);
var
  i:Integer;
begin
  if (sgDetail.Row<>sgDetail.RowCount) and (sgDetail.RowCount>2) then
  begin
    for i:=sgDetail.Row to sgDetail.RowCount-1 do
    begin
      sgDetail.Rows[i]:=sgDetail.Rows[i+1];
    end;
    sgDetail.RowCount:=sgDetail.RowCount-1;
  end;
end;

procedure TfrmModify.edtDevKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key in ['0'..'9',#8,#46]) then
  begin
    if (Key = #46) and (Pos('.',Trim(TEdit(Sender).Text))<>0) then
    Abort;
  end
  else Abort;
end;

procedure TfrmModify.btnSaveClick(Sender: TObject);
var
  rkey,i:Integer;
begin
  if Trim(edtDept.Text) = '' then
  begin
    ShowMessage('请选择部门');
    exit;
  end;
  if Trim(edtName.Text) = '' then
  begin
    ShowMessage('请输入关键岗位名称');
    exit;
  end;
  if (Trim(sgDetail.Cells[0,1]) <> '') and (Trim(sgDetail.Cells[1,1]) <> '') then
  begin
    for i:=1 to sgDetail.RowCount-1 do
    begin
      if (Trim(sgDetail.Cells[0,i]) = '') or (Trim(sgDetail.Cells[1,i]) = '') then
      begin
        ShowMessage('类型或项目名称存在空值');
        Exit;
      end;
    end;
  end;

  DM.con1.BeginTrans;
  try
    if status = 1 then
    begin
      with DM.qryTmp do
      begin
        Close;
        SQL.Text:= 'select * from hr_keyposition where 1=0';
        Open;
        Append;
        FieldByName('deptid').AsInteger:= edtDept.Tag;
        FieldByName('positionname').AsString:= Trim(edtName.Text);
        FieldByName('qty_Dev').AsInteger:= StrToInt(edtDev.Text);
        FieldByName('qty_req').AsInteger:= StrToInt(edtReq.Text);
        FieldByName('qty_has').AsInteger:= StrToInt(edtHas.Text);
        Post;

        rkey:= FieldByName('rkey').AsInteger;
        if (Trim(sgDetail.Cells[0,1]) <> '') and (Trim(sgDetail.Cells[1,1]) <> '') then
        begin
          Close;
          SQL.Text:= 'SELECT * FROM hr_PositionReq where 1=0';
          Open;
          for i:=1 to sgDetail.RowCount-1 do
          begin
            Append;
            FieldByName('keyid').AsInteger:= rkey;
            FieldByName('reqitem').AsString:= sgDetail.Cells[1,i];
            FieldByName('reqtype').AsInteger:= StrToInt(sgDetail.Cells[2,i]);
            Post;
          end;
        end;
      end;
    end
    else
    begin
      with DM.qryTmp do
      begin
        Close;
        SQL.Text:= 'select * from hr_keyposition where rkey = ' + DM.adsMainrkey.AsString;
        Open;
        edit;
        FieldByName('deptid').AsInteger:= edtDept.Tag;
        FieldByName('positionname').AsString:= Trim(edtName.Text);
        FieldByName('qty_Dev').AsInteger:= StrToInt(edtDev.Text);
        FieldByName('qty_req').AsInteger:= StrToInt(edtReq.Text);
        FieldByName('qty_has').AsInteger:= StrToInt(edtHas.Text);
        Post;

        Close;
        SQL.Text:= 'DELETE FROM hr_PositionReq where keyid = '+ dm.adsMainrkey.AsString;
        ExecSQL;
        
        if (Trim(sgDetail.Cells[0,1]) <> '') and (Trim(sgDetail.Cells[1,1]) <> '') then
        begin
          Close;
          SQL.Text:= 'SELECT * FROM hr_PositionReq where 1=0';
          Open;
          for i:=1 to sgDetail.RowCount-1 do
          begin
            Append;
            FieldByName('keyid').AsInteger:= DM.adsMainrkey.AsInteger;
            FieldByName('reqitem').AsString:= sgDetail.Cells[1,i];
            FieldByName('reqtype').AsInteger:= StrToInt(sgDetail.Cells[2,i]);
            Post;
          end;
        end;
      end;
    end;
    DM.con1.CommitTrans;
    ShowMessage('保存成功！');
    ModalResult:= mrOk;
  except
    DM.con1.RollbackTrans;
  end;
end;

procedure TfrmModify.FormShow(Sender: TObject);
begin
  if status = 2 then
  begin
    edtDept.Tag:= DM.adsMain.FieldByName('deptid').AsInteger;
    edtDept.Text:= DM.adsMain.FieldByName('departmentcode').AsString;
    edtName.Text:= DM.adsMain.FieldByName('positionname').AsString;
    edtDev.Text:= DM.adsMain.FieldByName('qty_Dev').AsString;
    edtReq.Text:= DM.adsMain.FieldByName('qty_req').AsString;
    edtHas.Text:= DM.adsMain.FieldByName('qty_has').AsString;

    if not DM.adsDetail.IsEmpty then
    begin
      with DM.adsDetail do
      begin
        First;
        while not Eof do
        begin
          sgDetail.Cells[0,RecNo]:=FieldByName('strtype').AsString;
          sgDetail.Cells[1,RecNo]:=FieldByName('reqitem').AsString;
          sgDetail.Cells[2,RecNo]:=FieldByName('reqtype').AsString;
          sgDetail.RowCount := sgDetail.RowCount + 1;
          Next;
        end;
      end;
      sgDetail.RowCount := sgDetail.RowCount - 1;
    end;
  end;
end;

procedure TfrmModify.N2Click(Sender: TObject);
begin
  sgDetail.RowCount:= sgDetail.RowCount + 1;
end;

end.
