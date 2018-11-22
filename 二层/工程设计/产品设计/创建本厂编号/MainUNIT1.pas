unit MainUNIT1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, Menus, DB, ADODB,DateUtils;

type
  TMainForm1 = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    Edit1: TEdit;
    Label1: TLabel;
    DBGrid1: TDBGrid;
    PopupMenu2: TPopupMenu;
    DataSource1: TDataSource;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N61: TMenuItem;
    N6: TMenuItem;
    N2: TMenuItem;
    N5: TMenuItem;
    RadioGroup1: TRadioGroup;
    N7: TMenuItem;
    N8: TMenuItem;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure Edit1Change(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
                                    DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure BitBtn4Click(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
                             Shift: TShiftState);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
  private
    { Private declarations }
    PreColumn: TColumn;
    field_name:string;
    //user_ptrCaption,vprevCaption,db_ptrCaption :string;

    OldGridWnd : TWndMethod;
    ADOQuery1sql :string;

    procedure NewGridWnd (var Message : TMessage);
    procedure item_click(sender:TObject);
  public
    { Public declarations }
  end;

var
  MainForm1: TMainForm1;

implementation

USES
   common , DmUnit1 ,IF_Unit1 ,AddEditUnit1;


{$R *.dfm}

function GetServerRegion: string;
  function GetServerIP: string;
  var
    I: Integer;
    tmpS: string;
  begin
    tmpS := DM.ADOConnection1.ConnectionString;
    for I := pos('Data Source=',DM.ADOConnection1.ConnectionString) to Length(DM.ADOConnection1.ConnectionString) do
    begin
      if DM.ADOConnection1.ConnectionString[I] = ';' then Break;
      tmpS := tmpS + DM.ADOConnection1.ConnectionString[I];
      if DM.ADOConnection1.ConnectionString[I] = '=' then tmpS := '';
    end;
    Result := tmpS;
  end;
var
  LServrIP: string;
  PosIndex: Integer;
  I: Integer;
  IPSec2: string;
begin
  LServrIP := GetServerIP;
  PosIndex := 0;
  for I := 1 to Length(LServrIP) do
  begin
    if LServrIP[I] = '.' then
    begin
      Inc(PosIndex);
      Continue;
    end;
    if PosIndex = 1 then
    begin
      IPSec2 := IPSec2 + LServrIP[I];
    end;
  end;
  case StrToIntdef(IPSec2,-1) of
    16:
    begin
      Result := '深圳';
    end;
    17:
    begin
      Result := '梅州';
    end;
    18:
    begin
      Result := '东莞';
    end;
  else
    Result := '未知'
  end;
end;

procedure TMainForm1.FormCreate(Sender: TObject);
begin

  if not App_Init(dm.ADOConnection1) then
  begin
   ShowMsg('程序起动失败请联系管理员',1);
   application.Terminate;
  end;
  Caption := application.Title;

//  if GetServerRegion = '深圳' then
//  begin
//    ShowMessage('旧版本创建本厂编号已经停用，请使用新版系统，请联系ERP，谢谢');
//    application.Terminate;
//  end;

//  user_ptr:='4';
//  vprev:='4';
//  dm.ADOConnection1.Open;

  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd';
  OldGridWnd := DBGrid1.WindowProc;
  DBGrid1.WindowProc := NewGridWnd;
end;

procedure TMainForm1.BitBtn1Click(Sender: TObject);
begin
  CLOSE;
end;

procedure TMainForm1.BitBtn2Click(Sender: TObject);
begin
  IF DBGrid1.DataSource.DataSet.Active THEN
      IF DBGrid1.DataSource.DataSet.RecordCount > 0 THEN
          Export_dbGrid_to_Excel(DBGrid1,'产品型号') ;
end;

procedure TMainForm1.BitBtn5Click(Sender: TObject);
begin
  popupmenu2.Popup(mouse.CursorPos.x,mouse.CursorPos.y);
end;

procedure TMainForm1.BitBtn3Click(Sender: TObject);
var
  i:integer;
begin
  i := -1 ;
  IF DBGrid1.DataSource.DataSet.Active THEN
    begin
      if not DBGrid1.DataSource.DataSet.FieldByName('rkey').IsNull then
        i := DBGrid1.DataSource.DataSet.FieldValues['rkey'] ;
      DBGrid1.DataSource.DataSet.Close ;
    end;
  DBGrid1.DataSource.DataSet.Open ;
  dm.ADOQuery1.Sort:=PreColumn.FieldName;
  if i <> -1 then DBGrid1.DataSource.DataSet.Locate('rkey',i,[]); 
end;


procedure TMainForm1.NewGridWnd(var Message: TMessage);
var
  IsNeg : Boolean;
begin
  if Message.Msg = WM_MOUSEWHEEL then
      begin
          IsNeg := Short(Message.WParamHi) < 0;
          if IsNeg then
              DBGrid1.DataSource.DataSet.MoveBy(1)
          else
              DBGrid1.DataSource.DataSet.MoveBy(-1)
      end
  else
      OldGridWnd(Message);
end;

procedure TMainForm1.FormShow(Sender: TObject);
var
  i:byte;
  item:TMenuItem;
begin

  if not dm.ADOConnection1.Connected then
   application.Terminate ;

  field_name := DBGrid1.Columns[0].FieldName ;
  PreColumn := DBGrid1.Columns[0] ;

  for i:=1 to DBGrid1.Columns.Count do
  begin
    item := TmenuItem.Create(self) ;
    item.Caption := dbgrid1.Columns[i-1].Title.Caption ;
    //if dbgrid1.Columns[i-1].Visible then
        item.Checked := dbgrid1.Columns[i-1].Visible ;

    item.OnClick := item_click ;
    self.PopupMenu2.Items.Add(item) ;
  end;

  ADOQuery1sql := dm.ADOQuery1.SQL.Text ;

  dm.ADOQuery1.Parameters.ParamValues['From_DATE'] := getsystem_date(dm.TemADOQuery1,1);
  dm.ADOQuery1.Parameters.ParamValues['TO_DATE'] := getsystem_date(dm.TemADOQuery1,1)+1;
  dm.ADOQuery1.Prepared ;
  dm.ADOQuery1.Open ;
  dm.ADOQuery1.Sort:=PreColumn.FieldName;
end;

procedure TMainForm1.item_click(sender: TObject);
var
  i:byte;
begin
  (sender as tmenuItem).Checked := not ((sender as tmenuItem).Checked);
  if (sender as tmenuItem).Checked then
      begin
          for i := 0 to dbgrid1.FieldCount-1 do
              if dbgrid1.Columns[i].Title.Caption=(sender as tmenuItem).Caption then
                  begin
                      dbgrid1.Columns[i].Visible:=true;
                      break;
                  end;
      end
  else
      begin
          for i := 0 to dbgrid1.FieldCount-1 do
              if dbgrid1.Columns[i].Title.Caption = (sender as tmenuItem).Caption then
                  begin
                      dbgrid1.Columns[i].Visible := false;
                      break;
                  end;
      end;
end;

procedure TMainForm1.DBGrid1TitleClick(Column: TColumn);
begin
  IF dbgrid1.DataSource.DataSet.Active THEN
      begin
       // if field_name<>column.FieldName then
       if Column.Field.DataType in [ftString,ftWideString,ftmemo] then
        if PreColumn.FieldName<> column.FieldName then
          begin
              field_name := column.FieldName;
              label1.Caption := column.Title.Caption;
              edit1.Text := '' ;
              edit1.SetFocus;
              PreColumn.Title.Color := clBtnFace;
              Column.Title.Color := clred;
              PreColumn := column;
              if Column.FieldName<>'memotext' then
              dm.ADOQuery1.Sort:=PreColumn.FieldName;
          end;
      //  else
        // if field_name = column.FieldName then
       {   begin
              edit1.SetFocus;
              PreColumn.Title.Color := clBtnFace;
              Column.Title.Color := clred;
              PreColumn := column;
              dm.ADOQuery1.Sort:=PreColumn.FieldName;
          end;
        }  
    end
  else
      showmessage('没有打开数据，请按: 查询 ');
end;

procedure TMainForm1.Edit1Change(Sender: TObject);
var
  s:string;
begin

  IF dbgrid1.DataSource.DataSet.Active  THEN
      begin
          //dbgrid1.DataSource.DataSet.Filter := '';
          DM.ADOQuery1.Filter := '';
          s:= '';
          if RadioGroup1.ItemIndex <> 7 then
               begin
                   s := 'TSTATUS = ' + inttostr(RadioGroup1.ItemIndex);
               end;
          if trim(Edit1.text) <> '' then
              begin
                  if dm.ADOQuery1.Fields.FieldByName(field_name).DataType  in [ftString,ftWideString,ftmemo]  then
                      begin
                          if s = '' then
                            s := field_name+' like ''%'+trim(edit1.text)+'%'''
                          else
                            s :=s +' and '+ field_name+' like ''%'+trim(edit1.text)+'%''' ;
                      end
                  else if dm.ADOQuery1.Fields.FieldByName(field_name).DataType  in [ftSmallint, ftInteger, ftWord]  then
                      begin
                          try
                            strtoint(edit1.Text);
                            if s = '' then
                              s := field_name+' = '+trim(edit1.text)
                            else
                              s :=s + ' and ' + field_name+' = '+trim(edit1.text) ;
                          except
                              showmessage('输入的内容不相符，只能输入数字');
                          end;
                      end
                  else if dm.ADOQuery1.Fields.FieldByName(field_name).DataType  in [ftDate,ftTime, ftDateTime] then
                      begin
                          try
                              strtodatetime(edit1.Text);
                              if s = '' then
                                  s := field_name+' = '''+ trim(edit1.text) +''''
                              else
                                  s := s +' and '+ field_name+' = '''+ trim(edit1.text) +'''';
                          except
                              //showmessage('输入的内容不相符，只能输入日期') ;
                          end;
                      end;
              end ;

          DM.ADOQuery1.Filter := S;

      end ;
end;

procedure TMainForm1.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if not (gdFixed in State) then
       if DBGrid1.DataSource.DataSet.Active then
           begin
               if DBGrid1.DataSource.DataSet.FieldValues['TSTATUS'] = 6 then
                   begin
                        DBGrid1.Canvas.Font.Color :=  clRed ;
                   end
               else
                   begin
                        DBGrid1.Canvas.Font.Color := clBlack ;
                   end;
               if DBGrid1.DataSource.DataSet.RecNo  mod 2 = 0 then
                   begin
                       DBGrid1.Canvas.Brush.Color := clwhite;
                       DBGrid1.Canvas.FillRect(rect);  {}
                   end
               else
                   begin
                       DBGrid1.Canvas.Brush.Color := RGB(244,241,255);
                       DBGrid1.Canvas.FillRect(rect);{}
                   end ;
               if ((State = [gdSelected]) or (State=[gdSelected,gdFocused])) then
                   begin
                       DBGrid1.Canvas.Brush.Color :=  RGB(0,224,224);
                       DBGrid1.Canvas.FillRect(rect);
                   end; {}
                DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
           end;
end;

procedure TMainForm1.BitBtn4Click(Sender: TObject);
var
  i:integer;
begin
  If_Form1:= TIf_Form1.Create(application) ;
  try
    If_Form1.DateTimePicker1.Date := dm.ADOQuery1.Parameters.ParamValues['From_DATE'] ;
    If_Form1.DateTimePicker2.Date := dm.ADOQuery1.Parameters.ParamValues['TO_DATE']-1 ;

    if If_Form1.ShowModal=mrok then
     begin
        dm.ADOQuery1.Close ;
        dm.ADOQuery1.SQL.Clear ;
        dm.ADOQuery1.SQL.Add(ADOQuery1SQL);
        for i := 1 to If_Form1.sgrid1.RowCount-2  do
         begin
          dm.ADOQuery1.SQL.Add(trim(If_Form1.sgrid1.Cells[2,i]));
         end;

        if If_Form1.RadioGroup2.ItemIndex <> 2 then
         dm.ADOQuery1.SQL.Add('and data0025.ttype = ' + inttostr(If_Form1.RadioGroup2.ItemIndex));

        dm.ADOQuery1.Parameters.ParamValues['From_DATE'] := If_Form1.DateTimePicker1.Date;
        dm.ADOQuery1.Parameters.ParamValues['TO_DATE'] := If_Form1.DateTimePicker2.Date+1;

        dm.ADOQuery1.Prepared ;
        dm.ADOQuery1.Open ;
        dm.ADOQuery1.Sort:=PreColumn.FieldName;
     end ;
  finally
      If_Form1.Free ;
  end;
end;

procedure TMainForm1.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (chr(key) = 'S') and (ssalt in shift) then
      showmessage((DBGrid1.DataSource.DataSet as TADOQuery).SQL.Text);
end;

procedure TMainForm1.PopupMenu1Popup(Sender: TObject);
begin
  if DBGrid1.DataSource.DataSet.Active then
      if DBGrid1.DataSource.DataSet.IsEmpty then
        begin
          n1.Enabled := false;     //新增
          n3.Enabled := false;     //编辑
          n4.Enabled := false;     //检查
          n6.Enabled := false;     //删除
          n2.Enabled := false;     //提交
          n8.Enabled := false ;     //编辑型号
          if (vprev = '2') or (vprev = '4') then
            begin
             n1.Enabled := true ;
            end ;
        end
      else
       begin
        n1.Enabled := false;
        n3.Enabled := false;
        n4.Enabled := true;     //检查
        n6.Enabled := false;
        n2.Enabled := false ;
        if (vprev = '2') or (vprev = '4') then
          begin
            n1.Enabled := true ;
            n8.Enabled := true;
            //N3.Enabled := True;
            if DBGrid1.DataSource.DataSet.FieldValues['TSTATUS'] = 6 then
             begin
              n3.Enabled := true ;
              n6.Enabled := true ;
              n2.Enabled := true ;
             end ;
          end ;
       end;

       //n3.Enabled := true;
end;

procedure TMainForm1.N1Click(Sender: TObject);
begin
  if user_ptr='' then exit;
  AddEditForm1:= TAddEditForm1.Create(application) ;
  try
  AddEditForm1.Caption := '新增' ;
  AddEditForm1.MyEditMode := 0 ;//新增
  AddEditForm1.Myuser_ptrCaption := strtoint(user_ptr) ; //用户指针
  dm.ADOQuery2.Close ;
  dm.ADOQuery2.Parameters.ParamValues['RKEY25'] := null ;
  dm.ADOQuery2.Prepared ;
  dm.ADOQuery2.Open ;
  if AddEditForm1.ShowModal=mrok then
    begin
     if DBGrid1.DataSource.DataSet.Active then
          DBGrid1.DataSource.DataSet.Close ;
     DBGrid1.DataSource.DataSet.DisableControls ;
     DBGrid1.DataSource.DataSet.Open ;
     DBGrid1.DataSource.DataSet.EnableControls ;
     dm.ADOQuery1.Locate('RKEY',DM.ADOQuery2RKEY.Value,[]);
    end ;
  finally
      AddEditForm1.Free ;
  end;
end;

procedure TMainForm1.N4Click(Sender: TObject);
begin
  if user_ptr='' then exit ;
  AddEditForm1:= TAddEditForm1.Create(application) ;
  try
    AddEditForm1.Caption := '检查' ;
    AddEditForm1.MyEditMode := 2 ;//检查

    AddEditForm1.Edit1.Text := dm.ADOQuery1CUST_CODE.Value ;
    AddEditForm1.Label4.Caption := dm.ADOQuery1CUSTOMER_NAME.Value ;
    //AddEditForm1.Edit1.Color := clSkyBlue;


    AddEditForm1.Edit5.Text := dm.ADOQuery1PROD_CODE.Value ;
    AddEditForm1.Label5.Caption := dm.ADOQuery1PRODUCT_NAME.Value ;
    //AddEditForm1.Edit5.Color := clSkyBlue;

    AddEditForm1.Myrkey0010 := dm.ADOQuery1CUSTOMER_PTR.Value ;
    AddEditForm1.Myrkey0008 := dm.ADOQuery1PROD_CODE_PTR.Value ;

    //AddEditForm1.Panel2.Enabled := false;
    //AddEditForm1.Memo1.Enabled := true ;
    AddEditForm1.RadioGroup1.Enabled := false ;
    AddEditForm1.RadioGroup2.Enabled := false ;
    AddEditForm1.RadioButton1.Enabled := false ;
    AddEditForm1.current_ck.Enabled := false ;
    AddEditForm1.CheckBox1.Enabled := false ;
    AddEditForm1.CheckBox2.Enabled := false ;
    AddEditForm1.CheckBox3.Enabled := false;
    AddEditForm1.chkRoSH.Enabled:= False;
    AddEditForm1.cbbgrade.Enabled := False;

    AddEditForm1.BitBtn3.Enabled := false ;
    AddEditForm1.BitBtn5.Enabled := false ;
    AddEditForm1.BitBtn9.Enabled := false ;
    AddEditForm1.Edit18.Enabled:=false;
    AddEditForm1.BitBtn4.Enabled:=false;

    AddEditForm1.Edit1.ReadOnly := true ;
    AddEditForm1.Edit1.Color := clSkyBlue;
    AddEditForm1.Edit23.ReadOnly := true ;
    AddEditForm1.Edit23.Color := clSkyBlue;
    AddEditForm1.Edit5.ReadOnly := true ;
    AddEditForm1.Edit5.Color := clSkyBlue;
    AddEditForm1.Edit2.ReadOnly := true ;
    AddEditForm1.Edit2.Color := clSkyBlue;
    AddEditForm1.Edit3.ReadOnly := true ;
    AddEditForm1.Edit3.Color := clSkyBlue;
    AddEditForm1.Edit6.ReadOnly := true ;
    AddEditForm1.Edit6.Color := clSkyBlue;
    AddEditForm1.Edit12.ReadOnly := true ;
    AddEditForm1.Edit12.Color := clSkyBlue;
    AddEditForm1.Edit10.ReadOnly := true ;
    AddEditForm1.Edit10.Color := clSkyBlue;
    AddEditForm1.Edit7.ReadOnly := true ;
    AddEditForm1.Edit7.Color := clSkyBlue;
    AddEditForm1.Edit14.ReadOnly := true ;
    AddEditForm1.Edit14.Color := clSkyBlue;
    AddEditForm1.Edit16.ReadOnly := true ;
    AddEditForm1.Edit16.Color := clSkyBlue;
    AddEditForm1.Edit15.ReadOnly := true ;
    AddEditForm1.Edit15.Color := clSkyBlue;
    AddEditForm1.Edit8.ReadOnly := true ;
    AddEditForm1.Edit8.Color := clSkyBlue;
    AddEditForm1.Edit17.ReadOnly := true ;
    AddEditForm1.Edit17.Color := clSkyBlue;

    AddEditForm1.Memo1.ReadOnly := true ;
    AddEditForm1.Memo1.Color := clSkyBlue;
    AddEditForm1.Memo4.ReadOnly := true ;
    AddEditForm1.Memo4.Color := clSkyBlue;
    AddEditForm1.Memo5.ReadOnly := true ;
    AddEditForm1.Memo5.Color := clSkyBlue;

    AddEditForm1.DBGrid1.ReadOnly  := true ;
//    AddEditForm1.DBComboBox1.Enabled:=false;
    AddEditForm1.BitBtn1.Enabled := false ;

    

    AddEditForm1.Myuser_ptrCaption := strtoint(user_ptr); //用户指针
    dm.ADOQuery2.Close ;
    dm.ADOQuery2.Parameters.ParamValues['RKEY25'] := dm.ADOQuery1rkey.Value ;
    dm.ADOQuery2.Prepared ;
    dm.ADOQuery2.Open ;

    if AddEditForm1.ShowModal=mrok then
        begin
             if DBGrid1.DataSource.DataSet.Active then
                 DBGrid1.DataSource.DataSet.Close ;
             DBGrid1.DataSource.DataSet.DisableControls ;
             DBGrid1.DataSource.DataSet.Open ;
             DBGrid1.DataSource.DataSet.EnableControls ;
        end ;
  finally
      AddEditForm1.Free ;
  end;
end;

procedure TMainForm1.N3Click(Sender: TObject);
var
  bk:tbookmark;
begin
//  if dm.ADOQuery1TSTATUS.Value  <> 6 then
//   begin
//    messagedlg('已经提交,不允许编辑！',mtinformation,[mbok],0) ;
//    exit ;
//   end;
  if user_ptr='' then exit ;

  AddEditForm1:= TAddEditForm1.Create(application) ;
  try
      AddEditForm1.Caption := '编辑' ;
      AddEditForm1.MyEditMode := 1 ;//编辑
      AddEditForm1.Myuser_ptrCaption := strtoint(user_ptr) ; //用户指针

      AddEditForm1.Edit1.Text := dm.ADOQuery1CUST_CODE.Value ;
      AddEditForm1.Label4.Caption := dm.ADOQuery1CUSTOMER_NAME.Value ;

      AddEditForm1.Edit5.Text := dm.ADOQuery1PROD_CODE.Value ;
      AddEditForm1.Label5.Caption := dm.ADOQuery1PRODUCT_NAME.Value ;

      AddEditForm1.Myrkey0010 := dm.ADOQuery1CUSTOMER_PTR.Value ;
      AddEditForm1.Myrkey0008 := dm.ADOQuery1PROD_CODE_PTR.Value ;

      AddEditForm1.BitBtn1.Enabled := false ;
      AddEditForm1.RadioGroup1.Enabled:=false;
      AddEditForm1.Edit18.Enabled:=false;
      AddEditForm1.BitBtn4.Enabled:=false;
      dm.ADOQuery2.Close ;
      dm.ADOQuery2.Parameters.ParamValues['RKEY25'] := dm.ADOQuery1rkey.Value ;
      dm.ADOQuery2.Prepared ;
      dm.ADOQuery2.Open ;

      //本段2013-07-25增
      dm.ADOQ0318.Close ;
      dm.ADOQ0318.Parameters.ParamValues['RKEY25'] := dm.ADOQuery1rkey.Value ;
      dm.ADOQ0318.Prepared ;
      dm.ADOQ0318.Open ;

      if AddEditForm1.ShowModal=mrok then
        begin
          try
          bk := dm.ADOQuery1.GetBookmark ;
          if DBGrid1.DataSource.DataSet.Active then
           DBGrid1.DataSource.DataSet.Close ;
          DBGrid1.DataSource.DataSet.DisableControls ;
          DBGrid1.DataSource.DataSet.Open ;
          DBGrid1.DataSource.DataSet.EnableControls ;
          if bk <> nil then
          begin
          dm.ADOQuery1.GotoBookmark(bk);
          dm.ADOQuery1.FreeBookmark(bk);
          end;
          except
          end;
        end ;
  finally
      AddEditForm1.Free ;
  end;
end;

procedure TMainForm1.N6Click(Sender: TObject);
begin  //删除
  if DBGrid1.DataSource.DataSet.Active then
      if not DBGrid1.DataSource.DataSet.IsEmpty  then
          begin
              if dm.ADOQuery1TSTATUS.Value = 6 then
                  begin
                      //if dm.ADOQuery1LAST_MODIFIED_DATE.IsNull then
                          begin
                              if Messagedlg('确认要删除吗？',mtConfirmation,[mbYes,mbNo],0) = mrYes then
                                  begin
                                      if dm.TemADOQuery1.Active then dm.TemADOQuery1.close;
                                      dm.TemADOQuery1.SQL.Clear ;
                                      dm.TemADOQuery1.SQL.Add('SELECT CUSTOMER_PTR FROM Data0060 WHERE CUSTOMER_PTR = ' + dm.ADOQuery1rkey.AsString );
                                      dm.TemADOQuery1.Open;
                                      if not dm.TemADOQuery1.IsEmpty then
                                          begin
                                              dm.TemADOQuery1.Close ;
                                              showmessage('此本产编号已有销售订单，不能删除！！');
                                              exit;
                                          end;
                                      dm.TemADOQuery1.Close ;

                                      if dm.ADOQuery2.Active then dm.ADOQuery2.Close ;
                                      dm.ADOQuery2.Parameters.ParamValues['RKEY25'] := dm.ADOQuery1rkey.Value ;
                                      dm.ADOQuery2.Prepared ;
                                      dm.ADOQuery2.Open ;
                                      if dm.ADOQuery2TSTATUS.Value = 6 then
                                          begin
                                              dm.ADOConnection1.BeginTrans ;
                                              try
                                                  if dm.TemADOQuery1.Active then dm.TemADOQuery1.close;
                                                  dm.TemADOQuery1.SQL.Clear ;
                                                  dm.TemADOQuery1.SQL.Add('delete data0089 where cust_part_ptr = ' + dm.ADOQuery1rkey.AsString );
                                                  dm.TemADOQuery1.ExecSQL ;

                                                  dm.ADOQuery2.Delete;
                                                  dm.ADOQuery2.UpdateBatch();
                                                  dm.ADOConnection1.CommitTrans ;
                                              except
                                                  //dm.ADOConnection1.RollbackTrans ;
                                                  on e :exception do
                                                      begin
                                                          DM.ADOConnection1.RollbackTrans ;
                                                          showmessage(e.Message);
                                                          exit;
                                                      end;
                                              end;
                                              if DBGrid1.DataSource.DataSet.Active then
                                                  DBGrid1.DataSource.DataSet.Close ;
                                              DBGrid1.DataSource.DataSet.DisableControls ;
                                              DBGrid1.DataSource.DataSet.Open ;
                                              DBGrid1.DataSource.DataSet.EnableControls ;

                                          end
                                      else
                                          begin
                                              showmessage('不能删除，此记录已提交了!!!你的记录集要更新，请按 刷新');
                                          end;
                                      dm.ADOQuery2.Close ;

                                  end;

                          end ;
                      //else
                      //    showmessage('工程人员已有修改不能删除');
                  end ;
          end;
end;

procedure TMainForm1.N2Click(Sender: TObject);
begin
  if DBGrid1.DataSource.DataSet.Active then
    if not DBGrid1.DataSource.DataSet.IsEmpty  then
      begin
        if (dm.ADOQuery1TSTATUS.Value = 6) and (dm.ADOQuery1ANCESTOR_PTR.Value=0) then
          begin
            if dm.ADOQuery2.Active then dm.ADOQuery2.Close ;
            dm.ADOQuery2.Parameters.ParamValues['RKEY25'] := dm.ADOQuery1rkey.Value ;
            dm.ADOQuery2.Prepared ;
            dm.ADOQuery2.Open ;
            if dm.ADOQuery2TSTATUS.Value = 6 then
              begin
                dm.ADOQuery2.Edit ;
                dm.ADOQuery2TSTATUS.Value := 0 ;
                dm.ADOQuery2.UpdateBatch();
                dm.ADOQuery1.DisableControls ;
                dm.ADOQuery1.Close ;
                dm.ADOQuery1.Open ;
                dm.ADOQuery1.Locate('Rkey',dm.ADOQuery2rkey.Value,[]);
                dm.ADOQuery1.EnableControls ;
              end
            else
              begin
                showmessage('此记录已提交!!!! 你的记录要刷新，请按 ''刷新''');
              end ;
            dm.ADOQuery2.Close ;
          end
        else
         showmsg('该本厂编号通过ECN升级创建，需要通过ECN结案提交！操作不成功',1);
      end;
