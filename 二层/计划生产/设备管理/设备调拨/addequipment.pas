unit addequipment;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Buttons;

type
  TFrm_addequipment = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Edit1: TEdit;
    Memo1: TMemo;
    Edit2: TEdit;
    DateTimePicker1: TDateTimePicker;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    Edit10: TEdit;
    Edit11: TEdit;
    Edit12: TEdit;
    Edit13: TEdit;
    Edit14: TEdit;
    Edit15: TEdit;
    BitBtn3: TBitBtn;
    Label19: TLabel;
    Label20: TLabel;
    BitBtn4: TBitBtn;
    Edit16: TEdit;
    Label21: TLabel;
    ComboBox1: TComboBox;
    Label22: TLabel;
    Edit17: TEdit;
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Enter(Sender: TObject);
    procedure Edit2Exit(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure Edit13Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_addequipment: TFrm_addequipment;

implementation

uses constvar,Pick_Item_Single, dmo;

{$R *.dfm}

procedure TFrm_addequipment.BitBtn3Click(Sender: TObject);
var
 inputvar: PDlgInput;
begin
  frmPick_Item_Single:=Tfrmpick_item_single.Create(application);
  inputvar.Fields:='FASSET_CODE/设备代码/150,FASSET_NAME/设备名称/250';
  inputvar.Sqlstr:='select Data0417.rkey,data0417.FASSET_CODE,data0417.FASSET_NAME,isnull(data0517.ORIGINAL_VALUE,0) as ORIGINAL_VALUE,'+
                   'isnull(data0517.SUMMED_DEPRE,0) as SUMMED_DEPRE,isnull(data0517.NET_VALUE,0) as NET_VALUE,'+
                   'isnull(data0517.EXPECTED_LIFE_MONTHS,0) as EXPECTED_LIFE_MONTHS,isnull(data0517.DEPRED_MONTHS,0) as DEPRED_MONTHS,'+
                   'isnull(data0015.abbr_name,'''') as abbr_name,isnull(data0034.dept_name,'''') as dept_name '+
                   'from data0417 left outer join '+
                   'data0517 on data0417.id_code=data0517.FASSET_CODE left outer join '+
                   'data0015 on data0417.warehouse_ptr=data0015.rkey left outer join '+
                   'data0034 on data0417.DEPT_PTR=data0034.rkey '+
                   'where data0417.active_flag in (2,3,4)';
  inputvar.AdoConn:=DM.ADOConn;
  frmpick_item_single.InitForm_New(inputvar);
  if (frmPick_Item_Single.ShowModal=mrok) and (not frmPick_Item_Single.adsPick.IsEmpty) then
  begin
    Edit2.Text:=frmPick_Item_Single.adsPick.FieldValues['FASSET_CODE'];
    Label19.Caption:=frmPick_Item_Single.adsPick.FieldValues['FASSET_NAME'];
    Label20.Caption:=frmPick_Item_Single.adsPick.FieldValues['rkey'];
    Edit3.Text:=FormatFloat('0.00',frmPick_Item_Single.adsPick.FieldValues['ORIGINAL_VALUE']);
    Edit4.Text:=FormatFloat('0.00',frmPick_Item_Single.adsPick.FieldValues['SUMMED_DEPRE']);
    Edit5.Text:=FormatFloat('0.00',frmPick_Item_Single.adsPick.FieldValues['NET_VALUE']);
    Edit6.Text:=frmPick_Item_Single.adsPick.FieldValues['EXPECTED_LIFE_MONTHS'];
    Edit7.Text:=frmPick_Item_Single.adsPick.FieldValues['DEPRED_MONTHS'];
    Edit8.Text:=frmPick_Item_Single.adsPick.FieldValues['abbr_name'];
    ComboBox1.ItemIndex:=ComboBox1.Items.IndexOf(frmPick_Item_Single.adsPick.FieldValues['abbr_name']);
    Edit9.Text:=frmPick_Item_Single.adsPick.FieldValues['dept_name'];
  end;
end;

procedure TFrm_addequipment.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TFrm_addequipment.BitBtn1Enter(Sender: TObject);
begin
  if Trim(Edit1.Text)='' then
  begin
    ShowMessage('调拨单号不能为空');
    Edit1.SetFocus;
    Exit;
  end;
  if Trim(Edit2.Text)='' then
  begin
    ShowMessage('资产编码不能为空');
    Edit2.SetFocus;
    Exit;
  end;
  if Trim(Edit16.Text)='内部调拨' then
  begin
    if (Trim(Edit13.Text)='') or (Trim(Label21.Caption)='') then
    begin
      ShowMessage('请选择部门代码');
      Edit13.SetFocus;
      Exit;
    end;
    if Trim(Edit17.Text)='' then
    begin
      ShowMessage('调入工厂存放位置不能为空');
      Edit17.SetFocus;
      Exit;
    end;
  end;
  if Trim(Edit16.Text)='外部调拨' then
  begin
    if Trim(Edit12.Text)='' then
    begin
      ShowMessage('调入工厂不能为空');
      Edit12.SetFocus;
      Exit;
    end;
    if Trim(Edit12.Text)=Trim(Edit8.Text) then
    begin
      ShowMessage('调出工厂与调入工厂一致，请作内部调拨');
      Edit12.SetFocus;
      Exit;
    end;
  end;
end;

procedure TFrm_addequipment.Edit2Exit(Sender: TObject);
begin
  if Trim(Edit2.Text)<>'' then
  begin
    with DM.ADOQuery1 do
    begin
      Active:=False;
      SQL.Clear;
      SQL.Add('select * from data0417 where fasset_code='''+trim(Edit2.Text)+'''');
      Active:=True;
      if IsEmpty then
      begin
        ShowMessage('无效的资产编码');
        Edit2.SetFocus;
        Exit;
      end
      else
      begin
        with DM.ADOQuery1 do
        begin
          Active:=False;
          SQL.Clear;
          SQL.Add('select Data0417.rkey,data0417.FASSET_CODE,data0417.FASSET_NAME,isnull(data0517.ORIGINAL_VALUE,0) as ORIGINAL_VALUE,');
          SQL.Add('isnull(data0517.SUMMED_DEPRE,0) as SUMMED_DEPRE,isnull(data0517.NET_VALUE,0) as NET_VALUE,');
          SQL.Add('isnull(data0517.EXPECTED_LIFE_MONTHS,0) as EXPECTED_LIFE_MONTHS,isnull(data0517.DEPRED_MONTHS,0) as DEPRED_MONTHS,');
          SQL.Add('isnull(data0015.abbr_name,'''') as abbr_name,isnull(data0034.dept_name,'''') as dept_name ');
          SQL.Add('from data0417 left outer join ');
          SQL.Add('data0517 on data0417.id_code=data0517.FASSET_CODE left outer join ');
          SQL.Add('data0015 on data0417.warehouse_ptr=data0015.rkey left outer join ');
          SQL.Add('data0034 on data0417.DEPT_PTR=data0034.rkey ');
          SQL.Add('where data0417.FASSET_CODE='''+trim(Edit2.Text)+''' and data0417.active_flag in (2,3,4)');
          Active:=True;
          if IsEmpty then
          begin
            ShowMessage('请输入正确的设备编码！');
            Edit2.SetFocus;
            Exit;
          end
          else
          begin
            Edit2.Text:=FieldValues['FASSET_CODE'];
            Label19.Caption:=FieldValues['FASSET_NAME'];
            Label20.Caption:=FieldValues['rkey'];
            Edit3.Text:=FormatFloat('0.00',FieldValues['ORIGINAL_VALUE']);
            Edit4.Text:=FormatFloat('0.00',FieldValues['SUMMED_DEPRE']);
            Edit5.Text:=FormatFloat('0.00',FieldValues['NET_VALUE']);
            Edit6.Text:=FieldValues['EXPECTED_LIFE_MONTHS'];
            Edit7.Text:=FieldValues['DEPRED_MONTHS'];
            Edit8.Text:=FieldValues['abbr_name'];
            Edit9.Text:=FieldValues['dept_name'];
            ComboBox1.ItemIndex:=ComboBox1.Items.IndexOf(FieldValues['abbr_name']);
          end;
        end;
      end;
    end;
  end;
end;

procedure TFrm_addequipment.BitBtn1Click(Sender: TObject);
begin
  ModalResult:=mrOk;
end;

procedure TFrm_addequipment.BitBtn4Click(Sender: TObject);
var
 inputvar: PDlgInput;
begin
  frmPick_Item_Single:=Tfrmpick_item_single.Create(application);
  inputvar.Fields:='dept_code/部门代码/150,dept_name/部门/250';
  inputvar.Sqlstr:='select rkey,dept_code,dept_name from data0034';
  inputvar.AdoConn:=DM.ADOConn;
  frmpick_item_single.InitForm_New(inputvar);
  if (frmPick_Item_Single.ShowModal=mrok) and (not frmPick_Item_Single.adsPick.IsEmpty) then
  begin
    Edit13.Text:=frmPick_Item_Single.adsPick.FieldValues['dept_name'];
    Label21.Caption:=frmPick_Item_Single.adsPick.FieldValues['rkey'];
  end;
end;

procedure TFrm_addequipment.Edit13Exit(Sender: TObject);
begin
  if Trim(Edit16.Text)='内部调拨' then
  begin
    if Trim(Edit13.Text)<>'' then
    begin
      with DM.ADOQuery1 do
      begin
        Active:=False;
        SQL.Clear;
        SQL.Add('select rkey from data0034 where dept_name='''+trim(Edit13.Text)+'''');
        Active:=True;
        if IsEmpty then
        begin
          ShowMessage('没有此部门');
          Edit13.SetFocus;
          Exit;
        end
        else
        begin
          with DM.ADOQuery1 do
          begin
            Active:=False;
            SQL.Clear;
            SQL.Add('select rkey,dept_name from data0034');
            Active:=True;
            Edit13.Text:=FieldValues['dept_name'];
            Label21.Caption:=FieldValues['rkey'];
          end;
        end;
      end;
    end;
  end;
end;

end.
