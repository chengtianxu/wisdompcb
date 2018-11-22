unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGridEh, Menus,DateUtils;

type
  TFrm_Main = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    DBGrd1: TDBGridEh;
    Popup1: TPopupMenu;
    Popup2: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    Label1: TLabel;
    Edit1: TEdit;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure item_Click(Sender: TObject);
    procedure DBGrd1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure DBGrd1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure N8Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure DBGrd1TitleClick(Column: TColumnEh);
    procedure Edit1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure DBGrd1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    sortDate:TDateTime;
    longDate:TDateTime;
    preColumn:TColumnEh;
    sql_Text:string;
    rkey:string;
  public
    { Public declarations }
  end;

var
  Frm_Main: TFrm_Main;

implementation

uses dmo, addequipment, common, Search;

{$R *.dfm}

procedure TFrm_Main.BitBtn1Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TFrm_Main.BitBtn2Click(Sender: TObject);
begin
  DM.ADO573.Close;
  DM.ADO573.Open;
end;

procedure TFrm_Main.BitBtn4Click(Sender: TObject);
var
  i:Byte;
begin
  Frm_Search:=TFrm_Search.Create(Application);
  Frm_Search.dtpk1.Date:=sortDate-dayof(sortDate)+1;
  Frm_Search.dtpk2.Date:=sortDate;
  if Frm_Search.ShowModal=mrok then
  begin
    with DM.ADO573 do
    begin
      Close;
      for i := 1 to Frm_Search.Sgrd.RowCount-2 do
        CommandText:=CommandText+Frm_Search.Sgrd.Cells[2,i];
      Open;
    end;
  end;
end;

procedure TFrm_Main.BitBtn5Click(Sender: TObject);
begin
  Popup1.Popup(Mouse.CursorPos.X,Mouse.CursorPos.Y);
end;

procedure TFrm_Main.FormShow(Sender: TObject);
var
  i:Byte;
  item:TMenuItem;
begin
  for i := 0 to DBGrd1.FieldCount-1 do
  begin
    item:=TMenuItem.Create(Self);
    item.Caption:=DBGrd1.Columns[i].Title.Caption;
    item.Checked:=DBGrd1.Columns[i].Visible;
    item.OnClick:=item_Click;
    Popup1.Items.Add(item);
  end;
  with DM.ADOQuery1 do
  begin
    Active:=False;
    SQL.Clear;
    SQL.Add('select getdate() as v_date');
    Active:=True;
    longDate:=FieldValues['v_date'];
    sortDate:=StrToDateTime(FormatDateTime('YYYY-MM-DD',FieldValues['v_date']));
  end;
  preColumn:=DBGrd1.Columns[0];
  Label1.Caption:=preColumn.Title.Caption;
  sql_Text:=DM.ADO573.CommandText;
  with DM.ADOQuery1 do
  begin
    Active:=False;
    SQL.Clear;
    SQL.Add('select employee_ptr from data0073 where rkey='+rkey73);
    Active:=True;
    rkey:=FieldValues['employee_ptr'];
  end;
end;

procedure TFrm_Main.item_Click(Sender: TObject);
var
  i:Byte;
begin
  (Sender as TMenuItem).Checked:=not (Sender as TMenuItem).Checked;
  if (Sender as TMenuItem).Checked then
  begin
    for i := 0 to DBGrd1.FieldCount-1 do
    begin
      if (Sender as TMenuItem).Caption=DBGrd1.Columns[i].Title.Caption then
      begin
        DBGrd1.Columns[i].Visible:=True;
        Break;
      end;
    end;
  end
  else
  begin
    for i := 0 to DBGrd1.FieldCount-1 do
    begin
      if (Sender as TMenuItem).Caption=DBGrd1.Columns[i].Title.Caption then
      begin
        DBGrd1.Columns[i].Visible:=False;
        Break;
      end;
    end;
  end;
end;

procedure TFrm_Main.DBGrd1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
  DBGrd1.canvas.Font.Color:=clBlack;
  if DBGrd1.DataSource.DataSet.RecNo   mod   2=0   then
    DBGrd1.canvas.Brush.color:=clInfoBk       //$00EEFFFF
  else
    DBGrd1.canvas.brush.color:=clWhite;
  if (gdSelected   in   State) then
  begin
    DBGrd1.Canvas.Brush.Color:=clAqua;
  end;
  DBGrd1.DefaultDrawColumnCell(rect,datacol,column,state);
end;

