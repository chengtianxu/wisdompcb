unit EditFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGridEh, ExtCtrls, StdCtrls, Buttons, ComCtrls, Damo, DB,
  ADODB, Provider, DBClient,common, Menus,MainFrm,DateUtils;

type
  TFrmEdit = class(TForm)
    Label2: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    RadioGroup1: TRadioGroup;
    Edit2: TEdit;
    Memo1: TMemo;
    ComboBox1: TComboBox;
    Label3: TLabel;
    DateTimePicker1: TDateTimePicker;
    Label7: TLabel;
    dbgrdh1: TDBGridEh;
    qry1: TADOQuery;
    ds1: TDataSource;
    dse1: TADODataSet;
    dse1IsSelected: TBooleanField;
    dse1EmployeeCode: TWideStringField;
    dse1ChineseName: TWideStringField;
    dse1DepartmentName: TWideStringField;
    pm1: TPopupMenu;
    mniN1: TMenuItem;
    mnimndel: TMenuItem;
    intgrfldqry1rkey: TIntegerField;
    qry1employeecode: TWideStringField;
    qry1ChineseName: TWideStringField;
    qry1DepartmentName: TWideStringField;
    rg_rtype: TRadioGroup;
    lbl1: TLabel;
    edtPNO: TEdit;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);

    procedure Button4Click(Sender: TObject);
    procedure dbgrdh1TitleClick(Column: TColumnEh);
    procedure dbgrdh1CheckButton(Sender: TObject; ACol: Integer;
      Column: TColumnEh; var Enabled: Boolean);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure mniN1Click(Sender: TObject);
    procedure mnimndelClick(Sender: TObject);
    procedure Edit2Change(Sender: TObject);

  private
    { Private declarations }
    PreColumn: TColumnEh;
    
    procedure FlagChange();
  public
    { Public declarations }
  end;

var
  FrmEdit: TFrmEdit;

implementation

uses SelEmpFrm;

{$R *.dfm}

//关闭
procedure TFrmEdit.BitBtn1Click(Sender: TObject);
begin
  Self.Close;
end;

//保存
procedure TFrmEdit.BitBtn2Click(Sender: TObject);
var
  i, datadetailRkey: Integer;
  flag,sFlag,SSql,employeecode: string;
  EmployeeID,employeeID2 :integer;
