unit UpdateMrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, jpeg, DB,ExtDlgs,ADODB, FileCtrl,IniFiles,
  ComCtrls,common, Grids,StrUtils, DBGrids;


type
  TUpdateFrm = class(TForm)
    cbb_1: TComboBox;
    lb_2: TLabel;
    edt_1: TEdit;
    lb_11: TLabel;
    edt_2: TEdit;
    pnl1: TPanel;
    bbt_1: TBitBtn;
    lb_3: TLabel;
    lb_4: TLabel;
    lb_5: TLabel;
    lb_6: TLabel;
    lb_7: TLabel;
    lb_8: TLabel;
    lb_9: TLabel;
    lb_10: TLabel;
    lb_12: TLabel;
    lb_13: TLabel;
    lb_14: TLabel;
    edt_Empcode: TEdit;
    edt_EmpName: TEdit;
    edt_EmpDept: TEdit;
    edt_EmpCarNo: TEdit;
    edt_RoomCode: TEdit;
    lb_16: TLabel;
    lb_20: TLabel;
    edt_Province: TEdit;
    edt_MinZu: TEdit;
    edt_Phone: TEdit;
    edt_ExtraPhone: TEdit;
    lb_18: TLabel;
    edt_Position: TEdit;
    edt_WorkAge: TEdit;
    lb_15: TLabel;
    edt_NowDate: TEdit;
    img1: TImage;
    grb_1: TGroupBox;
    lb_17: TLabel;
    edt_factoryarea: TEdit;
    bbt_2: TBitBtn;
    bbt_3: TBitBtn;
    lb_19: TLabel;
    rb1: TRadioButton;
    rb2: TRadioButton;
    dtpbirthday: TDateTimePicker;
    dtpOntime: TDateTimePicker;
    lb_21: TLabel;
    cbb_Marriage: TComboBox;
    lb_110: TLabel;
    edt_IP: TEdit;
    lb_database: TLabel;
    lb_111: TLabel;
    edt_CarNum: TEdit;
    lb_22: TLabel;
    edt_3: TEdit;
    edt_4: TEdit;
    pnl2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    chkb1: TCheckBox;
    procedure FormShow(Sender: TObject);
    procedure bbt_2Click(Sender: TObject);
    procedure bbt_1Click(Sender: TObject);
    procedure cbb_1Change(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure chk_1Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure bbt_3Click(Sender: TObject);
  private
    { Private declarations }
    program_ini: TIniFile;
    FileName: string;
  public
    { Public declarations }
  end;

var
  UpdateFrm: TUpdateFrm;

implementation

uses Damo;

{$R *.dfm}


procedure TUpdateFrm.FormShow(Sender: TObject);
var
  i: Integer;
  Ms:TStream;
  jpg:Tjpegimage;
  bmp: TBitmap;
begin
  //修改入住员工信息
  filename:=Extractfilepath(ParamStr(0))+'WISDOMPCB.ini';
  program_ini:=Tinifile.Create(filename);
  program_ini.ReadSection('数据库',cbb_1.Items);
  cbb_1.ItemIndex := 0;
  edt_IP.Text:=program_ini.ReadString('服务器',cbb_1.Text,'');
  lb_database.Caption := program_ini.ReadString('数据库',cbb_1.Text,'');
  {with DM.qryTemp do   begin      SQL.Clear;    SQL.Text := 'exec sp_configure ''show advanced options'',1 '
      + 'reconfigure WITH OVERRIDE '  + 'exec sp_configure ''Ad Hoc Distributed Queries'',1 '
      + 'reconfigure WITH OVERRIDE ';     ExecSQL;   end;}
  if dm.Tag = 0 then
  begin
   edt_NowDate.Text := DateToStr(now);
   bbt_2.Enabled := true;
  end;
  if dm.Tag = 1 then
  begin
    pnl1.Visible := False;
    bbt_2.Enabled := true;
    UpdateFrm.Height := UpdateFrm.Height - pnl1.Height;
    grb_1.Top := grb_1.Top - pnl1.Height;
    bbt_2.Top := bbt_2.Top - pnl1.Height;
    bbt_3.Top := bbt_3.Top - pnl1.Height;
    with DM.qryMain do
    begin
      edt_factoryarea.Text := FieldValues['factoryarea'];
      edt_Empcode.Text := FieldValues['employeecode'];
      edt_EmpName.Text := FieldValues['chinesename'];
      edt_EmpDept.Text := FieldValues['departmentname'];
      edt_EmpCarNo.Text := FieldValues['cardno'];
      edt_CarNum.Text := FieldValues['IDCard'];
      dtpOntime.DateTime := fieldByName('ondutytime').AsDateTime;
      edt_4.Text := FieldValues['outdutytime'];
      edt_NowDate.Text := FieldValues['regdate'];
      edt_RoomCode.Text := FieldValues['roomcode'];
      dtpbirthday.DateTime:= fieldByName('birthday').AsDateTime;
      edt_Province.Text:= FieldValues['Province'];
      edt_MinZu.Text:= FieldValues['nation'];
      edt_Phone.Text:= FieldValues['phone'];
      edt_ExtraPhone.Text := FieldValues['others_contacts'];
      edt_Position.Text:= FieldValues['position'];
      edt_WorkAge.Text:= FieldValues['workage'];
      if dm.qryMainflag.Value = 0 then
      chkb1.Checked := true
      else
      chkb1.Checked := false ;
      if FieldValues['sex'] = '男' then rb1.Checked := True;
      if FieldValues['sex'] = '女' then rb2.Checked := True;
      if FieldValues['marriage'] = '已婚' then cbb_Marriage.ItemIndex := 1;
      if FieldValues['marriage'] = '未婚' then cbb_Marriage.ItemIndex := 0;
     with DM.qryTemp do
      begin
        close;
        SQL.Clear;
        SQL.Text := 'select photo from employeemsg_extra where rkey='+ DM.qryMain.FieldByName('rkey').AsString;
        open;
      end;
      Ms:=TStream.Create;
      //MS:=CreateBlobStream(FieldbyName('photo'),bmRead);
      Ms := CreateBlobStream(DM.qryTemp.FieldByName('photo'),bmRead);
      Ms.Position :=0;
      bmp:=TBitmap.Create;
      bmp.LoadFromStream(Ms);
      Img1.Picture.Assign(bmp);
      bmp.Free;
      MS.Free;
    end;
  end;

  if DM.Tag = 2 then
  begin
    pnl1.Visible := False;
    bbt_2.Enabled := false;
    UpdateFrm.Height := UpdateFrm.Height - pnl1.Height;
    grb_1.Top := grb_1.Top - pnl1.Height;
    bbt_2.Top := bbt_2.Top - pnl1.Height;
    bbt_3.Top := bbt_3.Top - pnl1.Height;
    for i :=0 to ComponentCount - 1 do
    begin
      if Self.Components[i] is TEdit then
      begin
        TEdit(Components[i]).ReadOnly := True;
      end;
      if Self.Components[i] is TDateTimePicker then
      begin
        TDateTimePicker(Components[i]).Enabled := False;
      end;
      if Self.Components[i] is TComboBox then
      begin
        TComboBox(Components[i]).Enabled := False;
      end;
      if Self.Components[i] is TRadioButton then
      begin
        TRadioButton(Components[i]).Enabled := False;
      end;
    end;
    with DM.qryMain do
    begin
      with DM.qryTemp do
      begin
        close;
        SQL.Clear;
        SQL.Text := 'select photo from employeemsg_extra where rkey='+ DM.qryMain.FieldByName('rkey').AsString;
        open;
      end;
      edt_factoryarea.Text := FieldValues['factoryarea'];
      edt_Empcode.Text := FieldValues['employeecode'];
      edt_EmpName.Text := FieldValues['chinesename'];
      edt_CarNum.Text := FieldValues['IDCard'];
      edt_EmpDept.Text := FieldValues['departmentname'];
      edt_EmpCarNo.Text := FieldValues['cardno'];

      dtpOntime.DateTime := fieldByName('ondutytime').AsDateTime;

      edt_4.Text := FieldValues['outdutytime'];

      edt_NowDate.Text := FieldValues['regdate'];
      edt_RoomCode.Text := FieldValues['roomcode'];
      dtpbirthday.DateTime:= fieldByName('birthday').AsDateTime;
      edt_Province.Text:= FieldValues['Province'];
      edt_MinZu.Text:= FieldValues['nation'];
      edt_Phone.Text:= FieldValues['phone'];
      edt_ExtraPhone.Text := FieldValues['others_contacts'];
      edt_Position.Text:= FieldValues['position'];
      edt_WorkAge.Text:= FieldValues['workage'];
      if FieldValues['flag']= 1 then chkb1.Checked := false else chkb1.Checked := true;
      if FieldValues['sex'] = '男' then rb1.Checked := True;
      if FieldValues['sex'] = '女' then rb2.Checked := True;
      if FieldValues['marriage'] = '已婚' then cbb_Marriage.ItemIndex := 1;
      if FieldValues['marriage'] = '未婚' then cbb_Marriage.ItemIndex := 0;
      Ms:=TStream.Create;
      //MS:=CreateBlobStream(FieldbyName('photo'),bmRead);
      Ms := CreateBlobStream(DM.qryTemp.FieldByName('photo'),bmRead);
      Ms.Position :=0;
      bmp:=TBitmap.Create;
      bmp.LoadFromStream(Ms);
      Img1.Picture.Assign(bmp);
      bmp.Free;
      MS.Free;
    end;
  end;
  edt_factoryarea.SetFocus;
  with DM.qryTemp do
  begin
    SQL.Clear;
    SQL.Text := format('select rkey, employee_name from data0005 where data0005.rkey=''%s'' ', [user_ptr]);
    open;
    edt_3.Text := FieldValues['employee_name'];
    edt_3.Tag := FieldValues['rkey'];
    //ShowMessage(IntToStr(edt_3.Tag));
  end;
end;

procedure TUpdateFrm.bbt_2Click(Sender: TObject);
var
  sexs, flag, i, Erkey: Integer;
  StrFlag: string;
  Stream: TMemoryStream;
  Memo1: TMemo;
begin
  if edt_CarNum.Text = '' then
  begin
    ShowMessage('身份证号码不能为空，信息保存失败！');
    Exit;
  end;
  if rb1.Checked then sexs := 1;
  if rb2.Checked then sexs := 0;
  Stream := TMemoryStream.Create; //  创建内存流
  Img1.Picture.Bitmap.SaveToStream(Stream);
  if chkb1.Checked then flag := 0 else flag:=1;
  //修改
  if DM.Tag = 1 then
  begin
    //判断考勤卡号是否重复
   DM.qryTemp.Close;
   DM.qryTemp.SQL.Clear;
   DM.qryTemp.SQL.Text := 'select rkey from employeemsg_extra where outdutytime is null and rkey<>'+
    IntToStr(DM.qryMain.FieldValues['rkey'])+
    ' and cardno<>'''' and cardno=' + QuotedStr(edt_EmpCarNo.Text);
   //ShowMessage('1'+DM.qryTemp.SQL.Text);
   DM.qryTemp.Open;
   if not DM.qryTemp.FieldByName('rkey').IsNull then
     begin
        ShowMessage('考勤卡号重复，信息保存失败！');
        Exit;
     end;    

    with DM.qryTemp do
    begin
      SQL.Clear;
      SQL.Text := 'update employeemsg_extra set' +
        ' IDCard=' + quotedstr(edt_CarNum.Text) + ',' +
        ' chinesename=' + quotedstr(edt_EmpName.Text) + ',' +
        ' employeecode=' + quotedstr(edt_Empcode.Text) + ',' +
        ' province=' + quotedstr(edt_Province.Text) + ',' +
        ' factoryarea=' + quotedstr(edt_factoryarea.Text) + ',' +
        ' departmentname=' + quotedstr(edt_EmpDept.Text) + ',' +
        ' position=' + quotedstr(edt_Position.Text) + ',' +
        ' ondutytime=' + quotedstr(DateToStr(dtpOntime.Date)) + ',' +
        ' outdutytime=' + quotedstr(edt_4.Text) + ',' +
        ' birthday=' + quotedstr(DateToStr(dtpbirthday.Date)) + ',' +
        ' workage=' + quotedstr(edt_WorkAge.Text) + ','+
        ' marriage=' + quotedstr(cbb_Marriage.Text) + ',' +
        ' phone=' + quotedstr(edt_Phone.Text) + ',' +
        ' others_contacts=' + quotedstr(edt_ExtraPhone.Text)+',' +
        ' nation=' + quotedstr(edt_MinZu.Text) +',' +
        ' cardno=' + quotedstr(edt_EmpCarNo.Text) +',' +
        ' photo= :image_photo' + ',' +
        ' sex=' + IntToStr(sexs) + ',' +
        ' operator=' + IntToStr(edt_3.tag) + ','+
        ' flag='+inttostr(flag)+
        ' where rkey='+ IntToStr(DM.qryMain.FieldValues['rkey']);
        Parameters.ParamByName('image_photo').LoadFromStream(Stream,ftBlob);
      ExecSQL;
    end;
    Close;
  end;

  //新增
  if DM.Tag = 0 then
  begin
    //曾已有记录
    with DM.qryTemp do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'select rkey from employeemsg_extra where IDCard=' + QuotedStr(edt_CarNum.Text);
      Open;
      if not FieldByName('rkey').IsNull then
        begin
          Erkey := FieldValues['rkey'];
          SQL.Clear;
          SQL.Text := 'update employeemsg_extra set' +
            ' IDCard=' + quotedstr(edt_CarNum.Text) + ',' +
            ' chinesename=' + quotedstr(edt_EmpName.Text) + ',' +
            ' employeecode=' + quotedstr(edt_Empcode.Text) + ',' +
            ' province=' + quotedstr(edt_Province.Text) + ',' +
            ' factoryarea=' + quotedstr(edt_factoryarea.Text) + ',' +
            ' departmentname=' + quotedstr(edt_EmpDept.Text) + ',' +
            ' position=' + quotedstr(edt_Position.Text) + ',' +
            ' ondutytime=' + quotedstr(DateToStr(dtpOntime.Date)) + ',' +
            ' outdutytime=' + quotedstr(edt_4.Text) + ',' +
            ' birthday=' + quotedstr(DateToStr(dtpbirthday.Date)) + ',' +
            ' workage=' + quotedstr(edt_WorkAge.Text) + ','+
            ' marriage=' + quotedstr(cbb_Marriage.Text) + ',' +
            ' phone=' + quotedstr(edt_Phone.Text) + ',' +
            ' others_contacts=' + quotedstr(edt_ExtraPhone.Text)+',' +
            ' nation=' + quotedstr(edt_MinZu.Text) +',' +
            ' cardno=' + quotedstr(edt_EmpCarNo.Text) +',' +
            ' photo= :image_photo' + ',' +
            ' sex=' + IntToStr(sexs) + ',' +
            ' operator=' + IntToStr(edt_3.tag) + ',' +
            ' flag='+inttostr(flag)+
            ' where rkey='+ IntToStr(Erkey);
            Parameters.ParamByName('image_photo').LoadFromStream(Stream,ftBlob);
          ExecSQL;
          showmessage('保存成功!');
        end
      else
        begin
          DM.qryTemp.Close;
          DM.qryTemp.SQL.Clear;
          DM.qryTemp.SQL.Text := 'select rkey from employeemsg_extra where outdutytime is null and  cardno<>'''' and cardno=' + QuotedStr(edt_EmpCarNo.Text);
          //ShowMessage('0 '+DM.qryTemp.SQL.Text);
          DM.qryTemp.Open;
          if not DM.qryTemp.FieldByName('rkey').IsNull then
          begin
            ShowMessage('考勤卡号重复，信息保存失败！');
            Exit;
          end;
         // 此处是新增人员如果不在在职名单里，强行变外协人员 
          with DM.qryTemp do
          begin
            Close;
            SQL.Clear;
            SQL.Text := 'select top 1 * from employeemsg where status=1 and  IDCard=' + QuotedStr(edt_CarNum.Text);
            Open;
            if RecordCount <= 0 then flag := 1
            else  flag := 0;
          end;
          {if (chk_1.Checked)  then  flag := 0;
          if (chk_1.Checked = False)  then  flag := 1;}

          SQL.Clear;
          SQL.Text := 'Insert into employeemsg_extra '+
            ' (photo,IDCard,chinesename,employeecode,province,factoryarea,departmentname,'+
            ' position,ondutytime,outdutytime,birthday,workage,marriage,phone,'+
            ' others_contacts,nation,cardno,regdate,sex,operator,flag)'+
            ' values (:image_photo,'
            + quotedstr(edt_CarNum.Text) + ','
            + quotedstr(edt_EmpName.Text) + ','
            + quotedstr(edt_Empcode.Text) + ','
            + quotedstr(edt_Province.Text) + ','
            + quotedstr(edt_factoryarea.Text) + ','
            + quotedstr(edt_EmpDept.Text) + ','
            + quotedstr(edt_Position.Text) + ','
            + quotedstr(DateToStr(dtpOntime.Date)) + ','
            + quotedstr(edt_4.Text) + ','
            + quotedstr(DateToStr(dtpbirthday.Date)) + ','
            + quotedstr(edt_WorkAge.Text) + ','
            + quotedstr(cbb_Marriage.Text) + ','
            + quotedstr(edt_Phone.Text) + ','
            + quotedstr(edt_ExtraPhone.Text)+','
            + quotedstr(edt_MinZu.Text) +','
            + quotedstr(edt_EmpCarNo.Text) +','
            + quotedstr(edt_NowDate.Text) +','
            + IntToStr(sexs)+ ','
            + IntToStr(edt_3.Tag)+ ','
            + IntToStr(flag)
            + ')';
          Parameters.ParamByName('image_photo').LoadFromStream(Stream,ftBlob);
          ExecSQL;
          showmessage('保存成功!');
        end;
    end;
  end;
  Stream.Free;
  edt_factoryarea.Text := '';
  edt_Empcode.Clear;
  edt_EmpName.Clear;
  edt_EmpDept.Clear;
  edt_EmpCarNo.Clear;
  edt_4.Clear;
  edt_CarNum.Clear;
  edt_RoomCode.Clear;
  edt_Province.Clear;
  edt_MinZu.Clear;
  edt_Position.Clear;
  edt_WorkAge.Clear;
  edt_Phone.Clear;
  edt_ExtraPhone.Clear;
  img1.Picture := nil;
end;

//查询
procedure TUpdateFrm.bbt_1Click(Sender: TObject);
var
  deptrkey,flag: Integer;
  Ms:TStream;
  jpg:Tjpegimage;
  bmp: TBitmap;
begin  
  if (Trim(edt_1.Text) = '')
  and (Trim(edt_2.Text) = '')
  and (Trim(Edit1.Text) = '')
  then
  begin
    ShowMessage('请输入查询条件！');
    Exit;
  end;
  edt_CarNum.Text := '';
  edt_Empcode.Text := '';
  edt_EmpName.Text :='';
  edt_EmpCarNo.Text := '';
  edt_Province.Text:='';
  edt_MinZu.Text:= '';
  edt_Phone.Text:= '';
  edt_ExtraPhone.Text := '';
  edt_Position.Text:= '';
  edt_WorkAge.Text:= '';
  rb1.Checked := False;
  rb2.Checked := False;
  edt_factoryarea.Text := '';
  with dm.qryTemp DO
  begin
    SQL.Clear;
    SQL.Text := 'select rkey,chinesename from employeemsg_extra where flag <> 4 ';
    if edt_1.Text <> '' then SQL.Text := SQL.Text  + ' and employeecode =' + QuotedStr(edt_1.Text);
    if edt_2.Text <> '' then SQL.Text := SQL.Text  + ' and IDcard =' + QuotedStr(edt_2.Text);
    if edit1.Text <> '' then SQL.Text := SQL.Text  + ' and chinesename =' + QuotedStr(edit1.Text);
    Open;
    if not FieldByName('rkey').IsNull then
    begin
      ShowMessage('员工 ' + FieldByName('chinesename').AsString + ' 已有注册记录，请检查！');
      Exit;
    end;

    SQL.Clear;
    SQL.Text := 'select IDCard,employeecode,departmentid,chinesename,cardno,ondutytime,outdutytime,birthday,province,nation,phone, '
      + 'others_contacts,position,sex,marriage,datediff(day,ondutytime,getdate())/365.0  as workage '
      + 'from [' + edt_IP.Text+ '].' + lb_database.Caption + '.dbo.employeemsg where 1=1 and status in (0,1)';
    if edt_1.Text <> '' then SQL.Text := SQL.Text  + ' and employeecode =' + QuotedStr(edt_1.Text);
    if edt_2.Text <> '' then SQL.Text := SQL.Text  + ' and IDCard =' + QuotedStr(edt_2.Text);
    if edit1.Text <> '' then SQL.Text := SQL.Text  + ' and chinesename =' + QuotedStr(edit1.Text);
    Open;
    if not FieldByName('employeecode').IsNull then
      begin
        deptrkey := FieldValues['departmentid'];
        ShowMessage(cbb_1.Text + ', 找到匹配员工 '
        + FieldByName('chinesename').AsString );
        UpdateFrm.Enabled := false;
        edt_factoryarea.Text := cbb_1.Text;
        if not FieldByName('IDCard').IsNull then
        edt_CarNum.Text := FieldValues['IDCard'];
        if not FieldByName('employeecode').IsNull then
        begin
         edt_Empcode.Text := FieldValues['employeecode'];
         if   leftStr(edt_Empcode.Text,1)='3'  then  edt_factoryarea.Text :='志浩科技';
         if   leftStr(edt_Empcode.Text,1)='4'  then  edt_factoryarea.Text :='梅州五株';
         if   leftStr(edt_Empcode.Text,1)='2'  then  edt_factoryarea.Text :='深圳五洲';
         if   leftStr(edt_Empcode.Text,1)='8'  then  edt_factoryarea.Text :='东莞五株';
         end;
        if not FieldByName('chinesename').IsNull then edt_EmpName.Text := FieldValues['chinesename'];

        if not FieldByName('cardno').IsNull then edt_EmpCarNo.Text := FieldValues['cardno'];
        if not FieldByName('ondutytime').IsNull then dtpOntime.Date := FieldValues['ondutytime'];
        if not FieldByName('outdutytime').IsNull then edt_4.Text := FieldValues['outdutytime'];
        edt_NowDate.Text := DateToStr(Now);

        if not FieldByName('birthday').IsNull then dtpbirthday.Date:= FieldValues['birthday'];

        if not FieldByName('province').IsNull then edt_Province.Text:= FieldValues['province'];

        if not FieldByName('nation').IsNull then edt_MinZu.Text:= FieldValues['nation'];

        if not FieldByName('phone').IsNull then edt_Phone.Text:= FieldValues['phone'];

        if not FieldByName('others_contacts').IsNull then edt_ExtraPhone.Text := FieldValues['others_contacts'];
        if not FieldByName('position').IsNull then
        begin
          with DM.qryTemp1 do
          begin
            Close;
            SQL.Clear;
            SQL.Text := 'select * from datadetail  where rkey= ' + IntToStr(DM.qryTemp.FieldValues['position']);
            Open;
            if not DM.qryTemp1.IsEmpty then
              edt_Position.Text := DM.qrytemp1.fieldValues['item'];
          end;
        end;
        if not FieldByName('workage').IsNull then edt_WorkAge.Text:= FieldValues['workage'];

        if not FieldByName('sex').IsNull then
        begin
          if FieldValues['sex'] = '1' then rb1.Checked := True;
          if FieldValues['sex'] = '0' then rb2.Checked := True;
        end;

        if not FieldByName('marriage').IsNull then
        begin
          if FieldValues['marriage'] = '448' then cbb_Marriage.ItemIndex := 1;
          if FieldValues['marriage'] = '449' then cbb_Marriage.ItemIndex := 0;
        end;

        SQL.Clear;
        {SQL.Text := 'select rkey,departmentcode,departmentname from openrowset(''SQLOLEDB'', ' + QuotedStr(edt_IP.Text)+ '; ''wzsa''; ''wisdomtopcb1077'', '
          + lb_database.Caption + '.dbo.datadepartment) where rkey=' + IntToStr(deptrkey);}
        SQL.Text := 'select rkey,departmentcode,departmentname from [' + edt_IP.Text+ '].' + lb_database.Caption + '.dbo.datadepartment where rkey=' + IntToStr(deptrkey);
        open;
        if not FieldByName('departmentname').IsNull then edt_EmpDept.Text := FieldValues['departmentname'];
        SQL.Clear;
        {SQL.Text := 'select top 1 photo from openrowset(''SQLOLEDB'', ' + QuotedStr(edt_IP.Text)+ '; ''wzsa''; ''wisdomtopcb1077'', '
          + lb_database.Caption + '.dbo.employeemsg) where IDCard= ' + QuotedStr(edt_CarNum.Text); }
        SQL.Text := 'select top 1 photo from [' + edt_IP.Text + '].' + lb_database.Caption + '.dbo.employeemsg where IDCard= ' + QuotedStr(edt_CarNum.Text);
        Open;
        if not IsEmpty  then
        begin
          Ms:=TStream.Create;
          MS:=CreateBlobStream(FieldbyName('photo'),bmRead);
          Ms.Position :=0;
          bmp:=TBitmap.Create;
          bmp.LoadFromStream(Ms);
          Img1.Picture.Assign(bmp);
          bmp.Free;
          MS.Free;
        end;
        UpdateFrm.Enabled := true;

            Close;
            SQL.Clear;
            SQL.Text := 'select top 1 * from employeemsg where status=1 and IDCard=' + QuotedStr(edt_CarNum.Text);
            Open;
            if RecordCount <= 0
            then
            begin
              //非本厂员工
              flag := 1;
              chkb1.Checked := false;
            end
            else
            begin
              //本厂员工
              flag := 0;
              chkb1.Checked := true;
            end; 

      end
    else
      begin
        ShowMessage('对不起，查无此人！');
        edt_CarNum.Text := '';
        edt_Empcode.Text := '';
        edt_EmpName.Text :='';
        edt_EmpCarNo.Text := '';
        edt_Province.Text:='';
        edt_MinZu.Text:= '';
        edt_Phone.Text:= '';
        edt_ExtraPhone.Text := '';
        edt_Position.Text:= '';
        edt_WorkAge.Text:= '';
        rb1.Checked := False;
        rb2.Checked := False;
        edt_factoryarea.Text := '';
        img1.picture:=nil;
      end;
  end;
end;

procedure TUpdateFrm.cbb_1Change(Sender: TObject);
begin
  edt_IP.Text := program_ini.ReadString('服务器',cbb_1.Text,'');
  lb_database.Caption := program_ini.ReadString('数据库',cbb_1.Text,'');
end;

procedure TUpdateFrm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 { with DM.qryTemp do
  begin
    SQL.Clear;
    SQL.Text := 'exec sp_configure ''Ad Hoc Distributed Queries'',0  '
      + 'reconfigure WITH OVERRIDE '
      + 'exec sp_configure ''show advanced options'',0 '
      + 'reconfigure WITH OVERRIDE ';
    ExecSQL;
  end; }

end;

procedure TUpdateFrm.chk_1Click(Sender: TObject);
var
  i: Integer;
begin
 { if chk_1.Checked = False then
  begin
    for i :=0 to ComponentCount - 1 do
    begin
     if Self.Components[i] is TEdit then
       TEdit(Components[i]).ReadOnly := False;
    end;
  end;
  if chk_1.Checked = True then
  begin
    for i :=0 to ComponentCount - 1 do
    begin
     if Self.Components[i] is TEdit then
       TEdit(Components[i]).ReadOnly := True;
    end;
  end; }
end;

procedure TUpdateFrm.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    bbt_1Click(sender);
end;

procedure TUpdateFrm.bbt_3Click(Sender: TObject);
begin
  close;
end;

end.
