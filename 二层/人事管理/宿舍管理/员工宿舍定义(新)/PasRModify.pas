unit PasRModify;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,MyClass,Buttons, ExtCtrls, DBCtrls;

type
  TfrmRModify = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    btnSave: TBitBtn;
    btnCancel: TBitBtn;
    Label1: TLabel;
    edtDormitory: TEdit;
    chkeff: TCheckBox;
    Label2: TLabel;
    edtRoomNo: TEdit;
    Label3: TLabel;
    edtRoomName: TEdit;
    Label4: TLabel;
    edtFloor: TEdit;
    Label5: TLabel;
    edtBedCount: TEdit;
    Label6: TLabel;
    cbbType: TComboBox;
    Label7: TLabel;
    cbbGrade: TComboBox;
    Label8: TLabel;
    edtMonitor: TEdit;
    btnMonitor: TBitBtn;
    Label9: TLabel;
    Memo1: TMemo;
    Label10: TLabel;
    Memo2: TMemo;
    btnDormitory: TBitBtn;
    Label11: TLabel;
    edtRent: TEdit;
    Label12: TLabel;
    edtE: TEdit;
    Label13: TLabel;
    edtW: TEdit;
    chk1: TCheckBox;
    procedure btnDormitoryClick(Sender: TObject);
    procedure btnMonitorClick(Sender: TObject);
    procedure edtMonitorExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtBedCountKeyPress(Sender: TObject; var Key: Char);
    procedure btnSaveClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure edtRentExit(Sender: TObject);
    procedure edtRentKeyPress(Sender: TObject; var Key: Char);
  private
    tmpsql:string;
    ItemList:TStringList;
    RC:TMyDataClass;
    procedure LoadCBBItem(cbbname:TComboBox);
    { Private declarations }
  public
    status,rkey:Integer;
    { Public declarations }
  end;

var
  frmRModify: TfrmRModify;

implementation

uses DAMO,Pick_Item_Single,ConstVar;

{$R *.dfm}

procedure TfrmRModify.btnDormitoryClick(Sender: TObject);
var
  InputVar:PDlgInput;
begin
  frmPick_Item_Single:=TfrmPick_Item_Single.Create(nil);
  try
    InputVar.Fields := 'D_code/宿舍楼编号/180,D_name/宿舍楼名称/250';
    InputVar.Sqlstr := 'select rkey,D_code,D_name from dormitorymsg';
    Inputvar.KeyField:='';

    InputVar.AdoConn := dm.ADOConnection1 ;
    frmPick_Item_Single.InitForm_New(InputVar);
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      edtDormitory.Text:= frmPick_Item_Single.adsPick.fieldbyname('D_name').AsString;
      edtDormitory.Tag:=frmPick_Item_Single.adsPick.fieldbyname('rKey').AsInteger;
    end;
  finally
    frmPick_Item_Single.Free;
  end;
end;

procedure TfrmRModify.btnMonitorClick(Sender: TObject);
var
  InputVar:PDlgInput;
begin
  frmPick_Item_Single:=TfrmPick_Item_Single.Create(nil);
  try
    InputVar.Fields := 'employeecode/工号/180,chinesename/姓名/250';
    InputVar.Sqlstr := 'select rkey,employeecode,chinesename from employeemsg_extra ORDER by employeecode';
    Inputvar.KeyField:='';

    InputVar.AdoConn := dm.ADOConnection1 ;
    frmPick_Item_Single.InitForm_New(InputVar);
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      edtMonitor.Text:= frmPick_Item_Single.adsPick.fieldbyname('employeecode').AsString;
      edtMonitor.Tag:=frmPick_Item_Single.adsPick.fieldbyname('rKey').AsInteger;
    end;
  finally
    frmPick_Item_Single.Free;
  end;
end;

procedure TfrmRModify.edtMonitorExit(Sender: TObject);
begin
  tmpsql:='select rkey from employeemsg_extra where employeecode='+ QuotedStr(Trim(edtMonitor.Text));
  RC.OpenQuery(DM.adotmp,tmpsql);
  if DM.adotmp.IsEmpty then
  begin
    ShowMessage(Trim(edtMonitor.Text)+'不存在');
    edtMonitor.SetFocus;
    Exit;
  end;