begin
  try
    if not qry1.Active then qry1.Open;
   { if dbgrdh1.DataSource.DataSet.RecordCount <= 0 then
    begin
      ShowMessage('对不起，请指定您要添加的员工信息！');
      Exit;
    end;    }
    if (Trim(Edit2.Text)) ='' then
    begin
      ShowMessage('对不起，绩效分值不能为空！');
      Exit;
    end;
    with DM.qrytemp do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'select * from dbo.datadetail where item=' + QuotedStr(ComboBox1.Text);
      Open;
      datadetailRkey := FieldValues['rkey'];
    end;
    if  not  DM.ADOConnection1.InTransaction  then
    DM.ADOConnection1.BeginTrans;
   { qry1.First;
    for i := 0 to DM.qry3.RecordCount - 1 do
    begin
      with DM.qrytemp do
      begin
        Close;
        SQL.Clear;
        SQL.Text := Format('insert into employee_rewards_punishment(employeeid,type,money,flag,effectdate,remark) '
          + ' values (%d, %d, %f, %d, ''%s'', ''%s'')',
          [DM.qry3.FieldByName('rkey').AsInteger, datadetailRkey, StrToFloat(Edit2.Text),
          RadioGroup1.ItemIndex, DateToStr(DateTimePicker1.Date), Memo1.Text]);
        ExecSQL;
      end;
      DM.qry3.Next;
    end;   }

   //if qry1.active=false then qry1.open;

   qry1.sort:='EmployeeCode'   ;
   qry1.first;

     while not qry1.Eof do
     begin

      //  if(qry1.FieldByName('IsSelected').AsBoolean)  then
       // begin
         sflag:='1';
        // employeeID:=qry1.FieldByName('rkey').asinteger  ;
        //employeeID2:=qry1.FieldByName('rkey').asinteger  ;
          employeecode:=qry1.FieldByName('employeecode').asstring  ;

        IF COMMON.OPENQUERY(DM.qrytemp,'SELECT  RKEY  FROM  EMPLOYEEMSG WHERE employeecode =  '''+employeecode+''' ') then
       employeeID :=  DM.qrytemp.FieldValues['rkey'];


//            ssql:= Format('select employeeid  from employee_rewards_punishment  where employeeid=%d and type=%d and effectdate=''%s''   ',
//          [employeeID, datadetailRkey,  DateToStr(DateTimePicker1.Date)]);
//        if common.OpenQuery(dm.qrytemp,ssql) then
//        begin
//          if dm.qrytemp.recordcount>0 then
//           begin
//             showmessage('员工'+(employeecode)+'当天重复录入！');
//             qry1.Filtered:=false;
//              exit;
//           end;
//        end;

         with DM.qrytemp do
          begin
            Close;
            SQL.Clear;
           
           SQL.Text := Format('insert into employee_rewards_punishment(employeeid,type,money,flag,effectdate,remark,rtype) '
          + ' values (%d, %d, %f, %d, ''%s'', ''%s'',%d )',
          [employeeID, datadetailRkey, StrToFloat(Edit2.Text),
          RadioGroup1.ItemIndex, DateToStr(DateTimePicker1.Date), Memo1.Text,rg_rtype.itemindex   ]);
          SQL.text:='insert into employee_rewards_punishment(employeeid,type,money,flag,effectdate,remark,rtype,ModiMan,ModiDate,PNO) '
                    + ' values ('+inttostr(employeeID)+', '+inttostr(datadetailRkey)+', '
                    +' '+(Edit2.Text)+', '
                    +' '+inttostr(RadioGroup1.ItemIndex)+', '''+DateToStr(DateTimePicker1.Date)+''', '
                    +'  '''+Memo1.Text+''','+inttostr(rg_rtype.itemindex)+','+(rkey73)+' ,'''+formatdatetime('yyyy-MM-dd hh:mm:ss',now)+''','''+trim(edtPNO.text)+''' )' ;
            ExecSQL;
          end;

        //end;
        qry1.next;
     end;


    DM.ADOConnection1.CommitTrans;
    ShowMessage('恭喜您，此次操作已保存成功！');
      qry1.filtered:= false;
      FrmMain.BitBtn2Click(sender); //刷新主页面数据
      Edit2.text:='';
      self.Memo1.text:='';
      qry1.Close;
      qry1.Open;


  except
    on e: Exception do
    begin
      DM.ADOConnection1.RollbackTrans;
      ShowMessage('异常错误...' + e.Message);
          Self.Close;
    end;
  end;

end;

procedure TFrmEdit.FormCreate(Sender: TObject);
begin
     

  if  not  qry1.active  then QRY1.Active:=true;
  //qry1.filtered :=false;
  //qry1.filter:=' 1=0 ' ;
  //qry1.filtered:=true;
  //dscds1.Active:=false;
  //dscds1.Active:=true;

  
  DM.qry2.Close;
  DM.qry2.Open;
  DM.qry3.Close;
  DM.qry3.SQL.Clear;
  DM.qry3.SQL.Text := 'select employeemsg.rkey,employeemsg.employeecode,employeemsg.chinesename, '
    + 'datadepartment.departmentname,datadetail.item,employeemsg.ondutytime '
    + 'from employeemsg '
    + 'inner join dbo.datadepartment on employeemsg.departmentid=datadepartment.rkey '
    + 'inner join datadetail on employeemsg.position=datadetail.rkey '
    + 'where employeemsg.rkey=-1';
  DM.qry3.Open;
end;

procedure TFrmEdit.FlagChange();
var
  i: Integer;
begin
  ComboBox1.Items.Clear;
  if RadioGroup1.ItemIndex = 0 then   //奖励类型明细  dictid=12
  begin
    with DM.qryTemp do
    begin
      Close;
      SQL.clear;
      SQL.text := 'select * from dbo.datadetail where dictid=12 order by rkey ';
      Open;
      First;
      for i := 0 to RecordCount - 1 do
      begin
        ComboBox1.Items.Add(FieldValues['item']);
        Next;
      end;
    end;
  end;
  
  if RadioGroup1.ItemIndex = 1 then   //惩罚类型明细  dictid=15
  begin
    with DM.qryTemp do
    begin
      Close;
      SQL.clear;
      SQL.text := 'select * from dbo.datadetail where dictid=15 order by rkey ';
      Open;
      First;
      for i := 0 to RecordCount - 1 do
      begin
        ComboBox1.Items.Add(FieldValues['item']);
        Next;
      end;
    end;
  end;

   if RadioGroup1.ItemIndex = 2 then   //惩罚类型明细  dictid=15
  begin
    with DM.qryTemp do
    begin
      Close;
      SQL.clear;
      SQL.text := 'select * from dbo.datadetail where dictid=26 order by rkey ';
      Open;
      First;
      for i := 0 to RecordCount - 1 do
      begin
        ComboBox1.Items.Add(FieldValues['item']);
        Next;
      end;
    end;
  end;


  ComboBox1.ItemIndex := 0;
end;

procedure TFrmEdit.FormShow(Sender: TObject);
begin
   // field_name := dbgrdh1.Columns[0].FieldName;
    //label1.Caption := dbgrdh1.Columns[0].Title.Caption;
    PreColumn := dbgrdh1.Columns[0];
     dbgrdh1.ReadOnly:=true;
  with DM.qrytemp do
  begin
    Close;
    SQL.Clear;
    SQL.Text := 'select convert(varchar(100), getdate(), 23) as sysdate';
    Open;
    DateTimePicker1.Date :=  StrToDate(FieldValues['sysdate']);
  end;
     FlagChange();
end;

procedure TFrmEdit.RadioGroup1Click(Sender: TObject);
begin
  FlagChange();
end;

//单项添加人员
procedure TFrmEdit.Button1Click(Sender: TObject);
var
  i: Integer;
  StrRkey: string;
begin
  {if (DBGridEh1.SelectedRows.Count < 1) then
  begin
    ShowMessage('功能正在完善中，目前只支持选中整行时，才能进行添加！');
    Exit;
  end;  }

  {if DBGridEh1.SelectedRows.Count > 0 then
  begin
    Screen.Cursor := crHourGlass;
    for i := 0 to DBGridEh1.SelectedRows.Count - 1 do
    begin
      DM.qry2.GotoBookmark(Pointer(DBGridEh1.SelectedRows.items[i]));
      StrRkey := StrRkey + IntToStr(DM.qry2.FieldValues['rkey']) + ',';
    end;
    StrRkey := Copy(StrRkey, 0, Length(StrRkey) - 1);
    with DM.qry3 do
    begin
      SQL.Text := SQL.Text + ' or employeemsg.rkey in (' + StrRkey + ')';
      Open;
    end;
    Screen.Cursor := crDefault;
  end;    }
end;



procedure TFrmEdit.Button4Click(Sender: TObject);
var
  i: Integer;
  StrRkey: string;
begin {
  if (DBGridEh2.SelectedRows.Count < 1) or (DM.qry3.RecordCount = 0) then
  begin
    ShowMessage('功能正在完善中，目前只支持选中整行时，才能进行取消！');
    Exit;
  end;
  Screen.Cursor := crHourGlass;
  for i := 0 to DBGridEh2.SelectedRows.Count - 1 do
  begin
    DM.qry3.GotoBookmark(Pointer(DBGridEh2.SelectedRows.items[i]));
    StrRkey := StrRkey + IntToStr(DM.qry3.FieldValues['rkey']) + ',';
  end;
  StrRkey := Copy(StrRkey, 0, Length(StrRkey) - 1);
  with DM.qry3 do
  begin
    SQL.Text := SQL.Text + ' and employeemsg.rkey not in (' + StrRkey + ')';
    Open;
  end;
  Screen.Cursor := crDefault; }
end;

procedure TFrmEdit.dbgrdh1TitleClick(Column: TColumnEh);
begin
   if dbgrdh1.DataSource.DataSet.FieldByName(Column.FieldName).FieldKind = fkCalculated then  exit ;
  if (column.Title.SortMarker =smDownEh) or (column.Title.SortMarker =smNoneEh) then
  begin
    column.Title.SortMarker:=smUpEh;
    qry1.Sort:=Column.FieldName;
  end
  else
  begin
    column.Title.SortMarker:=smDownEh;
    qry1.Sort:=Column.FieldName+' DESC';
  end;
  if dbgrdh1.DataSource.DataSet.FieldByName(Column.FieldName).DataType in [ftDate, ftTime, ftDateTime] then exit;
  {if (field_name <> column.FieldName) then
  begin
    label1.Caption := column.Title.Caption ;
    field_name := column.FieldName ;
    edt_1.SetFocus;
   // PreColumn.Title.Color := clBtnFace ;
    Column.Title.Color := clred ;
    PreColumn := column ;
    edt_1Change(edt_1);
  end
  else
    edt_1.SetFocus;    }



end;

procedure TFrmEdit.dbgrdh1CheckButton(Sender: TObject; ACol: Integer;
  Column: TColumnEh; var Enabled: Boolean);
begin
    if(acol<>0) then exit;



end;


procedure TFrmEdit.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
 {if not (key in ['0'..'9',#8])   then
  begin
   showmessage('请输入数字！');
   //edit2.SetFocus;
   exit;
   end;
         }
//   if strtoint(trim(edit2.Text))<0 then
//  begin
//   showmessage('不能为负数！');
//   edit2.SetFocus;
//   exit;
//   end;

end;

//选择员工
procedure TFrmEdit.mniN1Click(Sender: TObject);
var tempEmp,sFlag,FilterStr :string;
vrkey:integer;
begin
   FrmSelEmp:=TFrmSelEmp.create(application);


  with qry1 do
  begin
    if   qry1.recordcount>0 then
    begin
      try
        FilterStr:='';
        vrkey:= FieldByName('employeecode').Value;
        DisableControls ;
        First;
        while not Eof do      //用循环语句获取不等于当前RKEY的值。
        begin
          FilterStr:=FilterStr+'employeecode <> '+fieldByName('employeecode').AsString+' and ';
          Next;
        end;
        FilterStr:=Copy(FilterStr,0,Length(FilterStr)-4);//去掉逗号
      finally
        Locate('employeecode',vRkey,[])   ;//重新定位
        EnableControls;
      end;
    end;
  end;

    if  FrmSelEmp.qry1.IsEmpty then exit;

      FrmSelEmp.qry1.filtered:=false;
      FrmSelEmp.qry1.filter:=FilterStr;  //' isSelected=1' ;
      FrmSelEmp.qry1.filtered:=true;

 if FrmSelEmp.showmodal=mrOK  then
  begin
        dbgrdh1.ReadOnly:=false;
      FrmSelEmp.qry1.filtered:=false;
      FrmSelEmp.qry1.filter:=' isSelected=1' ;
      FrmSelEmp.qry1.filtered:=true;

        FrmSelEmp.qry1.first;
       // tempEmp:='';
       // sflag:='0';
    while  not FrmSelEmp.qry1.Eof do
    begin
         // DisableControls ;
       // tempEmp:=FrmSelEmp.qry1.fieldbyname('EmployeeCode').asstring;
       // sFlag  :=FrmSelEmp.qry1.fieldbyname('rkey').asstring;
      if(FrmSelEmp.qry1.fieldbyname('IsSelected').AsBoolean) then
      begin
      qry1.Append;
      //qry1.fieldbyname('rkey').value:=FrmSelEmp.qry1.fieldbyname('rkey').value;
      qry1.fieldbyname('EmployeeCode').value:=FrmSelEmp.qry1.fieldbyname('EmployeeCode').asstring;
      qry1.fieldbyname('ChineseName').value:=  FrmSelEmp.qry1.fieldbyname('ChineseName').asstring;
      qry1.fieldbyname('DepartmentName').value:= FrmSelEmp.qry1.fieldbyname('DepartmentName').asstring;
      qry1.post;
      end;
      FrmSelEmp.qry1.Next;
    end;
       dbgrdh1.ReadOnly:=true;
       FrmSelEmp.free;
end;
end;

procedure TFrmEdit.mnimndelClick(Sender: TObject);
 var
   i : integer;
begin
    if qry1.IsEmpty then exit
    else qry1.Delete;

   { if dbgrdh1.Selection.Rows.Count>1 then
    begin
      for i=1  to  dbgrdh1.Selection.Rows.Count    do
      begin
        qry1.

      end;


    end;    }

end;

procedure TFrmEdit.Edit2Change(Sender: TObject);
begin
//  if    trim(edit2.Text)='' then exit;
//  if strtoint(trim(edit2.Text))<0 then
//  begin
//   showmessage('不能为负数！');
//   edit2.SetFocus;
//   exit;
//   end;  
end;

end.
