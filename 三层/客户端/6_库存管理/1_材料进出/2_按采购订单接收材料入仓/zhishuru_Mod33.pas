unit zhishuru_Mod33;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBaseEditFrm,ucommfunc,uBaseSinglePickListFrm,uLookupDM,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.ComCtrls,DateUtils, Datasnap.DBClient;

type
  Tfrmzhishuru_Mod33 = class(TfrmBaseEdit)
    Label1: TLabel;
    Label8: TLabel;
    Label10: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    dtpReqDate: TDateTimePicker;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    ComboBox2: TComboBox;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    ComboBox1: TComboBox;
    procedure btnSaveClick(Sender: TObject);
    procedure Edit6KeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure Edit7KeyPress(Sender: TObject; var Key: Char);
    procedure Edit8KeyPress(Sender: TObject; var Key: Char);
    procedure Edit1Change(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    whouse:Integer;//工厂指针
    procedure getdata(Rkey:string);
    procedure init;
  end;

var
  frmzhishuru_Mod33: Tfrmzhishuru_Mod33;

implementation

{$R *.dfm}

{ Tfrmzhishuru_Mod33 }

procedure Tfrmzhishuru_Mod33.BitBtn2Click(Sender: TObject);
var LFrm: TfrmSinglePickList;
begin
  LFrm := TfrmSinglePickList.Create(Self);
  try
    if (Trim(Edit1.Text)<>'') then
      LFrm.InitWithPickID(33,3, ' and INV_PART_NUMBER like ''%'+Trim(Edit1.Text)+'%''')
    else  LFrm.InitWithPickID(33,3);
    if LFrm.ShowModal = mrOk then
    begin
      Edit1.Text:=LFrm.cdsPick.FieldByName('INV_PART_NUMBER').AsString;
      Edit1.Tag:=LFrm.cdsPick.FieldByName('rkey').Value;
      Edit2.Text:=LFrm.cdsPick.FieldByName('INV_NAME').AsString;
      Edit2.Tag:=LFrm.cdsPick.FieldByName('SHELF_LIFE').Value;
      Edit3.Text:=LFrm.cdsPick.FieldByName('INV_DESCRIPTION').AsString;
      Edit5.Text:=LFrm.cdsPick.FieldByName('UNIT_NAME').AsString;
      Edit5.Tag:=LFrm.cdsPick.FieldByName('STOCK_UNIT_PTR').Value;
    end;
  finally
    LFrm.Free;
  end;
end;

procedure Tfrmzhishuru_Mod33.BitBtn3Click(Sender: TObject);
var LFrm: TfrmSinglePickList;
begin
  LFrm := TfrmSinglePickList.Create(Self);
  try
    LFrm.InitWithPickID(33,5);
    if LFrm.ShowModal = mrOk then
    begin
      Edit5.Text:=LFrm.cdsPick.FieldByName('UNIT_NAME').AsString;
      Edit5.Tag:=LFrm.cdsPick.FieldByName('rkey').Value;
    end;
  finally
    LFrm.Free;
  end;
end;

procedure Tfrmzhishuru_Mod33.btnCloseClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure Tfrmzhishuru_Mod33.btnSaveClick(Sender: TObject);
var
  lSQL:string;
  Lcds:TClientDataSet;
begin
  inherited;
  if (Trim(Edit1.Text)='') then
  begin
    ShowMessage('材料不能为空');
    Exit;
  end;
  if (Trim(ComboBox1.Text)='') then
  begin
    ShowMessage('存仓位置不能为空');
    Exit;
  end;
  if (strtofloat(edit6.Text)<=0) then
  begin
    ShowMessage('入仓数量必须大于0');
    Exit;
  end;
  if (Trim(Edit5.Text)='') then
  begin
    ShowMessage('存货单位不能为空');
    Exit;
  end;
  if (Trim(Edit7.Text)='') then
  begin
    ShowMessage('含税价格不能为空');
    Exit;
  end;
  if (Trim(Edit8.Text)='') then
  begin
    ShowMessage('税率不能为空');
    Exit;
  end;
  if dtpReqDate.DateTime>gFunc.GetSvrDateTime then
  begin
    ShowMessage('入仓记录制造日期大于等于当前日期,不符合要求,请修改相关制造日期!');
    Exit;
  end;
  if (Trim(Edit1.Text)<>'') then
  begin
    Lcds:=TClientDataSet.Create(Self);
    try
      lSQL:='select rkey,INV_PART_NUMBER from data0017 where STOP_PURCH=''N'' and INV_PART_NUMBER='''+Trim(Edit1.Text)+'''';
      gSvrIntf.IntfGetDataBySql(lSQL,Lcds);
      if Lcds.IsEmpty then
      begin
        ShowMessage('该材料编码不存在，请重新选择');
        Edit1.SetFocus;
        Exit;
      end;
    finally
      LCds.Free;
    end;
  end;
  if (Trim(Edit6.Text)='0') then
  begin
    ShowMessage('请输入入库数量。。');
    Edit6.SetFocus;
    Exit;
  end;
  modalresult:=mrok;
end;

procedure Tfrmzhishuru_Mod33.Edit1Change(Sender: TObject);
begin
  inherited;
  if (Trim(Edit1.Text)='') then
  begin
    Edit2.Text:='';
    Edit3.Text:='';
    Edit5.Text:='';
  end;
end;

procedure Tfrmzhishuru_Mod33.Edit1Exit(Sender: TObject);
var
  lSQL:string;
  Lcds:TClientDataSet;
begin
  inherited;
  if (Trim(Edit1.Text)<>'') and (ActiveControl.Name <> 'BitBtn2') and (ActiveControl.Name <> 'btnClose') then
  begin
    Lcds:=TClientDataSet.Create(Self);
    try
      lSQL:='select rkey,INV_PART_NUMBER from data0017 where STOP_PURCH=''N'' and INV_PART_NUMBER='''+Trim(Edit1.Text)+'''';
      gSvrIntf.IntfGetDataBySql(lSQL,Lcds);
      if Lcds.IsEmpty then
      begin
        ShowMessage('该材料编码不存在，请重新选择');
        Edit2.Text:='';
        Edit3.Text:='';
        Edit1.SetFocus;
        Exit;
      end;
    finally
      LCds.Free;
    end;
  end;
end;

procedure Tfrmzhishuru_Mod33.Edit1KeyPress(Sender: TObject; var Key: Char);
var
  lSQL:string;
  Lcds:TClientDataSet;
begin
  inherited;
  if (Key=#13) then
  begin
    Lcds:=TClientDataSet.Create(Self);
    try
      if (Trim(Edit1.Text)<>'') then
      begin
        lSQL:='select data0017.rkey,INV_PART_NUMBER,INV_NAME,INV_DESCRIPTION,SHELF_LIFE,STOCK_UNIT_PTR,'
        +'Data0002.UNIT_NAME from data0017 inner join Data0002 on data0017.STOCK_UNIT_PTR=Data0002.RKEY '
        +'where STOP_PURCH=''N'' and data0017.INV_PART_NUMBER='''+Trim(Edit1.Text)+'''';
        gSvrIntf.IntfGetDataBySql(lSQL,Lcds);
        if not Lcds.IsEmpty then
        begin
          Edit1.Text:=Lcds.FieldByName('INV_PART_NUMBER').AsString;
          Edit1.Tag:=Lcds.FieldByName('rkey').Value;
          Edit2.Text:=Lcds.FieldByName('INV_NAME').AsString;
          Edit2.Tag:=Lcds.FieldByName('SHELF_LIFE').Value;
          Edit3.Text:=Lcds.FieldByName('INV_DESCRIPTION').AsString;
          Edit5.Text:=Lcds.FieldByName('UNIT_NAME').AsString;
          Edit5.Tag:=Lcds.FieldByName('STOCK_UNIT_PTR').Value;
          Edit6.SetFocus;
        end;
      end;
    finally
      LCds.Free;
    end;
  end;
end;

procedure Tfrmzhishuru_Mod33.Edit6KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if not CharInSet(key ,['0'..'9','.',#8,#13]) then  //判断是否输入数字和小数点
    abort
  else
  if key = chr(46) then
  begin      //判断是否重复输入小数点'.'
    if pos('.',Edit6.Text)>0  then abort;
  end;
end;

procedure Tfrmzhishuru_Mod33.Edit7KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if not CharInSet(key ,['0'..'9','.',#8,#13]) then  //判断是否输入数字和小数点
    abort
  else
  if key = chr(46) then
  begin      //判断是否重复输入小数点'.'
    if pos('.',Edit7.Text)>0  then abort;
  end;
end;

procedure Tfrmzhishuru_Mod33.Edit8KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if not CharInSet(key ,['0'..'9','.',#8,#13]) then  //判断是否输入数字和小数点
    abort
  else
  if key = chr(46) then
  begin      //判断是否重复输入小数点'.'
    if pos('.',Edit8.Text)>0  then abort;
  end;
end;

procedure Tfrmzhishuru_Mod33.getdata(Rkey: string);
begin
//
end;

procedure Tfrmzhishuru_Mod33.init;
var
  lSQL:string;
  Lcds:TClientDataSet;
begin
  Lcds:=TClientDataSet.Create(Self);
  try
    lSQL:='select rkey,LOCATION from data0016 where whouse_ptr='+inttostr(whouse)+' and LOCATION_TYPE=0 order by rkey';
    gSvrIntf.IntfGetDataBySql(lSQL,Lcds);
    ComboBox1.Items.Clear;
    if not Lcds.IsEmpty then
    begin
      while not Lcds.Eof do
      begin
//或用        ComboBox1.Items.AddObject(Lcds.FieldByName('LOCATION').AsString,TObject(NewStr(Lcds.FieldByName('Rkey').AsString)));
        combobox1.Items.AddObject(Lcds.FieldByName('LOCATION').AsString,Pointer(Lcds.FieldByName('Rkey').AsInteger));
        Lcds.Next;
      end;
    end;
    Lcds.RecNo:=1;
    ComboBox1.ItemIndex:=-1;
//    ComboBox1.ItemIndex:=ComboBox1.Items.IndexOf(Lcds.FieldByName('LOCATION').AsString);
    dtpReqDate.Date:=gFunc.GetSvrDateTime;
    Edit6.Text:='0';
    Edit7.Text:='0';
    Edit8.Text:='0';
  finally
    LCds.Free;
  end;
end;

end.