procedure TFrm_Main.N2Click(Sender: TObject);
begin
  if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
  begin
    showmessage('对不起您只有该程序的只读权限');
    exit;
  end;
  Frm_addequipment:=TFrm_addequipment.Create(Application);
  with Frm_addequipment do
  begin
    Label17.Visible:=False;
    Edit15.Visible:=False;
    Label18.Top:=Label18.Top-30;
    Memo1.Top:=Memo1.Top-30;
    DateTimePicker1.Date:=sortDate;
    Edit16.Text:='内部调拨';
    Edit12.Visible:=False;
    ComboBox1.Visible:=True;
    ComboBox1.Items.Clear;
    with DM.ADOQuery1 do
    begin
      Active:=False;
      SQL.Clear;
      SQL.Add('select abbr_name from data0015');
      Active:=True;
      DisableControls;
      First;
      while not Eof do
      begin
        ComboBox1.Items.Add(FieldValues['abbr_name']);
        Next;
      end;
      EnableControls;
    end;
    ComboBox1.ItemIndex:=0;
  end;
  if Frm_addequipment.ShowModal=mrok then
  begin
    with DM.ADOQuery1 do
    begin
      Active:=False;
      SQL.Clear;
      SQL.Add('select allocate_number from data0573 where allocate_number='''+Trim(Edit1.Text)+'''');
      Active:=True;
      if not IsEmpty then
      begin
        ShowMessage('调拨单号重复，请重新输入调拨单号');
        Edit1.Text:='';
        Edit1.SetFocus;
      end;
    end;
    DM.ADOConn.BeginTrans;
    try
      with DM.ADOQuery1 do
      begin
        Active:=False;
        SQL.Clear;
        SQL.Add('insert into data0573 (allocate_number,fasset_ptr,allocate_date,alloccate_type,user_ptr,original_value,summed_depre,');
        SQL.Add('net_value,expected_life_months,depred_months,alloc_outfac,alloc_outdeptname,outdeptname_empl,out_equipment,alloc_infac,');
        SQL.Add('alloc_indeptname,indeptname_empl,in_equipment,remark,alloc_indept_ptr,LOCATION) values (:allocate_number,:fasset_ptr,:allocate_date,');
        SQL.Add(':alloccate_type,:user_ptr,:original_value,:summed_depre,:net_value,:expected_life_months,:depred_months,:alloc_outfac,');
        SQL.Add(':alloc_outdeptname,:outdeptname_empl,:out_equipment,:alloc_infac,:alloc_indeptname,:indeptname_empl,:in_equipment,');
        SQL.Add(':remark,:alloc_indept_ptr,:LOCATION)');
        with Frm_addequipment do
        begin
          Parameters[0].Value:=Trim(Edit1.Text);
          Parameters[1].Value:=Trim(Label20.Caption);
          Parameters[2].Value:=DateTimePicker1.Date;
          Parameters[3].Value:=Trim(Edit16.Text);
          Parameters[4].Value:=rkey;
          Parameters[5].Value:=Trim(Edit3.Text);
          Parameters[6].Value:=Trim(Edit4.Text);
          Parameters[7].Value:=Trim(Edit5.Text);
          Parameters[8].Value:=Trim(Edit6.Text);
          Parameters[9].Value:=Trim(Edit7.Text);
          Parameters[10].Value:=Trim(Edit8.Text);
          Parameters[11].Value:=Trim(Edit9.Text);
          Parameters[12].Value:=Trim(Edit10.Text);
          Parameters[13].Value:=Trim(Edit11.Text);
          Parameters[14].Value:=Trim(ComboBox1.Text);
          Parameters[15].Value:=Trim(Edit13.Text);
          Parameters[16].Value:=Trim(Edit14.Text);
          Parameters[17].Value:=Trim(Edit15.Text);
          Parameters[18].Value:=Trim(Memo1.Lines.Text);
          Parameters[19].Value:=Trim(Label21.Caption);
          Parameters[20].Value:=Trim(Edit17.Text);
        end;
        ExecSQL;
        DM.ADOConn.CommitTrans;
        DM.ADO573.Close;
        DM.ADO573.CommandText:=sql_Text+' ORDER BY DATA0573.RKEY';
        DM.ADO573.Open;
        DM.ADO573.RecNo:=DM.ADO573.RecordCount;
      end;
    except
      on e: exception do
      begin
        DM.ADOConn.RollbackTrans;
        DM.ADOQuery1.cancel;
        messagedlg(e.message,mterror,[mbcancel],0);
      end;
    end;
  end;
end;

procedure TFrm_Main.N3Click(Sender: TObject);
begin
  if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
  begin
    showmessage('对不起您只有该程序的只读权限');
    exit;
  end;
  Frm_addequipment:=TFrm_addequipment.Create(Application);
  with Frm_addequipment do
  begin
    DateTimePicker1.Date:=sortDate;
    Edit16.Text:='外部调拨';
    BitBtn4.Visible:=False;
    ComboBox1.Visible:=False;
    Edit12.Visible:=True;
    Label22.Visible:=False;
    Edit17.Visible:=False;
    Label16.Top:=Label16.Top-30;
    Edit14.Top:=Edit14.Top-30;
    Label17.Top:=Label17.Top-30;
    Edit15.Top:=Edit15.Top-30;
    Label18.Top:=Label18.Top-30;
    Memo1.Top:=Memo1.Top-30;
  end;
  if Frm_addequipment.ShowModal=mrok then
  begin
    with DM.ADOQuery1 do
    begin
      Active:=False;
      SQL.Clear;
      SQL.Add('select allocate_number from data0573 where allocate_number='''+Trim(Edit1.Text)+'''');
      Active:=True;
      if not IsEmpty then
      begin
        ShowMessage('调拨单号重复，请重新输入调拨单号');
        Edit1.Text:='';
        Edit1.SetFocus;
      end;
    end;
    DM.ADOConn.BeginTrans;
    try
      with DM.ADOQuery1 do
      begin
        Active:=False;
        SQL.Clear;
        SQL.Add('insert into data0573 (allocate_number,fasset_ptr,allocate_date,alloccate_type,user_ptr,original_value,summed_depre,');
        SQL.Add('net_value,expected_life_months,depred_months,alloc_outfac,alloc_outdeptname,outdeptname_empl,out_equipment,alloc_infac,');
        SQL.Add('alloc_indeptname,indeptname_empl,in_equipment,remark) values (:allocate_number,:fasset_ptr,:allocate_date,');
        SQL.Add(':alloccate_type,:user_ptr,:original_value,:summed_depre,:net_value,:expected_life_months,:depred_months,:alloc_outfac,');
        SQL.Add(':alloc_outdeptname,:outdeptname_empl,:out_equipment,:alloc_infac,:alloc_indeptname,:indeptname_empl,:in_equipment,');
        SQL.Add(':remark)');
        with Frm_addequipment do
        begin
          Parameters[0].Value:=Trim(Edit1.Text);
          Parameters[1].Value:=Trim(Label20.Caption);
          Parameters[2].Value:=DateTimePicker1.Date;
          Parameters[3].Value:=Trim(Edit16.Text);
          Parameters[4].Value:=rkey;
          Parameters[5].Value:=Trim(Edit3.Text);
          Parameters[6].Value:=Trim(Edit4.Text);
          Parameters[7].Value:=Trim(Edit5.Text);
          Parameters[8].Value:=Trim(Edit6.Text);
          Parameters[9].Value:=Trim(Edit7.Text);
          Parameters[10].Value:=Trim(Edit8.Text);
          Parameters[11].Value:=Trim(Edit9.Text);
          Parameters[12].Value:=Trim(Edit10.Text);
          Parameters[13].Value:=Trim(Edit11.Text);
          Parameters[14].Value:=Trim(Edit12.Text);
          Parameters[15].Value:=Trim(Edit13.Text);
          Parameters[16].Value:=Trim(Edit14.Text);
          Parameters[17].Value:=Trim(Edit15.Text);
          Parameters[18].Value:=Trim(Memo1.Lines.Text);
        end;
        ExecSQL;
        DM.ADOConn.CommitTrans;
        DM.ADO573.Close;
        DM.ADO573.CommandText:=sql_Text+' ORDER BY DATA0573.RKEY';
        DM.ADO573.Open;
        DM.ADO573.RecNo:=DM.ADO573.RecordCount;
      end;
    except
      on e: exception do
      begin
        DM.ADOConn.RollbackTrans;
        DM.ADOQuery1.cancel;
        messagedlg(e.message,mterror,[mbcancel],0);
      end;
    end;
  end;
end;

procedure TFrm_Main.N4Click(Sender: TObject);
var
  i:Byte;
begin
  if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
  begin
    showmessage('对不起您只有该程序的只读权限');
    exit;
  end;
  Frm_addequipment:=TFrm_addequipment.Create(Application);
  i:=DM.ADO573.RecNo;
  with Frm_addequipment do
  begin
    ComboBox1.Items.Clear;
    with DM.ADOQuery1 do
    begin
      Active:=False;
      SQL.Clear;
      SQL.Add('select abbr_name from data0015');
      Active:=True;
      DisableControls;
      First;
      while not Eof do
      begin
        ComboBox1.Items.Add(FieldValues['abbr_name']);
        Next;
      end;
      EnableControls;
    end;
    Edit1.Text:=DM.ADO573allocate_number.Value;
    Edit2.Text:=DM.ADO573FASSET_CODE.Value;
    DateTimePicker1.Date:=DM.ADO573allocate_date.Value;
    Edit16.Text:=DM.ADO573alloccate_type.Value;
    Edit9.Text:=DM.ADO573indeptname_empl.Value;
    Edit10.Text:=DM.ADO573outdeptname_empl.Value;
    Edit11.Text:=DM.ADO573out_equipment.Value;
    Edit12.Text:=DM.ADO573alloc_infac.Value;
    Edit13.Text:=DM.ADO573alloc_indeptname.Value;
    Edit14.Text:=DM.ADO573indeptname_empl.Value;
    Edit15.Text:=DM.ADO573in_equipment.Value;
    Edit17.Text:=DM.ADO573LOCATION1.Value;
    Memo1.Lines.Text:=DM.ADO573remark.Value;
    with DM.ADOQuery1 do
    begin
      Active:=False;
      SQL.Clear;
      SQL.Add('select Data0417.rkey,data0417.FASSET_CODE,data0417.FASSET_NAME,isnull(data0517.ORIGINAL_VALUE,0) as ORIGINAL_VALUE,');
      SQL.Add('isnull(data0517.SUMMED_DEPRE,0) as SUMMED_DEPRE,isnull(data0517.NET_VALUE,0) as NET_VALUE,');
      SQL.Add('isnull(data0517.EXPECTED_LIFE_MONTHS,0) as EXPECTED_LIFE_MONTHS,isnull(data0517.DEPRED_MONTHS,0) as DEPRED_MONTHS,');
      SQL.Add('isnull(data0015.abbr_name,'''') as abbr_name,isnull(data0034.dept_name,'''') as dept_name ');
      SQL.Add('from data0417 left outer join ');
      SQL.Add('data0517 on data0417.FASSET_CODE=data0517.FASSET_CODE left outer join ');
      SQL.Add('data0015 on data0417.warehouse_ptr=data0015.rkey left outer join ');
      SQL.Add('data0034 on data0417.DEPT_PTR=data0034.rkey ');
      SQL.Add('where data0417.FASSET_CODE='''+trim(Frm_addequipment.Edit2.Text)+'''');
      Active:=True;
      Label19.Caption:=FieldValues['FASSET_NAME'];
      Label20.Caption:=FieldValues['rkey'];
      Edit3.Text:=FormatFloat('0.00',FieldValues['ORIGINAL_VALUE']);
      Edit4.Text:=FormatFloat('0.00',FieldValues['SUMMED_DEPRE']);
      Edit5.Text:=FormatFloat('0.00',FieldValues['NET_VALUE']);
      Edit6.Text:=FieldValues['EXPECTED_LIFE_MONTHS'];
      Edit7.Text:=FieldValues['DEPRED_MONTHS'];
      Edit8.Text:=FieldValues['abbr_name'];
      Edit9.Text:=FieldValues['dept_name'];
      if Trim(Edit16.Text)='内部调拨' then
      begin
        Edit15.Visible:=False;
        Label18.Top:=Label18.Top-30;
        Memo1.Top:=Memo1.Top-30;
        ComboBox1.Visible:=True;
        Edit12.Visible:=False;
        if Edit8.Text='深圳五株' then
          ComboBox1.ItemIndex:=0;
        if Edit8.Text='深圳快板' then
          ComboBox1.ItemIndex:=1;
        if Edit8.Text='星株电子' then
          ComboBox1.ItemIndex:=2;
        if Trim(Edit13.Text)<>'' then
        begin
          with DM.ADOQuery1 do
          begin
            Active:=False;
            SQL.Clear;
            SQL.Add('select rkey from data0034 where dept_name='''+trim(Edit13.Text)+'''');
            Active:=True;
            Label21.Caption:=FieldValues['rkey'];
          end;
        end;
      end
      else
      begin
        Label22.Visible:=False;
        Edit17.Visible:=False;
        Edit12.Visible:=True;
        ComboBox1.Visible:=False;
        Edit12.ReadOnly:=True;
        Edit12.Color:=clMenuBar;
        BitBtn4.Visible:=False;
        Label16.Top:=Label16.Top-30;
        Edit14.Top:=Edit14.Top-30;
        Label17.Top:=Label17.Top-30;
        Edit15.Top:=Edit15.Top-30;
        Label18.Top:=Label18.Top-30;
        Memo1.Top:=Memo1.Top-30;
      end;
    end;
  end;
  if Frm_addequipment.ShowModal=mrok then
  begin
    DM.ADOConn.BeginTrans;
    if Trim(Frm_addequipment.Edit16.Text)='内部调拨' then
    begin
      try
        with DM.ADOQuery1 do
        begin
          Active:=False;
          SQL.Clear;
          SQL.Add('update data0573 set allocate_number=:allocate_number,fasset_ptr=:fasset_ptr,allocate_date=:allocate_date,alloccate_type=:alloccate_type,');
          SQL.Add('user_ptr=:user_ptr,original_value=:original_value,summed_depre=:summed_depre,net_value=:net_value,');
          SQL.Add('expected_life_months=:expected_life_months,depred_months=:depred_months,alloc_outfac=:alloc_outfac,');
          SQL.Add('alloc_outdeptname=:alloc_outdeptname,outdeptname_empl=:outdeptname_empl,out_equipment=:out_equipment,alloc_infac=:alloc_infac,');
          SQL.Add('alloc_indeptname=:alloc_indeptname,indeptname_empl=:indeptname_empl,in_equipment=:in_equipment,remark=:remark,');
          SQL.Add('alloc_indept_ptr=:alloc_indept_ptr,LOCATION=:LOCATION where rkey=:rkey');
          with Frm_addequipment do
          begin
            Parameters[0].Value:=Trim(Edit1.Text);
            Parameters[1].Value:=Trim(Label20.Caption);
            Parameters[2].Value:=DateTimePicker1.Date;
            Parameters[3].Value:=Trim(Edit16.Text);
            Parameters[4].Value:=rkey;
            Parameters[5].Value:=Trim(Edit3.Text);
            Parameters[6].Value:=Trim(Edit4.Text);
            Parameters[7].Value:=Trim(Edit5.Text);
            Parameters[8].Value:=Trim(Edit6.Text);
            Parameters[9].Value:=Trim(Edit7.Text);
            Parameters[10].Value:=Trim(Edit8.Text);
            Parameters[11].Value:=Trim(Edit9.Text);
            Parameters[12].Value:=Trim(Edit10.Text);
            Parameters[13].Value:=Trim(Edit11.Text);
            Parameters[14].Value:=Trim(Edit12.Text);
            Parameters[15].Value:=Trim(Edit13.Text);
            Parameters[16].Value:=Trim(Edit14.Text);
            Parameters[17].Value:=Trim(Edit15.Text);
            Parameters[18].Value:=Trim(Memo1.Lines.Text);
            Parameters[19].Value:=Trim(Label21.Caption);
            Parameters[20].Value:=Trim(Edit17.Text);
            Parameters[21].Value:=DM.ADO573rkey.Value;
          end;
          ExecSQL;
          DM.ADOConn.CommitTrans;
          DM.ADO573.Close;
          DM.ADO573.Open;
          DM.ADO573.RecNo:=i;
        end;
      except
        on e: exception do
        begin
          DM.ADOConn.RollbackTrans;
          DM.ADOQuery1.cancel;
          messagedlg(e.message,mterror,[mbcancel],0);
        end;
      end;
    end
    else
    begin
      try
        with DM.ADOQuery1 do
        begin
          Active:=False;
          SQL.Clear;
          SQL.Add('update data0573 set allocate_number=:allocate_number,fasset_ptr=:fasset_ptr,allocate_date=:allocate_date,alloccate_type=:alloccate_type,');
          SQL.Add('user_ptr=:user_ptr,original_value=:original_value,summed_depre=:summed_depre,net_value=:net_value,');
          SQL.Add('expected_life_months=:expected_life_months,depred_months=:depred_months,alloc_outfac=:alloc_outfac,');
          SQL.Add('alloc_outdeptname=:alloc_outdeptname,outdeptname_empl=:outdeptname_empl,out_equipment=:out_equipment,alloc_infac=:alloc_infac,');
          SQL.Add('alloc_indeptname=:alloc_indeptname,indeptname_empl=:indeptname_empl,in_equipment=:in_equipment,remark=:remark ');
          SQL.Add('where rkey=:rkey');
          with Frm_addequipment do
          begin
            Parameters[0].Value:=Trim(Edit1.Text);
            Parameters[1].Value:=Trim(Label20.Caption);
            Parameters[2].Value:=DateTimePicker1.Date;
            Parameters[3].Value:=Trim(Edit16.Text);
            Parameters[4].Value:=rkey;
            Parameters[5].Value:=Trim(Edit3.Text);
            Parameters[6].Value:=Trim(Edit4.Text);
            Parameters[7].Value:=Trim(Edit5.Text);
            Parameters[8].Value:=Trim(Edit6.Text);
            Parameters[9].Value:=Trim(Edit7.Text);
            Parameters[10].Value:=Trim(Edit8.Text);
            Parameters[11].Value:=Trim(Edit9.Text);
            Parameters[12].Value:=Trim(Edit10.Text);
            Parameters[13].Value:=Trim(Edit11.Text);
            Parameters[14].Value:=Trim(Edit12.Text);
            Parameters[15].Value:=Trim(Edit13.Text);
            Parameters[16].Value:=Trim(Edit14.Text);
            Parameters[17].Value:=Trim(Edit15.Text);
            Parameters[18].Value:=Trim(Memo1.Lines.Text);
            Parameters[19].Value:=DM.ADO573rkey.Value;
          end;
          ExecSQL;
          DM.ADOConn.CommitTrans;
          DM.ADO573.Close;
          DM.ADO573.Open;
          DM.ADO573.RecNo:=i;
        end;
      except
        on e: exception do
        begin
          DM.ADOConn.RollbackTrans;
          DM.ADOQuery1.cancel;
          messagedlg(e.message,mterror,[mbcancel],0);
        end;
      end;
    end;
  end;
end;

procedure TFrm_Main.N5Click(Sender: TObject);
begin
  if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
  begin
    showmessage('对不起您只有该程序的只读权限');
    exit;
  end;
  if MessageDlg('数据一旦删除无法恢复，您确定要删除这条记录？',mtConfirmation,[mbYes,mbNo],0)<>6 then Exit;
  DM.ADOConn.BeginTrans;
  try
    with DM.ADOQuery1 do
    begin
      Active:=False;
      SQL.Clear;
      SQL.Add('delete data0573 where rkey='+DM.ADO573rkey.Text);
      ExecSQL;
    end;
    DM.ADOConn.CommitTrans;
    DM.ADO573.Close;
    DM.ADO573.Open;
  except
    on e: exception do
    begin
      DM.ADOConn.RollbackTrans;
      DM.ADOQuery1.cancel;
      messagedlg(e.message,mterror,[mbcancel],0);
    end;
  end;
end;

procedure TFrm_Main.N6Click(Sender: TObject);
var
  i:Byte;
begin
  Frm_addequipment:=TFrm_addequipment.Create(Application);
  i:=DM.ADO573.RecNo;
  with Frm_addequipment do
  begin
    ComboBox1.Items.Clear;
    with DM.ADOQuery1 do
    begin
      Active:=False;
      SQL.Clear;
      SQL.Add('select abbr_name from data0015');
      Active:=True;
      DisableControls;
      First;
      while not Eof do
      begin
        ComboBox1.Items.Add(FieldValues['abbr_name']);
        Next;
      end;
      EnableControls;
    end;
    Edit1.Text:=DM.ADO573allocate_number.Value;
    Edit2.Text:=DM.ADO573FASSET_CODE.Value;
    DateTimePicker1.Date:=DM.ADO573allocate_date.Value;
    Edit16.Text:=DM.ADO573alloccate_type.Value;
    Edit9.Text:=DM.ADO573indeptname_empl.Value;
    Edit10.Text:=DM.ADO573outdeptname_empl.Value;
    Edit11.Text:=DM.ADO573out_equipment.Value;
    Edit12.Text:=DM.ADO573alloc_infac.Value;
    Edit13.Text:=DM.ADO573alloc_indeptname.Value;
    Edit14.Text:=DM.ADO573indeptname_empl.Value;
    Edit15.Text:=DM.ADO573in_equipment.Value;
    Edit17.Text:=DM.ADO573LOCATION1.Value;
    Memo1.Lines.Text:=DM.ADO573remark.Value;
    with DM.ADOQuery1 do
    begin
      Active:=False;
      SQL.Clear;
      SQL.Add('select Data0417.rkey,data0417.FASSET_CODE,data0417.FASSET_NAME,isnull(data0517.ORIGINAL_VALUE,0) as ORIGINAL_VALUE,');
      SQL.Add('isnull(data0517.SUMMED_DEPRE,0) as SUMMED_DEPRE,isnull(data0517.NET_VALUE,0) as NET_VALUE,');
      SQL.Add('isnull(data0517.EXPECTED_LIFE_MONTHS,0) as EXPECTED_LIFE_MONTHS,isnull(data0517.DEPRED_MONTHS,0) as DEPRED_MONTHS,');
      SQL.Add('isnull(data0015.abbr_name,'''') as abbr_name,isnull(data0034.dept_name,'''') as dept_name ');
      SQL.Add('from data0417 left outer join ');
      SQL.Add('data0517 on data0417.FASSET_CODE=data0517.FASSET_CODE left outer join ');
      SQL.Add('data0015 on data0417.warehouse_ptr=data0015.rkey left outer join ');
      SQL.Add('data0034 on data0417.DEPT_PTR=data0034.rkey ');
      SQL.Add('where data0417.FASSET_CODE='''+trim(Frm_addequipment.Edit2.Text)+'''');
      Active:=True;
      Label19.Caption:=FieldValues['FASSET_NAME'];
      Label20.Caption:=FieldValues['rkey'];
      Edit3.Text:=FormatFloat('0.00',FieldValues['ORIGINAL_VALUE']);
      Edit4.Text:=FormatFloat('0.00',FieldValues['SUMMED_DEPRE']);
      Edit5.Text:=FormatFloat('0.00',FieldValues['NET_VALUE']);
      Edit6.Text:=FieldValues['EXPECTED_LIFE_MONTHS'];
      Edit7.Text:=FieldValues['DEPRED_MONTHS'];
      Edit8.Text:=FieldValues['abbr_name'];
      Edit9.Text:=FieldValues['dept_name'];
      if Trim(Edit16.Text)='内部调拨' then
      begin
        Edit15.Visible:=False;
        Label18.Top:=Label18.Top-30;
        Memo1.Top:=Memo1.Top-30;
        ComboBox1.Visible:=True;
        Edit12.Visible:=False;
        if Edit8.Text='深圳五株' then
          ComboBox1.ItemIndex:=0;
        if Edit8.Text='深圳快板' then
          ComboBox1.ItemIndex:=1;
        if Edit8.Text='星株电子' then
          ComboBox1.ItemIndex:=2;
      end
      else
      begin
        Label22.Visible:=False;
        Edit17.Visible:=False;
        Edit12.Visible:=True;
        ComboBox1.Visible:=False;
        BitBtn4.Visible:=False;
        Label16.Top:=Label16.Top-30;
        Edit14.Top:=Edit14.Top-30;
        Label17.Top:=Label17.Top-30;
        Edit15.Top:=Edit15.Top-30;
        Label18.Top:=Label18.Top-30;
        Memo1.Top:=Memo1.Top-30;
      end;
    end;
    Edit1.Enabled:=False;
    Edit2.Enabled:=False;
    BitBtn3.Enabled:=False;
    DateTimePicker1.Enabled:=False;
    Edit10.Enabled:=False;
    Edit11.Enabled:=False;
    Edit12.Enabled:=False;
    Edit13.Enabled:=False;
    BitBtn4.Enabled:=False;
    Edit14.Enabled:=False;
    Edit15.Enabled:=False;
    Edit17.Enabled:=False;
    Memo1.Enabled:=False;
    BitBtn1.Enabled:=False;
    ComboBox1.Enabled:=False;
  end;
  Frm_addequipment.ShowModal;
end;

procedure TFrm_Main.DBGrd1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if not DM.ADO573.IsEmpty then
  begin
    with DM.ADOQuery1 do
    begin
      Active:=False;
      SQL.Clear;
      SQL.Add('select status,alloccate_type from data0573 where rkey='+DM.ADO573rkey.Text);
      Active:=True;
      if FieldValues['alloccate_type']='内部调拨' then
        N11.Visible:=False
      else
        N11.Visible:=True;
      if FieldValues['status']=0 then
      begin
        N8.Enabled:=True;
        N9.Enabled:=False;
        N10.Enabled:=False;
        N11.Enabled:=False;
        N4.Enabled:=True;
        N5.Enabled:=True;
      end;
      if FieldValues['status']=1 then
      begin
        N8.Enabled:=False;
        N9.Enabled:=True;
        N10.Enabled:=False;
        N11.Enabled:=False;
        N4.Enabled:=False;
        N5.Enabled:=False;
      end;
      if FieldValues['status']=2 then
      begin
        N8.Enabled:=False;
        N9.Enabled:=False;
        N10.Enabled:=True;
        N11.Enabled:=False;
        N4.Enabled:=False;
        N5.Enabled:=False;
      end;
      if FieldValues['status']=3 then
      begin
        N8.Enabled:=False;
        N9.Enabled:=False;
        N10.Enabled:=False;
        N11.Enabled:=True;
        N4.Enabled:=False;
        N5.Enabled:=False;
      end;
      if FieldValues['status']=4 then
      begin
        N8.Enabled:=False;
        N9.Enabled:=False;
        N10.Enabled:=False;
        N11.Enabled:=False;
        N4.Enabled:=False;
        N5.Enabled:=False;
      end;
    end;
  end;
end;

procedure TFrm_Main.N8Click(Sender: TObject);
var
  i:Byte;
  warehouse:string;
begin
  if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
  begin
    showmessage('对不起您只有该程序的只读权限');
    exit;
  end;
  if MessageDlg('您确定确认此设备？',mtConfirmation,[mbYes,mbNo],0)<>6 then Exit;
  i:=DM.ADO573.RecNo;
  DM.ADOConn.BeginTrans;
  try
    with DM.ADOQuery1 do
    begin
      Active:=False;
      SQL.Clear;
      SQL.Add('update data0573 set warehouse_user=:warehouse_user,warehouse_date=:warehouse_date,status=:status where rkey=:rkey');
      Parameters[0].Value:=rkey;
      Parameters[1].Value:=longDate;
      Parameters[2].Value:=1;
      Parameters[3].Value:=DM.ADO573rkey.Value;
      ExecSQL;
    end;
    if DM.ADO573alloccate_type.Value='内部调拨' then
    begin
      with DM.ADOQuery1 do
      begin
        Active:=False;
        SQL.Clear;
        SQL.Add('select rkey from data0015 where abbr_name='''+DM.ADO573alloc_infac.Value+'''');
        Active:=True;
        warehouse:=FieldValues['rkey'];
      end;
      with DM.ADOQuery1 do
      begin
        Active:=False;
        SQL.Clear;
        SQL.Add('update data0417 set warehouse_ptr=:warehouse_ptr,dept_ptr=:dept_ptr,LOCATION=:LOCATION where rkey=:rkey');
        Parameters[0].Value:=warehouse;
        Parameters[1].Value:=DM.ADO573alloc_indept_ptr.Value;
        Parameters[2].Value:=DM.ADO573LOCATION1.Value;
        Parameters[3].Value:=DM.ADO573fasset_ptr.Value;
        ExecSQL;
      end;
    end
    else
    begin
      with DM.ADOQuery1 do
      begin
        Active:=False;
        SQL.Clear;
        SQL.Add('update data0417 set active_flag=:active_flag where rkey=:rkey');
        Parameters[0].Value:=6;
        Parameters[1].Value:=DM.ADO573fasset_ptr.Value;
        ExecSQL;
      end;
    end;
    DM.ADOConn.CommitTrans;
    DM.ADO573.Close;
    DM.ADO573.Open;
    DM.ADO573.RecNo:=i;
  except
    on e: exception do
    begin
      DM.ADOConn.RollbackTrans;
      messagedlg(e.message,mterror,[mbcancel],0);
    end;
  end;
end;

procedure TFrm_Main.N9Click(Sender: TObject);
var
  i:Byte;
begin
  if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
  begin
    showmessage('对不起您只有该程序的只读权限');
    exit;
  end;
  if MessageDlg('您确定审核此设备？',mtConfirmation,[mbYes,mbNo],0)<>6 then Exit;
  i:=DM.ADO573.RecNo;
  DM.ADOConn.BeginTrans;
  try
    with DM.ADOQuery1 do
    begin
      Active:=False;
      SQL.Clear;
      SQL.Add('update data0573 set financial_user=:financial_user,financial_date=:financial_date,status=:status where rkey=:rkey');
      Parameters[0].Value:=rkey;
      Parameters[1].Value:=longDate;
      Parameters[2].Value:=2;
      Parameters[3].Value:=DM.ADO573rkey.Value;
      ExecSQL;
    end;
    DM.ADOConn.CommitTrans;
    DM.ADO573.Close;
    DM.ADO573.Open;
    DM.ADO573.RecNo:=i;
  except
    on e: exception do
    begin
      DM.ADOConn.RollbackTrans;
      DM.ADOQuery1.cancel;
      messagedlg(e.message,mterror,[mbcancel],0);
    end;
  end;
end;

procedure TFrm_Main.N10Click(Sender: TObject);
var
  i:Byte;
begin
  if (strtoint(vprev)<>4) then
  begin
    showmessage('对不起您只有该程序的只读权限');
    exit;
  end;
  if MessageDlg('您确定确认此设备？',mtConfirmation,[mbYes,mbNo],0)<>6 then Exit;
  i:=DM.ADO573.RecNo;
  DM.ADOConn.BeginTrans;
  try
    with DM.ADOQuery1 do
    begin
      Active:=False;
      SQL.Clear;
      SQL.Add('update data0573 set manage_user=:manage_user,manage_date=:manage_date,status=:status where rkey=:rkey');
      Parameters[0].Value:=rkey;
      Parameters[1].Value:=longDate;
      Parameters[2].Value:=3;
      Parameters[3].Value:=DM.ADO573rkey.Value;
      ExecSQL;
    end;
    DM.ADOConn.CommitTrans;
    DM.ADO573.Close;
    DM.ADO573.Open;
    DM.ADO573.RecNo:=i;
  except
    on e: exception do
    begin
      DM.ADOConn.RollbackTrans;
      DM.ADOQuery1.cancel;
      messagedlg(e.message,mterror,[mbcancel],0);
    end;
  end;
end;

procedure TFrm_Main.N11Click(Sender: TObject);
var
  i:Byte;
begin
  if (strtoint(vprev)<>4) then
  begin
    showmessage('对不起您只有该程序的只读权限');
    exit;
  end;
  if MessageDlg('您确定确认此设备？',mtConfirmation,[mbYes,mbNo],0)<>6 then Exit;
  i:=DM.ADO573.RecNo;
  DM.ADOConn.BeginTrans;
  try
    with DM.ADOQuery1 do
    begin
      Active:=False;
      SQL.Clear;
      SQL.Add('update data0573 set chief_user=:chief_user,chief_date=:chief_date,status=:status where rkey=:rkey');
      Parameters[0].Value:=rkey;
      Parameters[1].Value:=longDate;
      Parameters[2].Value:=4;
      Parameters[3].Value:=DM.ADO573rkey.Value;
      ExecSQL;
    end;
    DM.ADOConn.CommitTrans;
    DM.ADO573.Close;
    DM.ADO573.Open;
    DM.ADO573.RecNo:=i;
  except
    on e: exception do
    begin
      DM.ADOConn.RollbackTrans;
      DM.ADOQuery1.cancel;
      messagedlg(e.message,mterror,[mbcancel],0);
    end;
  end;
end;

procedure TFrm_Main.BitBtn3Click(Sender: TObject);
begin
  if not DM.ADO573.IsEmpty then
    Export_dbGridEH_to_Excel(DBGrd1,Application.Title);
end;

procedure TFrm_Main.DBGrd1TitleClick(Column: TColumnEh);
begin
  if Column.Title.SortMarker=smUpEh then
  begin
    Column.Title.SortMarker:=smDownEh;
    DM.ADO573.IndexFieldNames:=Column.FieldName+' DESC';
  end
  else
  begin
    Column.Title.SortMarker:=smUpEh;
    DM.ADO573.IndexFieldNames:=Column.FieldName;
  end;
  if Column.Tag<>1 then
  begin
    if preColumn.FieldName<>Column.FieldName then
    begin
      Label1.Caption:=Column.Title.Caption;
      preColumn.Title.Color:=clBtnFace;
      Column.Title.Color:=clRed;
      preColumn:=Column;
      Edit1.Text:='';
      Edit1.SetFocus;
    end;
  end;
end;

procedure TFrm_Main.Edit1Change(Sender: TObject);
begin
  if Trim(Edit1.Text)<>'' then
    DM.ADO573.Filter:=preColumn.FieldName+' like ''%'+Trim(Edit1.Text)+'%'''
  else
    DM.ADO573.Filter:='';
end;

procedure TFrm_Main.FormCreate(Sender: TObject);
begin
  if not app_init_2(DM.ADOConn) then
  begin
    ShowMsg('程序启动失败，请联系系统管理员！','提示',1);
    application.Terminate;
  end;
//  vprev:='4';
//  rkey73:='2012';
  DM.ADO573.Active:=True;
  Self.Caption:=Application.Title;
end;

procedure TFrm_Main.Button1Click(Sender: TObject);
var
  i:Byte;
begin
  Frm_Search:=TFrm_Search.Create(Application);
  Frm_Search.dtpk1.Date:=sortDate-dayof(sortDate)+1;
  Frm_Search.dtpk2.Date:=sortDate;
  if Frm_Search.ShowModal=mrok then
  begin
    with DM.ADO573 do
    begin
      Close;
      CommandText:=sql_Text+' and data0573.ent_date>='+
      quotedstr(formatdatetime('YYYY-MM-DD',Frm_Search.dtpk1.Date))+ 'and data0573.ent_date<= '+
      quotedstr(formatdatetime('YYYY-MM-DD',Frm_Search.dtpk2.Date+1));
      for i := 1 to Frm_Search.Sgrd.RowCount-2 do
        CommandText:=CommandText+Frm_Search.Sgrd.Cells[2,i];
      ShowMessage(CommandText);
      Open;
    end;
  end;
end;

procedure TFrm_Main.DBGrd1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (chr(key)='S') and (ssalt in shift) then
    ShowMessage(DM.ADO573.CommandText);
end;

end.
