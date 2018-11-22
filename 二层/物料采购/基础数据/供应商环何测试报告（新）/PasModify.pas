unit PasModify;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons,common,DB,DateUtils,
   ComCtrls, Grids, Menus;

type
  TfrmModify = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    btnSave: TBitBtn;
    btnCancel: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    edtCode: TEdit;
    btnSearch: TBitBtn;
    edtProviderName: TEdit;
    Label3: TLabel;
    edtMaterialCode: TEdit;
    Label4: TLabel;
    edtModal: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    edtSGS: TEdit;
    Label7: TLabel;
    cbxRoHS: TComboBox;
    dtpkTest: TDateTimePicker;
    Label8: TLabel;
    Label9: TLabel;
    dtpkEnd: TDateTimePicker;
    cbxType: TComboBox;
    Label10: TLabel;
    Memo1: TMemo;
    Label11: TLabel;
    Label12: TLabel;
    edtTmpTo: TEdit;
    procedure FormShow(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure edtCodeExit(Sender: TObject);
    procedure edtCodeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnSaveClick(Sender: TObject);
    procedure dtpkTestChange(Sender: TObject);
  private
    { Private declarations }
  public
    modifyStatus,rkey805,selRkey:Integer;
    { Public declarations }
  end;

var
  frmModify: TfrmModify;

implementation

uses DAMO,Pick_Item_Single,ConstVar, PasAddFile;

{$R *.dfm}

procedure TfrmModify.FormShow(Sender: TObject);
begin
  Label12.Visible:=False;
  edtTmpTo.Visible:=False;
  with DM.adoTmp do
  begin
    Close;
    SQL.Clear;
    SQL.Text:='select distinct INV_Type from data0805';
    Open;
    if not IsEmpty then
    begin
      First;
      while not Eof do
      begin
        cbxType.Items.Add(FieldByName('INV_Type').Value);
        Next;
      end;
    end;
  end;
  if modifyStatus=1 then
  begin
   frmModify.Caption:='新增';
  end;
  if (modifyStatus=2) or (modifyStatus=3) then
  begin
    with DM.adoTmp do
    begin
      Close;
      SQL.Clear;
      SQL.Text:='select data0023.rkey, code,abbr_name, D023_ptr, INV_Type, Model, TestDate, EffeDate, data0805.Status, TemporBy, TemporTo, D073_ptr, '+
              ' EntrTime, Remarks, INV_Name, RoHsFree, SGS_NO from data0805 join data0023 on data0805.D023_ptr=data0023.rkey where data0805.rkey='+ IntToStr(selRkey);
      Open;
      if not IsEmpty then
      begin
        edtCode.Tag:= FieldByName('rkey').AsInteger;
        edtCode.Text:= FieldByName('code').AsString;
        edtProviderName.Text:= FieldByName('abbr_name').AsString;
        cbxType.Text:= FieldByName('INV_Type').AsString;
        edtSGS.Text:= FieldByName('SGS_NO').AsString;
        edtMaterialCode.Text:= FieldByName('INV_Name').AsString;
        edtModal.Text:= FieldByName('Model').AsString;
        if FieldByName('RoHsFree').AsString='一级(RoHS)' then cbxRoHS.ItemIndex:=0
        else cbxRoHS.ItemIndex:=1;
        dtpkTest.Date:= FieldByName('TestDate').AsDateTime;
        dtpkEnd.Date:= FieldByName('EffeDate').AsDateTime;
        if FieldByName('TemporTo').asstring <>'' then
        begin
          edtTmpTo.text:= FieldByName('TemporTo').asstring;
          edtTmpTo.Visible:=true;
          Label12.Visible:=true;
        end;
        Memo1.Lines.Text:= FieldByName('Remarks').AsString;
      end;
    end;
    edtCode.Enabled:=False;
    btnSearch.Enabled:=False;
    if modifyStatus=3 then
    begin
      Panel2.Enabled:=False;
      btnSave.Enabled:=False;
    end;
  end;
end;

procedure TfrmModify.btnSearchClick(Sender: TObject);
var
  InputVar:PDlgInput;
begin
  frmPick_Item_Single:=TfrmPick_Item_Single.Create(nil);
  try
    InputVar.Fields := 'code/供应商代码/180,abbr_name/供应商名称/250';
    InputVar.Sqlstr := 'select rkey,code,abbr_name from data0023 where status=0';
    Inputvar.KeyField:='';

    InputVar.AdoConn := dm.ADOConnection1 ;
    frmPick_Item_Single.InitForm_New(InputVar);
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      edtCode.Text:= frmPick_Item_Single.adsPick.fieldbyname('code').AsString;
      edtProviderName.Text:= frmPick_Item_Single.adsPick.fieldbyname('abbr_name').AsString;
      edtCode.Tag:=frmPick_Item_Single.adsPick.fieldbyname('rkey').AsInteger;
    end;
  finally
    frmPick_Item_Single.Free;
  end;
end;

procedure TfrmModify.edtCodeExit(Sender: TObject);
begin
  if Trim(edtCode.Text)<>'' then
  begin
    with DM.adoTmp do
    begin
      Close;
      SQL.Clear;
      SQL.Text:='select rkey,code,abbr_name from data0023 where status=0 and code='+ QuotedStr(Trim(edtCode.Text));
      Open;
      if IsEmpty then
      begin
        ShowMessage('供应商代码有误，请重新输入');
        edtCode.SetFocus;
      end
      else
      begin
        edtProviderName.Text:=FieldByName('abbr_name').AsString;
        edtCode.Tag:= FieldByName('rkey').AsInteger;
      end;
    end;
  end;
end;

procedure TfrmModify.edtCodeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Char(Key)=#13 then   edtMaterialCode.SetFocus;
end;

procedure TfrmModify.btnSaveClick(Sender: TObject);
begin
  if Trim(edtCode.Text)='' then
  begin
    ShowMessage('供应商代码不能为空');
    Exit;
  end;
  if Trim(edtMaterialCode.Text)='' then
  begin
    ShowMessage('物料名称不能为空');
    Exit;
  end;
  if Trim(cbxType.Text)='' then
  begin
    ShowMessage('类型不能为空');
    Exit;
  end;
  if Trim(edtSGS.Text)='' then
  begin
    ShowMessage('SGS报告编号不能为空');
    Exit;
  end;
  if Trim(cbxRoHS.Text)='' then
  begin
    ShowMessage('RoHS/无卤不能为空');
    Exit;
  end;
  if Trim(edtModal.Text)='' then
  begin
    ShowMessage('型号不能为空');
    exit;
  end;
  try
    if modifyStatus=1 then
    begin
      with DM.adoTmp do
      begin
        Close;
        SQL.Clear;
        SQL.Text:='select model from data0805 where model='+ QuotedStr(Trim(edtModal.Text))+
                  ' and D023_ptr='+ IntToStr(edtCode.Tag);
        Open;
        if not IsEmpty then
        begin
          ShowMessage( Trim(edtProviderName.Text)+'型号为'+ Trim(edtModal.Text) +'物料已经存在');
          Exit;
        end;
      end;
      with DM.adoTmp do
      begin
        Close;
        SQL.Clear;
        SQL.Text:='insert into data0805(D023_ptr, INV_Type, Model, TestDate, EffeDate, Status, TemporBy, D073_ptr, EntrTime, Remarks, INV_Name, RoHsFree, SGS_NO)'+
                  ' values('+ IntToStr(edtCode.Tag)+ ','+ QuotedStr(cbxType.Text)+','+ QuotedStr(Trim(edtModal.Text))+','+ QuotedStr(FormatDateTime('yyyy-MM-dd',dtpkTest.Date))+','+
                  QuotedStr(FormatDateTime('yyyy-MM-dd',dtpkEnd.Date))+',1,0,'+ rkey73 +','+ QuotedStr(FormatDateTime('yyyy-MM-dd HH:MM:SS',getsystem_date(DM.adoTime,0)))+','+ QuotedStr(Trim(Memo1.Lines.Text))+','+
                  QuotedStr(Trim(edtMaterialCode.Text))+','+ QuotedStr(cbxRoHS.Text)+','+ QuotedStr(Trim(edtSGS.Text))+')';
//        ShowMessage(SQL.Text);
        ExecSQL;
      end;
      with DM.adoTmp do
      begin
        Close;
        SQL.Clear;
        SQL.Text:='select rkey from data0805 where model='+ QuotedStr(Trim(edtModal.Text))+
                  ' and D023_ptr='+ IntToStr(edtCode.Tag);
        Open;
        if not IsEmpty then
        begin
          rkey805:= FieldByName('rkey').AsInteger;
        end;
      end;
    end;
    if modifyStatus=2 then
    begin
      with DM.adoTmp do
      begin
        Close;
        SQL.Clear;
        SQL.Text:='select INV_Type, Model, TestDate, EffeDate,Remarks, INV_Name, '+
                  ' RoHsFree, SGS_NO from data0805 where rkey='+ IntToStr(selRkey);
        Open;
        Edit;
        FieldByName('INV_Type').Value:=Trim(cbxType.Text);
        FieldByName('Model').Value:=Trim(edtModal.Text);
        FieldByName('TestDate').AsDateTime:=dtpkTest.Date;
        FieldByName('EffeDate').AsDateTime:=dtpkEnd.Date;
        FieldByName('Remarks').AsString:=Memo1.Lines.Text;
        FieldByName('INV_Name').AsString:=Trim(edtMaterialCode.Text);
        FieldByName('RoHsFree').Value:=cbxRoHS.Text;
        FieldByName('SGS_NO').Value:=Trim(edtSGS.Text);
        Post;
        UpdateBatch();
      end;
    end;
    ModalResult:=mrYes;
  except
    on E: Exception do
    begin
      messagedlg(E.Message,mterror,[mbcancel],0);
    end;
  end;
end;

procedure TfrmModify.dtpkTestChange(Sender: TObject);
begin
  dtpkEnd.Date:= IncYear(dtpkTest.Date);
end;

end.
