unit uChooseWO;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids, DBGridEh, Buttons, DB, Menus;

type
  TfrmChooseWO = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    edtBCBH: TEdit;
    btnFind: TBitBtn;
    DBGridEh1: TDBGridEh;
    btn1: TSpeedButton;
    Panel2: TPanel;
    btnOK: TBitBtn;
    btnCancel: TBitBtn;
    Label2: TLabel;
    edtYH: TEdit;
    btn2: TSpeedButton;
    pnlWO: TPanel;
    pm1: TPopupMenu;
    N1: TMenuItem;
    DBGridEh2: TDBGridEh;
    btnClose: TBitBtn;
    procedure btn1Click(Sender: TObject);
    procedure btnFindClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure DBGridEh2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure pnlWOCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure DBGridEh1TitleBtnClick(Sender: TObject; ACol: Integer;
      Column: TColumnEh);
  private
    vType: Byte;
  public
    procedure Init(Tag: Byte);
  end;

var
  frmChooseWO: TfrmChooseWO;

implementation

uses uDM, Pick_Item_Single, ConstVar, uBrowse;

{$R *.dfm}

procedure TfrmChooseWO.btn1Click(Sender: TObject);
var
  InputVar: PDlgInput;
begin
  frmPick_Item_Single := TfrmPick_Item_Single.Create(application);
  try
    InputVar.Fields := 'MANU_PART_NUMBER/本厂编号/110,MANU_PART_DESC/客户型号/251';
    InputVar.Sqlstr :=
    'SELECT DISTINCT t25.MANU_PART_NUMBER,t25.MANU_PART_DESC'+#13+
    'FROM Data0025 t25 INNER JOIN Data0038 t38 ON t25.RKEY=t38.SOURCE_PTR'+#13+
    'INNER JOIN Data0034 t34 ON t38.DEPT_PTR=t34.RKEY'+#13+
    'INNER JOIN Data0006 t6 ON t25.RKEY=t6.BOM_PTR'+#13+
//    'INNER JOIN Data0056 t56 ON t6.RKEY=t56.WO_PTR'+#13+
    'WHERE t34.TTYPE=1 AND t34.DEPT_NAME LIKE ''%压%'' AND t6.PROD_STATUS IN(2,3,4)'+#13+
    'ORDER BY t25.MANU_PART_NUMBER';
    inputvar.InPut_value:=edtBCBH.Text;
    inputvar.KeyField:='MANU_PART_NUMBER';
    InputVar.AdoConn := DM.adoConn;
    frmPick_Item_Single.InitForm_New(InputVar);
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      edtBCBH.Text := trim(frmPick_Item_Single.adsPick.FieldValues['MANU_PART_NUMBER']);
      btnFind.SetFocus;
    end
    else
      edtBCBH.SetFocus;
  finally
    frmPick_Item_Single.adsPick.Close;
    frmPick_Item_Single.Free;
  end;      
end;

