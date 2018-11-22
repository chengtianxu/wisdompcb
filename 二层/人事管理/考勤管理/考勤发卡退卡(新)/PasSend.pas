unit PasSend;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, Grids,common, Menus;

type
  TfrmSend = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    btnSave: TBitBtn;
    btnCancel: TBitBtn;
    lbNO: TLabel;
    lbCardNO: TLabel;
    edtNO: TEdit;
    edtCardNO: TEdit;
    btnSearch: TBitBtn;
    sgCards: TStringGrid;
    btnAdd: TBitBtn;
    lbName: TLabel;
    edtName: TEdit;
    PopupMenu1: TPopupMenu;
    nDelete: TMenuItem;
    Label1: TLabel;
    ComboBox1: TComboBox;
    procedure FormShow(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure edtNOExit(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure nDeleteClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure edtCardNOKeyPress(Sender: TObject; var Key: Char);
    procedure edtNOKeyPress(Sender: TObject; var Key: Char);
    procedure EdtIcCardNOKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    FIP : string;
    { Public declarations }
  end;

var
  frmSend: TfrmSend;

implementation

uses DAMO,Pick_Item_Single,ConstVar;

{$R *.dfm}

procedure TfrmSend.FormShow(Sender: TObject);
begin
  sgCards.Cells[0,0]:='工号';
  sgCards.Cells[1,0]:='姓名';
  sgCards.Cells[2,0]:='卡号';
  sgCards.Cells[4,0]:='IC卡号';
end;

procedure TfrmSend.btnSearchClick(Sender: TObject);
var
  InputVar:PDlgInput;
begin
  frmPick_Item_Single:=TfrmPick_Item_Single.Create(nil);
  try
    InputVar.Fields := 'employeecode/工号/180,chinesename/姓名/250';
    InputVar.Sqlstr := 'select rkey,employeecode,chinesename from employeemsg where status=1 ORDER by employeecode';
    Inputvar.KeyField:='';

    InputVar.AdoConn := dm.ADOConnection1 ;
    frmPick_Item_Single.InitForm_New(InputVar);
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      edtNO.Text:= frmPick_Item_Single.adsPick.fieldbyname('employeecode').AsString;
      edtName.Text:= frmPick_Item_Single.adsPick.fieldbyname('chinesename').AsString;
      edtNO.Tag:=frmPick_Item_Single.adsPick.fieldbyname('rKey').AsInteger;
    end;
  finally
    frmPick_Item_Single.Free;
  end;
end;

procedure TfrmSend.edtNOExit(Sender: TObject);
begin
  if Trim(edtNO.Text)<>'' then
  begin
    with DM.adoTmp do
    begin
      Close;
      SQL.Clear;
      SQL.Text:='select rkey,chinesename from employeemsg where status=1 and employeecode='+ QuotedStr(Trim(edtNO.Text));
      Open;
      if not IsEmpty then
      begin
        edtNO.Tag:= FieldByName('rkey').AsInteger;
        edtName.Text:= FieldByName('chinesename').asstring;
      end
      else
      begin
        ShowMessage('工号不存在或已经离职');
        edtNO.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure TfrmSend.btnAddClick(Sender: TObject);
var
  i:Integer;
begin
  if (Trim(edtNO.Text)<>'') and (Trim(edtCardNO.Text)<>'') and  (ComboBox1.ItemIndex<>-1 ) then
  begin
    with sgCards do
    begin
      for i:=1 to sgCards.RowCount-2 do
      begin
        if (Cells[0,i]=Trim(edtNO.Text)) and (Trim(Cells[2,i])<>'0') and (ComboBox1.ItemIndex=1) then
        begin
          ShowMessage('已经添加工号为'+ Trim(edtNO.Text)+'的员工的ID卡');
          edtNO.SetFocus;
          Exit;
        end
        else
        if (Cells[0,i]=Trim(edtNO.Text)) and (Trim(Cells[4,i])<>'0') and (ComboBox1.ItemIndex=0) then
        begin
          ShowMessage('已经添加工号为'+ Trim(edtNO.Text)+'的员工的IC卡');
          edtNO.SetFocus;
          Exit;
        end;
      end;
      for i:=1 to sgCards.RowCount-2 do
      begin
        if (Cells[2,i]=Trim(edtCardNO.Text)) and (ComboBox1.ItemIndex=1) then
        begin
          ShowMessage('已经添加卡号为'+ Trim(edtCardNO.Text)+'的卡');
          edtCardNO.SetFocus;
          Exit;
        end;
      end;
      for i:=1 to sgCards.RowCount-2 do
      begin
        if (Cells[4,i]=Trim(edtCardNO.Text)) and (ComboBox1.ItemIndex=0) then
        begin
          ShowMessage('已经添加卡号为'+ Trim(edtCardNO.Text)+'的IC卡');
          edtCardNO.SetFocus;
          Exit;
        end;
      end;

      if ComboBox1.ItemIndex = 1 then
      with DM.adoTmp do
      begin
        Close;
        SQL.Clear;
        SQL.Text:='select status from employeecardmsg where cardno_dec='+ QuotedStr(Trim(edtCardNO.Text))+
                  ' order by oper_date desc';
        Open;
        if not IsEmpty then
        begin
          if FieldByName('status').Value<>3 then
          begin
            ShowMessage('这张卡不是正常程序退卡或已经在使用，请重新输入ID卡号');
            edtCardNO.SetFocus;
            Exit;
          end;
        end;
      end
      else
      if ComboBox1.ItemIndex = 0 then
      with DM.adoTmp do
      begin
        Close;
        SQL.Clear;
        SQL.Text:='select status from employeecardmsg where ICCardNO='+ QuotedStr(Trim(edtCardNO.Text))+
                  ' order by oper_date desc';
        Open;
        if not IsEmpty then
        begin
          if FieldByName('status').Value<>3 then
          begin
            ShowMessage('这张卡不是正常程序退卡或已经在使用，请重新输入IC卡号');
            edtCardNO.SetFocus;
            Exit;
          end;
        end;
      end;

      Cells[0,RowCount-1]:=Trim(edtNO.Text);
      Cells[1,RowCount-1]:=Trim(edtName.Text);
      if ComboBox1.ItemIndex=0 then
      begin
         Cells[4,RowCount-1]:=Trim(edtCardNO.Text);
         Cells[2,RowCount-1]:= '0';
      end
      else
      if ComboBox1.ItemIndex=1 then
      begin
        Cells[2,RowCount-1]:=Trim(edtCardNO.Text);
        Cells[4,RowCount-1]:='0';
      end;
      Cells[3,RowCount-1]:=IntToStr(edtNO.Tag);
      RowCount:=RowCount+1;
    end;
    edtNO.Text:='';
    edtName.Text:='';
    edtCardNO.Text:='';
    ComboBox1.ItemIndex := 0;
  end;
end;

procedure TfrmSend.nDeleteClick(Sender: TObject);
var
  i:Integer;
begin
  if (sgCards.Row<>sgCards.RowCount-1) and (sgCards.RowCount>2) then
  begin
    for i:=sgCards.Row to sgCards.RowCount-2 do
    begin
      sgCards.Rows[i]:=sgCards.Rows[i+1];
    end;
    sgCards.RowCount:=sgCards.RowCount-1;
  end;
end;

procedure TfrmSend.btnSaveClick(Sender: TObject);
var
  i:Integer;
begin
  if sgCards.RowCount=2 then
  begin
    ShowMessage('请先给员工发卡');
    exit;
  end;
  for i:=1 to sgCards.RowCount-2 do
  begin
    if sgCards.Cells[2,i]<>'0' then
    with DM.adoTmp do
    begin
      Close;
      SQL.Clear;
      SQL.Text:='select rkey from employeecardmsg where status=1 and employeeid = '+ sgCards.Cells[3,i]
      + ' and cardno_dec <> ''0'' and cardno_dec is not null' ;
      Open;
      if not IsEmpty then
      begin
        ShowMessage('工号'+ QuotedStr(sgCards.Cells[0,i])+ '的员工已经存在有效的ID卡，不能再发');
        Exit;
      end;
    end;
    if sgCards.Cells[4,i]<>'0' then
    with DM.adoTmp do
    begin
      Close;
      SQL.Clear;
      SQL.Text:='select rkey from employeecardmsg where status=1 and employeeid = '+ sgCards.Cells[3,i]
      + ' and ICcardno <> ''0'' and ICcardno is not null' ;
      Open;
      if not IsEmpty then
      begin
        ShowMessage('工号'+ QuotedStr(sgCards.Cells[0,i])+ '的员工已经存在有效的IC卡，不能再发');
        Exit;
      end;
    end;
    with DM.adoTmp do
    begin
      Close;
      SQL.Clear;
      SQL.Text:='select rkey from employeecardmsg where status=1 and ICcardno='+ QuotedStr(sgCards.Cells[4,i]);
      Open;
      if not IsEmpty then
      begin
        ShowMessage('卡号'+ QuotedStr(sgCards.Cells[4,i])+ '已经被人使用，不能再发');
        Exit;
      end;
    end;
  end;
  try
    DM.ADOConnection1.BeginTrans;
    with DM.adoTmp do
    begin
      Close;
      SQL.Clear;

      for i := 1 to sgCards.RowCount-2 do
      begin
        SQL.Text := SQL.Text + ' insert into employeecardmsg(cardno_dec,employeeid, begin_time, status, oper_person, oper_date,ICCardno) '+
                ' values('+ QuotedStr(sgCards.Cells[2,i])+','+ sgCards.Cells[3,i]+','+
                QuotedStr(FormatDateTime('yyyy-MM-dd HH:MM:SS',getsystem_date(DM.adoTime,0)))+',1,'+
                 user_ptr+','+QuotedStr(FormatDateTime('yyyy-MM-dd HH:MM:SS',getsystem_date(DM.adoTime,0)))+','+QuotedStr(sgCards.Cells[4,i])+')'+#13;
        if sgCards.Cells[2,i]<>'0' then
        begin
          DM.adoTime.Close;
          DM.adoTime.SQL.Clear;
          DM.adoTime.SQL.Text := 'update employeemsg set cardno='+ QuotedStr(Trim(sgCards.Cells[2,i]))+ ' where rkey='+ Trim(sgCards.Cells[3,i]);
          DM.adoTime.ExecSQL;
        end;
        if sgCards.Cells[4,i]<>'0' then
        begin
          DM.adoTime.Close;
          DM.adoTime.SQL.Clear;
          DM.adoTime.SQL.Text := 'update employeemsg set ICCardno='+ QuotedStr(Trim(sgCards.Cells[4,i]))+ ' where rkey='+ Trim(sgCards.Cells[3,i]);
          DM.adoTime.ExecSQL;
        end;
      end ;

  //    ShowMessage(SQL.Text);
      ExecSQL;
    end;


    DM.ADOConnection1.CommitTrans;

   for i := 1 to sgCards.RowCount-2 do
   if Trim(FIP) <> '' then
   if sgCards.Cells[4,i]<>'0' then
   begin

     //插入门闸系统
     DM.adoinsert.Close;
     DM.adoInsert.SQL.Text :=  ' insert into ['+ FIP +'].[security_db].[dbo].[third_base_middata](obj_type,data_content,op_type)'
       + ' select ''PersPerson'',''{"pin":"'' + employeemsg.employeecode + ''","name":"''+ employeemsg.chinesename '
       + '	+ ''","cardNo":"'' + '+quotedstr(sgCards.Cells[4,i])+ ''
       + '	+ ''","deptCode":"'' + convert(varchar(20),datadepartment.departmentcode) '
       + '	+ ''","gender":"''+ case employeemsg.sex when 1 then ''M"}'' when 0 then ''F"}'' end as gender ,''addPersPerson'''
       + ' from employeemsg '
       + ' inner join datadepartment on employeemsg.departmentid=datadepartment.rkey'
       + ' where employeemsg.rkey = ' + Trim(sgCards.Cells[3,i]);
     DM.adoinsert.ExecSQL;
   end;


    ModalResult:=mrYes;
  except
    on E: Exception do
    begin
      DM.ADOConnection1.RollbackTrans;
      messagedlg(E.Message,mterror,[mbcancel],0);
    end;
  end;
end;

procedure TfrmSend.edtCardNOKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then btnAddClick(nil);
  if not (Key in ['0'..'9',#8]) then Abort;
end;

procedure TfrmSend.edtNOKeyPress(Sender: TObject; var Key: Char);
begin
  if Char(Key)=#13 then edtCardNO.SetFocus;
end;

procedure TfrmSend.EdtIcCardNOKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9',#8]) then Abort;
end;

end.