end;

procedure TfrmRModify.FormCreate(Sender: TObject);
begin
  RC:=TMyDataClass.Create(DM.ADOConnection1);
end;

procedure TfrmRModify.edtBedCountKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9',#8]) then Abort;
end;

procedure TfrmRModify.btnSaveClick(Sender: TObject);
var
  i:Integer;
  imonitor,count:string;
begin
  if Trim(edtRent.Text)='' then edtRent.Text:='0';
  if Trim(edtE.Text)='' then edtE.Text:='0';
  if Trim(edtW.Text)='' then edtW.Text:='0';
  for i:=0 to Panel2.ControlCount-1 do
  begin
    if (Panel2.Controls[i] is TEdit)  then
    begin
      if ((Panel2.Controls[i] as TEdit).Name<>'edtMonitor') and ((Panel2.Controls[i] as TEdit).Text='') then
      begin
        ShowMessage((Panel2.Controls[i] as TEdit).Hint+' 不能为空');
        (Panel2.Controls[i] as TEdit).SetFocus;
        Exit;
      end;
    end;
    if (Panel2.Controls[i] is TComboBox) and ((Panel2.Controls[i] as TComboBox).Text='') then
    begin
      ShowMessage((Panel2.Controls[i] as TComboBox).Hint+' 不能为空');
      (Panel2.Controls[i] as TComboBox).SetFocus;
      Exit;
    end;
  end;
