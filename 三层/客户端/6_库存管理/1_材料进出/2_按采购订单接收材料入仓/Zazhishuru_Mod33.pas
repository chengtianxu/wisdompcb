unit Zazhishuru_Mod33;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBaseEditFrm,ucommfunc,uBaseSinglePickListFrm,uLookupDM,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.ComCtrls, Datasnap.DBClient,DateUtils;

type
  TfrmZazhishuru_Mod33 = class(TfrmBaseEdit)
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
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    ComboBox2: TComboBox;
    BitBtn3: TBitBtn;
    ComboBox1: TComboBox;
    ComboBox3: TComboBox;
    procedure btnCloseClick(Sender: TObject);
    procedure Edit6KeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn3Click(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure Edit7KeyPress(Sender: TObject; var Key: Char);
    procedure Edit8KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    whouse:Integer;//工厂指针
    procedure getdata(Rkey:string);
    procedure init;
  end;

var
  frmZazhishuru_Mod33: TfrmZazhishuru_Mod33;

implementation

{$R *.dfm}

procedure TfrmZazhishuru_Mod33.BitBtn3Click(Sender: TObject);
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

procedure TfrmZazhishuru_Mod33.btnCloseClick(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmZazhishuru_Mod33.btnSaveClick(Sender: TObject);
begin
  inherited;
  if (Trim(Edit1.Text)='') then
  begin
    ShowMessage('物料名称不能为空');
    Exit;
  end;
  if (Trim(Edit2.Text)='') then
  begin
    ShowMessage('物料规格不能为空');
    Exit;
  end;
  if (Trim(ComboBox3.Text)='') then
  begin
    ShowMessage('物料类别不能为空');
    Exit;
  end;
  if ( strtofloat(edit6.Text)<=0) then
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
  if (Trim(Edit6.Text)='0') then
  begin
    ShowMessage('请输入入库数量。。');
    Edit6.SetFocus;
    Exit;
  end;
  modalresult:=mrok;
end;

procedure TfrmZazhishuru_Mod33.Edit6KeyPress(Sender: TObject; var Key: Char);
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

procedure TfrmZazhishuru_Mod33.Edit7KeyPress(Sender: TObject; var Key: Char);
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

procedure TfrmZazhishuru_Mod33.Edit8KeyPress(Sender: TObject; var Key: Char);
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

procedure TfrmZazhishuru_Mod33.getdata(Rkey: string);
begin
//
end;

procedure TfrmZazhishuru_Mod33.init;
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
    ComboBox1.ItemIndex:=ComboBox1.Items.IndexOf(Lcds.FieldByName('LOCATION').AsString);

    lSQL:='select rkey,DESCRIPTION from data0075 order by rkey';
    gSvrIntf.IntfGetDataBySql(lSQL,Lcds);
    ComboBox3.Items.Clear;
    if not Lcds.IsEmpty then
    begin
      while not Lcds.Eof do
      begin
        combobox3.Items.AddObject(Trim(Lcds.FieldByName('DESCRIPTION').AsString),Pointer(Lcds.FieldByName('Rkey').AsInteger));
        Lcds.Next;
      end;
    end;
    Lcds.RecNo:=1;
    ComboBox3.ItemIndex:=ComboBox3.Items.IndexOf(Trim(Lcds.FieldByName('DESCRIPTION').AsString));
    dtpReqDate.Date:=gFunc.GetSvrDateTime;
    Edit6.Text:='0';
    Edit7.Text:='0';
    Edit8.Text:='0';
  finally
    LCds.Free;
  end;
end;

end.