end;

procedure TMainForm1.RadioGroup1Click(Sender: TObject);
begin
   Edit1Change(edit1);

end;

procedure TMainForm1.N8Click(Sender: TObject);
var
  bk:tbookmark;
begin

  AddEditForm1:= TAddEditForm1.Create(application) ;
  try
      AddEditForm1.cbbgrade.Enabled := False;
      AddEditForm1.Caption := '编辑' ;
      AddEditForm1.MyEditMode := 3 ;//编辑
      AddEditForm1.Myuser_ptrCaption := strtoint(user_ptr) ; //用户指针

      AddEditForm1.Edit1.Text := dm.ADOQuery1CUST_CODE.Value ;
      AddEditForm1.Label4.Caption := dm.ADOQuery1CUSTOMER_NAME.Value ;

      AddEditForm1.Edit5.Text := dm.ADOQuery1PROD_CODE.Value ;
      AddEditForm1.Label5.Caption := dm.ADOQuery1PRODUCT_NAME.Value ;

      AddEditForm1.Myrkey0010 := dm.ADOQuery1CUSTOMER_PTR.Value ;
      AddEditForm1.Myrkey0008 := dm.ADOQuery1PROD_CODE_PTR.Value ;

      AddEditForm1.BitBtn1.Enabled := false ;

      if dm.ADOQuery2.Active then dm.ADOQuery2.Close ;
      dm.ADOQuery2.Parameters.ParamValues['RKEY25'] := dm.ADOQuery1rkey.Value ;
      dm.ADOQuery2.Prepared ;
      dm.ADOQuery2.Open ;

      dm.ADOQ0318.Close ;
      dm.ADOQ0318.Parameters.ParamValues['RKEY25'] := dm.ADOQuery1rkey.Value ;
      dm.ADOQ0318.Prepared ;
      dm.ADOQ0318.Open ;

      if AddEditForm1.ShowModal=mrok then
          begin
              bk := dm.ADOQuery1.GetBookmark ;
              if DBGrid1.DataSource.DataSet.Active then
                  DBGrid1.DataSource.DataSet.Close ;
              DBGrid1.DataSource.DataSet.DisableControls ;
              DBGrid1.DataSource.DataSet.Open ;
              DBGrid1.DataSource.DataSet.EnableControls ;
              dm.ADOQuery1.GotoBookmark(bk);
              dm.ADOQuery1.FreeBookmark(bk);
          end ;
  finally
      AddEditForm1.Free ;
  end;
end;

end.