//  if (cbbGrade.Text='D') and (Trim(edtMonitor.Text)='') then
//  begin
//    ShowMessage('宿舍长不能为空');
//    edtMonitor.SetFocus;
//    Exit;
//  end;
  if Trim(edtMonitor.Text)<>'' then imonitor:=IntToStr(edtMonitor.Tag)
  else imonitor:='NULL';
  if status=1 then
  begin
    tmpsql:='select rkey,R_code,R_name from bedroommsg where R_code='+ QuotedStr(Trim(edtRoomNo.Text))+ ' or R_name='+
            QuotedStr(Trim(edtRoomName.Text));
    try
      if RC.OpenQuery(DM.adotmp,tmpsql) then
      begin
        if not DM.adotmp.IsEmpty then
        begin
          if Trim(edtRoomNo.Text)=DM.adotmp.FieldByName('R_code').AsString then
          begin
            ShowMessage('房间号已经存在');
            edtRoomNo.SetFocus;
            Exit;
          end
          else
          begin
            ShowMessage('房间名称已经存在');
            edtRoomNo.SetFocus;
            Exit;
          end;
        end;
      end;

      if chkeff.Checked then i:=1
      else i:=0;
      DM.ADOConnection1.BeginTrans;
      tmpsql:='insert into bedroommsg(dormitoryid, R_code, bedcount, floor, type, '+
              ' grade, monitor, equipment_remark, remark, effective, R_name, basic_rent, '+
              ' electricity_standard, water_standard,IsCouple '+
              ' ) values('+ IntToStr(edtDormitory.Tag) +
              ','+ QuotedStr(Trim(edtRoomNo.Text))+','+ Trim(edtBedCount.Text)+','+
              Trim(edtFloor.Text)+','+ IntToStr(cbbType.ItemIndex)+','+
              QuotedStr(Trim(string(cbbGrade.Items.Objects[cbbGrade.ItemIndex])))+','+ imonitor +
              ','+ QuotedStr(Trim(Memo1.Lines.Text))+ ','+ QuotedStr(Trim(Memo2.Lines.Text))+
              ','+ IntToStr(i)+','+ QuotedStr(Trim(edtRoomName.Text))+','+
              Trim(edtRent.Text)+','+ Trim(edtE.Text)+','+ Trim(edtW.Text)+ ',' + QuotedStr(BoolToStr(chk1.Checked,True)) + ')';
      RC.ExecSql(tmpsql);

      tmpsql:='select rkey from bedroommsg where R_code='+ QuotedStr(Trim(edtRoomNo.Text));
      if RC.OpenQuery(DM.adotmp,tmpsql) then
      begin
        rkey:= DM.adotmp.FieldByName('rkey').AsInteger;
      end;

      for i:=StrToInt(edtBedCount.Text) downto 1 do
      begin
        if i<10 then count:='0'+ IntToStr(i)
        else count:=IntToStr(i);
        tmpsql:='insert into bedmsg(bedroomid,B_code,effective) values('+
                IntToStr(rkey)+','+ QuotedStr(Trim(edtRoomNo.Text)+ count)+',1)'+#13+ tmpsql;
      end;
      RC.ExecSql(tmpsql);
      DM.ADOConnection1.CommitTrans;
    except
      on E: Exception do
      begin
        DM.ADOConnection1.RollbackTrans;
        messagedlg(E.Message,mterror,[mbcancel],0);
      end;
    end;
  end;

  if status=2 then
  begin
    if chkeff.Checked then i:=1
    else i:=0;
    tmpsql:='update bedroommsg set  r_code='''+trim(edtRoomNo.Text)+''',r_name='''+trim(edtRoomName.Text)+''',  bedcount='+ Trim(edtBedCount.Text) +',type= '+
        IntToStr(cbbType.ItemIndex)+',grade='+ QuotedStr(Trim(string(cbbGrade.Items.Objects[cbbGrade.ItemIndex])))+
        ' ,monitor= '+ imonitor + ',equipment_remark=' + QuotedStr(Trim(Memo1.Lines.Text))+
        ',remark='+ QuotedStr(Trim(Memo2.Lines.Text))+',effective='+ IntToStr(i)+',basic_rent='+
        Trim(edtRent.Text)+',electricity_standard='+ Trim(edtE.Text)+', water_standard='+
         Trim(edtW.Text)+ ',IsCouple=' + QuotedStr(BoolToStr(chk1.Checked,True)) + #13+
        ' from bedroommsg where rkey='+ DM.adoRoomrkey.AsString;
//    ShowMessage(tmpsql);
    RC.ExecSql(tmpsql);
  end;

  ModalResult:=mrYes;
end;

procedure TfrmRModify.LoadCBBItem(cbbname: TComboBox);
var
  i:Integer;
  str:string;
begin
  try
    ItemList:=TStringList.Create;
    ItemList.Add('A');
    ItemList.Add('B');
    ItemList.Add('C');
    ItemList.Add('D');
    ItemList.Add('E');
    ItemList.Add('F');
    ItemList.Add('G');
    ItemList.Add('H');
    ItemList.Add('I');
    ItemList.Add('J');
    ItemList.Add('K');
    ItemList.Add('L');
    ItemList.Add('M');
    ItemList.Add('N');

    cbbname.Items.AddObject('A级',TObject(ItemList[0]));
    cbbname.Items.AddObject('B级',TObject(ItemList[1]));
    cbbname.Items.AddObject('C级',TObject(ItemList[2]));
    cbbname.Items.AddObject('D级',TObject(ItemList[3]));
    cbbname.Items.AddObject('E级',TObject(ItemList[4]));
    cbbname.Items.AddObject('F级',TObject(ItemList[5]));
    cbbname.Items.AddObject('G级',TObject(ItemList[6]));
    cbbname.Items.AddObject('H级',TObject(ItemList[7]));
    cbbname.Items.AddObject('I级',TObject(ItemList[8]));
    cbbname.Items.AddObject('J级',TObject(ItemList[9]));
    cbbname.Items.AddObject('K级',TObject(ItemList[10]));
    cbbname.Items.AddObject('L级',TObject(ItemList[11]));
    cbbname.Items.AddObject('M级',TObject(ItemList[12]));
    cbbname.Items.AddObject('N级',TObject(ItemList[13]));

//    for i:=0 to ItemList.Count-1 do
//    begin
////      ShowMessage(ItemList.Values[ItemList.Names[i]]);
//      cbbname.Items.AddObject(ItemList.Names[i],(ItemList.Values[ItemList.Names[i]]));
//    end;
  finally
//    ItemList.Free;
  end;
end;

procedure TfrmRModify.FormShow(Sender: TObject);
var
  i:Integer;
begin
  frmRModify.Caption:='新增';
  LoadCBBItem(cbbGrade);
  if (status=2) or (status=3) then
  begin
    frmRModify.Caption:='编辑';
    edtDormitory.Text:=DM.adoRoomD_name.AsString;
    edtDormitory.Tag:=DM.adoRoomdormitoryid.AsInteger;
    edtFloor.Text:=DM.adoRoomfloor.AsString;
    edtRoomNo.Text:=DM.adoRoomR_code.AsString;
    edtRoomName.Text:=DM.adoRoomR_name.AsString;
    edtBedCount.Text:=DM.adoRoombedcount.AsString;
    edtMonitor.Text:=DM.adoRoomchinesename.AsString;
    edtMonitor.Tag:=DM.adoRoommonitor.AsInteger;
    if DM.adoRoombasic_rent.AsString='' then edtRent.Text:='0'
    else edtRent.Text:=DM.adoRoombasic_rent.AsString;
    if DM.adoRoomelectricity_standard.AsString='' then edtE.Text:='0'
    else edtE.Text:=DM.adoRoomelectricity_standard.AsString;
    if DM.adoRoomwater_standard.AsString='' then edtW.Text:='0'
    else edtW.Text:=DM.adoRoomwater_standard.AsString;
    if DM.adoRoomeffective.AsInteger=1 then chkeff.Checked:=True
    else chkeff.Checked:=False;
    Memo1.Lines.Text:=DM.adoRoomequipment_remark.AsString;
    Memo2.Lines.Text:=DM.adoRoomremark.AsString;
    cbbType.ItemIndex:=DM.adoRoomtype.AsInteger;

    chk1.Checked := ( DM.adoRoomIsCouple.AsBoolean = True);
//    if DM.adoRoomRoom_feetype.AsString='' then cbbRoom.ItemIndex:=3
//    else cbbRoom.ItemIndex:=DM.adoRoomRoom_feetype.AsInteger;
//    if DM.adoRoomE_feetype.AsString='' then cbbE.ItemIndex:=3
//    else cbbE.ItemIndex:=DM.adoRoomE_feetype.AsInteger;
//    if DM.adoRoomdown_type.AsString='' then cbbDown.ItemIndex:=2
//    else cbbDown.ItemIndex:=DM.adoRoomdown_type.AsInteger;

    for i:=0 to cbbGrade.Items.Count-1 do
    begin
      if Trim(string(cbbGrade.Items.Objects[i])) = Trim(DM.adoRoomgrade.AsString) then
      begin
        cbbGrade.ItemIndex:=i;
        Break;
      end;
    end;
    cbbGrade.Style:=csDropDownList;
    edtDormitory.ReadOnly:=True;

    edtFloor.ReadOnly:=false;
    edtRoomNo.ReadOnly:=false;
    edtRoomName.ReadOnly:=false;

    btnDormitory.Enabled:=False;
    if status=3 then
    begin
      frmRModify.Caption:='检查';
      Panel2.Enabled:=False;
      btnSave.Enabled:=False;

    edtFloor.ReadOnly:=true;
    edtRoomNo.ReadOnly:=true;
    edtRoomName.ReadOnly:=true;
    end;
  end;
end;

procedure TfrmRModify.FormDestroy(Sender: TObject);
begin
  RC.Free;
  ItemList.Free;
end;

procedure TfrmRModify.edtRentExit(Sender: TObject);
var
  tmp:Double;
begin
  if Trim((Sender as TEdit).Text)='' then Exit;
  if not TryStrToFloat(Trim((Sender as TEdit).Text),tmp) then
  begin
    ShowMessage('输入格式不对，请重新输入');
    (Sender as TEdit).SetFocus;
    Exit;
  end
  else
    (Sender as TEdit).Text:=FloatToStr(tmp);
end;

procedure TfrmRModify.edtRentKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9',#8,#46]) then Abort;
end;

end.