procedure TfrmChooseWO.btnFindClick(Sender: TObject);
begin
  if edtBCBH.Text = '' then
  begin
    ShowMessage('本厂编号不能为空');
    Exit;
  end;
  with DM.aqTmp do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT 1');
    SQL.Add('FROM Data0025 t25 INNER JOIN Data0038 t38 ON t25.RKEY=t38.SOURCE_PTR');
    SQL.Add('INNER JOIN Data0034 t34 ON t38.DEPT_PTR=t34.RKEY');
    SQL.Add('WHERE t34.TTYPE=1 AND t34.DEPT_NAME LIKE ''%压%''');
    SQL.Add('AND t25.MANU_PART_NUMBER='''+edtBCBH.Text+'''');
    Open;
    IF RecordCount=0 then
    begin
      ShowMessage('错误的本厂编号或其工序无压合');
      edtBCBH.Text:= '';
      edtBCBH.SetFocus;
      Exit;
    end;
  end;
  DM.cdsFindWO.Close;
  with DM.aqFindWO do
  begin
    Close;
    Parameters[0].Value:= vType;
    Parameters[1].Value:= edtBCBH.Text;
    Open;
//    Showmessage(sql.Text);
  end;
  DM.cdsFindWO.Open;
end;

procedure TfrmChooseWO.Init(Tag: Byte);
begin
  vType:= Tag;
end;

procedure TfrmChooseWO.btnOKClick(Sender: TObject);
var
  str1,str2: String;
begin
  if edtYH.Text='' then
  begin
    Showmessage('请选择需配额的压合工序');
    edtYH.SetFocus;
    Abort;
  end;
  if not DM.cdsFindWO.Active then
  begin
    Showmessage('请先查询');
    btnFind.SetFocus;
    Abort;
  end;
  if DM.cdsFindWO.State in[dsEdit] then DM.cdsFindWO.Post;
  with DM.cdsFindWO do
  begin
    DisableControls;
    try
      First;
      while not EOF do
      begin
        if FieldByName('IsSelected').AsInteger=1 then
        begin
          if str1='' then
            str1:= FieldByName('MANU_PART_NUMBER').AsString
          else
          begin
            if str1<>FieldByName('MANU_PART_NUMBER').AsString then
            begin
              Showmessage('不允许选择不同本厂编号的作业单');
              Exit;
            end;
          end;
          if str2='' then
            str2:= FieldByName('RKEY').AsString
          else
            str2:= str2+','+FieldByName('RKEY').AsString;
        end;
        Next;
      end;
    finally
      EnableControls;
    end;
  end;
  if ((str1='') or (str2='')) then
  begin
    Showmessage('请选择作业单');
    Exit;
  end;
  with DM.aspBuild do
  begin
    Close;
    Parameters.ParamByName('@Type').Value:=vType;
    Parameters.ParamByName('@MANU_PART_NUMBER').Value:=str1;
    Parameters.ParamByName('@STR').Value:=str2;
    Parameters.ParamByName('@STEP').Value:=edtYH.Tag;
    Prepared:=True;
    Open;
  end;
  self.ModalResult:=mrOK;
end;

procedure TfrmChooseWO.btn2Click(Sender: TObject);
var
  InputVar: PDlgInput;
begin
  if edtBCBH.Text='' then
  begin
    Showmessage('请先输入本厂编号');
    edtBCBH.SetFocus;
    Exit;
  end;

  frmPick_Item_Single := TfrmPick_Item_Single.Create(application);
  try
    InputVar.Fields := 'DEPT_CODE/工序代码/110,DEPT_NAME/工序名称/110,STEP_NUMBER/步骤/50';
    InputVar.Sqlstr :=
    'SELECT t34.RKEY,t34.DEPT_CODE,t34.DEPT_NAME,t38.STEP_NUMBER'+#13+
    'FROM Data0025 t25 INNER JOIN Data0038 t38 ON t25.RKEY=t38.SOURCE_PTR'+#13+
    'INNER JOIN Data0034 t34 ON t38.DEPT_PTR=t34.RKEY'+#13+
    'WHERE t34.TTYPE=1 AND t34.DEPT_NAME LIKE ''%压%'''+#13+
    'AND t25.MANU_PART_NUMBER='''+edtBCBH.Text+'''';
    inputvar.InPut_value:=edtYH.Text;
    inputvar.KeyField:='DEPT_CODE';
    InputVar.AdoConn := DM.adoConn;
    frmPick_Item_Single.InitForm_New(InputVar);
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      edtYH.Text:= trim(frmPick_Item_Single.adsPick.FieldValues['DEPT_CODE']);
      edtYH.Tag := frmPick_Item_Single.adsPick.FieldValues['STEP_NUMBER'];
      btnOK.SetFocus;
    end
    else
      edtYH.SetFocus;
  finally
    frmPick_Item_Single.adsPick.Close;
    frmPick_Item_Single.Free;
  end;
end;

procedure TfrmChooseWO.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 45 then abort;  //Insert
  if ((key = 40) and ((Sender as TDBGridEh).DataSource.DataSet.RecNo =
                      (Sender as TDBGridEh).DataSource.DataSet.RecordCount)) then
    abort;  //↓
  if ((key = 46) and (ssCtrl in shift)) then abort;  //Ctrl+Delete
  if (chr(key) = 'S') and (ssalt in shift) then
    MessageDlg(DM.aqFindWO.SQL.Text, mtInformation, [mbOK], 0);
end;

procedure TfrmChooseWO.FormShow(Sender: TObject);
begin
  dm.aqFindWO.Active:=False;
  dm.cdsFindWO.Active:=False;
end;

procedure TfrmChooseWO.N1Click(Sender: TObject);
begin
  pnlWO.Visible:= True;
  if not dm.aqFindWO.Active then Exit;
  with dm.aqFindWO1 do
  begin
    Close;
    Parameters.ParamByName('RKEY25').Value:= dm.aqFindWO.FieldByName('RKEY25').AsInteger;
    Open;
  end;
  DBGridEh2.SetFocus;  
end;

procedure TfrmChooseWO.btnCloseClick(Sender: TObject);
begin
  pnlWO.Visible:= False;
end;

procedure TfrmChooseWO.DBGridEh2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (chr(key) = 'S') and (ssalt in shift) then
    MessageDlg(DM.aqFindWO1.SQL.Text, mtInformation, [mbOK], 0);
end;

procedure TfrmChooseWO.pnlWOCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
  DBGridEh2.Height:= pnlWO.Height-35;
end;

procedure TfrmChooseWO.DBGridEh1TitleBtnClick(Sender: TObject;
  ACol: Integer; Column: TColumnEh);
begin
  if not (dm.cdsFindWO.Active) then Exit;
  with dm.cdsFindWO do
  begin
    DisableControls;
    try
      First;
      while not Eof do
      begin
        if not (State in[dsEdit]) then Edit;
        if FieldByName('IsSelected').AsInteger=0 then
          FieldByName('IsSelected').AsInteger:= 1
        else
          FieldByName('IsSelected').AsInteger:= 0;
        Next;
      end;
    finally
      EnableControls;
    end;
  end;
end;

end.
