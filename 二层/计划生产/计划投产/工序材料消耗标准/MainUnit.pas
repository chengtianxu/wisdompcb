unit MainUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Menus, DBGrids, StdCtrls, Buttons, ExtCtrls, Grids, ADODB,StrUtils;

type
  TFrmMain = class(TForm)
    pnl1: TPanel;
    label1: TLabel;
    btn1: TBitBtn;
    btn2: TBitBtn;
    btn3: TBitBtn;
    btn5: TBitBtn;
    edit1: TEdit;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    btn4: TBitBtn;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    DBGrid3: TDBGrid;
    Panel4: TPanel;
    DBGrid4: TDBGrid;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    DBGrid2: TDBGrid;
    DBGrid1: TDBGrid;

    procedure btn1Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure edit1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
  private
    { Private declarations }
    PreColumn: TColumn;
    field_name:string;
    OldGridWnd : TWndMethod;
    ADOQuery1sql :string;
    procedure NewGridWnd (var Message : TMessage);
    procedure item_click(sender:TObject);
  public
    SGrid139_tmp1: TStringGrid;
    SGridInv_tmp1: TStringGrid;
    SGridDepz_tmp1: TStringGrid;
    { Public declarations }
  end;

var
  FrmMain: TFrmMain;

implementation

{$R *.dfm}
uses DataModuleUnit, common, InputUnit, IF_Unit1;

procedure TFrmMain.FormCreate(Sender: TObject);
begin

   if not App_Init(dm.ADOConnection1) then
    begin
      ShowMsg('程序起动失败请联系管理员',1);
      application.Terminate;
    end;                          {}
  DM.ADOConnection1.Connected:= True;
  Caption := application.Title;

 { rkey73:= '1';
 user_ptr := '3';
  vprev := '4';     {}

  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd';

  OldGridWnd := DBGrid1.WindowProc;
  DBGrid1.WindowProc := NewGridWnd;

  ADOQuery1sql := '' ;
end;

procedure TFrmMain.btn1Click(Sender: TObject);
begin
  CLOSE;
end;

procedure TFrmMain.btn3Click(Sender: TObject);
begin
  IF dbgrid1.DataSource.DataSet.Active THEN
      IF dbgrid1.DataSource.DataSet.RecordCount > 0 THEN
          Export_dbGrid_to_Excel(dbgrid1,'工序材料消耗标准') ;
end;

procedure TFrmMain.btn2Click(Sender: TObject);
var
  i:integer;
begin
  i := -1 ;
  if dbgrid1.DataSource.DataSet.Active then
  begin
    if not dbgrid1.DataSource.DataSet.FieldByName('rkey').IsNull then
      i := dbgrid1.DataSource.DataSet.FieldValues['rkey'] ;
    dbgrid1.DataSource.DataSet.Close ;
  end;
  dbgrid1.DataSource.DataSet.Open ;
  if i <> -1 then dbgrid1.DataSource.DataSet.Locate('rkey',i,[]);
end;

procedure TFrmMain.DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
 { if not (gdFixed in State) then
    if DBGrid1.DataSource.DataSet.Active then
    begin
      if DBGrid1.DataSource.DataSet.RecNo  mod 2 = 0 then
      begin
        DBGrid1.Canvas.Brush.Color := clwhite;
        DBGrid1.Canvas.FillRect(rect);
      end
      else
        begin
          DBGrid1.Canvas.Brush.Color := RGB(244,241,255);
          DBGrid1.Canvas.FillRect(rect);
        end ;
      if ((State = [gdSelected]) or (State=[gdSelected,gdFocused])) then
      begin
        DBGrid1.Canvas.Brush.Color :=  RGB(0,224,224);
        DBGrid1.Canvas.FillRect(rect);
      end;
      DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
    end;   }
end;

procedure TFrmMain.DBGrid2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (chr(key) = 'S') and (ssalt in shift) then
      showmessage((DBGrid1.DataSource.DataSet as TADOQuery).SQL.Text);
end;

procedure TFrmMain.DBGrid1TitleClick(Column: TColumn);
begin

  edit1.Tag := strtoint(MidStr(TDBGrid(Column).GetNamePath,7,1));
  case edit1.Tag of
    1: begin
        if dbgrid1.DataSource.DataSet.Active then
              begin
                if field_name<>column.FieldName then
                begin
                  field_name := column.FieldName;
                  label1.Caption := column.Title.Caption;
                  edit1.Text := '' ;
                  edit1.SetFocus;
                  PreColumn.Title.Color := clBtnFace;
                  Column.Title.Color := clred;
                  PreColumn := column;
                  TADOQuery(Column.Field.DataSet).Sort :=Column.Field.FieldName+' ASC';
                end
                else if field_name = column.FieldName then
                  begin
                    edit1.SetFocus;
                    PreColumn.Title.Color := clBtnFace;
                    Column.Title.Color := clred;
                    PreColumn := column;
                    TADOQuery(Column.Field.DataSet).Sort :=Column.Field.FieldName+' ASC';
                  end;
              end
        else
                  showmessage('没有打开数据，请先点击查询按钮查询数据');
    end;
        2: begin
        if dbgrid2.DataSource.DataSet.Active then
              begin
                if field_name<>column.FieldName then
                begin
                  field_name := column.FieldName;
                  label1.Caption := column.Title.Caption;
                  edit1.Text := '' ;
                  edit1.SetFocus;
                  PreColumn.Title.Color := clBtnFace;
                  Column.Title.Color := clred;
                  PreColumn := column;
                  TADOQuery(Column.Field.DataSet).Sort :=Column.Field.FieldName+' ASC';
                end
                else if field_name = column.FieldName then
                  begin
                    edit1.SetFocus;
                    PreColumn.Title.Color := clBtnFace;
                    Column.Title.Color := clred;
                    PreColumn := column;
                    TADOQuery(Column.Field.DataSet).Sort :=Column.Field.FieldName+' ASC';
                  end;
              end
        else
                  showmessage('没有打开数据，请先点击查询按钮查询数据');
        end;
        3: begin
        if dbgrid3.DataSource.DataSet.Active then
              begin
                if field_name<>column.FieldName then
                begin
                  field_name := column.FieldName;
                  label1.Caption := column.Title.Caption;
                  edit1.Text := '' ;
                  edit1.SetFocus;
                  PreColumn.Title.Color := clBtnFace;
                  Column.Title.Color := clred;
                  PreColumn := column;
                  TADOQuery(Column.Field.DataSet).Sort :=Column.Field.FieldName+' ASC';
                end
                else if field_name = column.FieldName then
                  begin
                    edit1.SetFocus;
                    PreColumn.Title.Color := clBtnFace;
                    Column.Title.Color := clred;
                    PreColumn := column;
                    TADOQuery(Column.Field.DataSet).Sort :=Column.Field.FieldName+' ASC';
                  end;
              end
        else
                  showmessage('没有打开数据，请先点击查询按钮查询数据');
        end;
        4: begin
        if dbgrid4.DataSource.DataSet.Active then
              begin
                if field_name<>column.FieldName then
                begin
                  field_name := column.FieldName;
                  label1.Caption := column.Title.Caption;
                  edit1.Text := '' ;
                  edit1.SetFocus;
                  PreColumn.Title.Color := clBtnFace;
                  Column.Title.Color := clred;
                  PreColumn := column;
                  TADOQuery(Column.Field.DataSet).Sort :=Column.Field.FieldName+' ASC';
                end
                else if field_name = column.FieldName then
                  begin
                    edit1.SetFocus;
                    PreColumn.Title.Color := clBtnFace;
                    Column.Title.Color := clred;
                    PreColumn := column;
                    TADOQuery(Column.Field.DataSet).Sort :=Column.Field.FieldName+' ASC';
                  end;
              end
        else
                  showmessage('没有打开数据，请先点击查询按钮查询数据');
        end;
  end;
end;

procedure TFrmMain.item_click(sender: TObject);
var
  i:byte;
begin
  (sender as tmenuItem).Checked := not ((sender as tmenuItem).Checked);
  if (sender as tmenuItem).Checked then
  begin
    case edit1.Tag of
        1:begin
            for i := 0 to dbgrid1.FieldCount-1 do
            if dbgrid1.Columns[i].Title.Caption=(sender as tmenuItem).Caption then
            begin
              dbgrid1.Columns[i].Visible:=true;
              break;
            end;
        end;
        2:begin
            for i := 0 to dbgrid1.FieldCount-1 do
            if dbgrid2.Columns[i].Title.Caption=(sender as tmenuItem).Caption then
            begin
              dbgrid2.Columns[i].Visible:=true;
              break;
            end;
        end;
        3:begin
            for i := 0 to dbgrid1.FieldCount-1 do
            if dbgrid3.Columns[i].Title.Caption=(sender as tmenuItem).Caption then
            begin
              dbgrid3.Columns[i].Visible:=true;
              break;
            end;
        end;
        4:begin
            for i := 0 to dbgrid1.FieldCount-1 do
            if dbgrid4.Columns[i].Title.Caption=(sender as tmenuItem).Caption then
            begin
              dbgrid4.Columns[i].Visible:=true;
              break;
            end;
        end;
    end;
  end
  else
  begin
    case edit1.Tag of
        1:begin
            for i := 0 to dbgrid1.FieldCount-1 do
            if dbgrid1.Columns[i].Title.Caption=(sender as tmenuItem).Caption then
            begin
              dbgrid1.Columns[i].Visible:=False;
              break;
            end;
        end;
        2:begin
            for i := 0 to dbgrid1.FieldCount-1 do
            if dbgrid2.Columns[i].Title.Caption=(sender as tmenuItem).Caption then
            begin
              dbgrid2.Columns[i].Visible:=False;
              break;
            end;
        end;
        3:begin
            for i := 0 to dbgrid1.FieldCount-1 do
            if dbgrid3.Columns[i].Title.Caption=(sender as tmenuItem).Caption then
            begin
              dbgrid3.Columns[i].Visible:=False;
              break;
            end;
        end;
        4:begin
            for i := 0 to dbgrid1.FieldCount-1 do
            if dbgrid4.Columns[i].Title.Caption=(sender as tmenuItem).Caption then
            begin
              dbgrid4.Columns[i].Visible:=False;
              break;
            end;
        end;
    end;
  end;
end;

procedure TFrmMain.NewGridWnd(var Message: TMessage);
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

procedure TFrmMain.edit1Change(Sender: TObject);
var
  s:string;
begin
     if trim(Edit1.text) = '' then
     begin
        DM.ADOQuery1.Filter := '';
        DM.ADO139_1.Filter := '';
        DM.ADO155_1.Filter := '';
        DM.ADO154_1.Filter := '';
        s:= '';
     end;
    case edit1.Tag of
         1: begin
             if dbgrid1.DataSource.DataSet.Active  then
                  begin
                    DM.ADOQuery1.Filter := '';
                    s:= '';
                    if trim(Edit1.text) <> '' then
                    begin
                      if dm.ADOQuery1.Fields.FieldByName(field_name).DataType  in [ftString,ftWideString]  then
                      begin
                        if s = '' then
                          s := field_name+' like ''%'+trim(edit1.text)+'%'''
                        else
                          s :=s +' and '+ field_name+' like ''%'+trim(edit1.text)+'%''' ;
                      end
                      else if dm.ADOQuery1.Fields.FieldByName(field_name).DataType in [ftSmallint, ftInteger, ftWord, ftBCD]  then
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
                               showmessage('输入的内容不相符，只能输入日期') ;
                             end;
                           end;
                    end ;
                    DM.ADOQuery1.Filter := S;
                  end ;
         end;
         2: begin
             if dbgrid2.DataSource.DataSet.Active  then
                  begin
                    DM.ADO139_1.Filter := '';
                    s:= '';
                    if trim(Edit1.text) <> '' then
                    begin
                      if dm.ADO139_1.Fields.FieldByName(field_name).DataType  in [ftString,ftWideString]  then
                      begin
                        if s = '' then
                          s := field_name+' like ''%'+trim(edit1.text)+'%'''
                        else
                          s :=s +' and '+ field_name+' like ''%'+trim(edit1.text)+'%''' ;
                      end
                      else if dm.ADO139_1.Fields.FieldByName(field_name).DataType in [ftSmallint, ftInteger, ftWord, ftBCD]  then
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
                      else if dm.ADO139_1.Fields.FieldByName(field_name).DataType  in [ftDate,ftTime, ftDateTime] then
                           begin
                             try
                               strtodatetime(edit1.Text);
                               if s = '' then
                                 s := field_name+' = '''+ trim(edit1.text) +''''
                               else
                                 s := s +' and '+ field_name+' = '''+ trim(edit1.text) +'''';
                             except
                               showmessage('输入的内容不相符，只能输入日期') ;
                             end;
                           end;
                    end ;
                    DM.ADO139_1.Filter := S;
                  end ;
         end;
         3: begin
                  if dbgrid3.DataSource.DataSet.Active  then
                  begin
                    DM.ADO155_1.Filter := '';
                    s:= '';
                    if trim(Edit1.text) <> '' then
                    begin
                      if dm.ADO155_1.Fields.FieldByName(field_name).DataType  in [ftString,ftWideString]  then
                      begin
                        if s = '' then
                          s := field_name+' like ''%'+trim(edit1.text)+'%'''
                        else
                          s :=s +' and '+ field_name+' like ''%'+trim(edit1.text)+'%''' ;
                      end
                      else if dm.ADO155_1.Fields.FieldByName(field_name).DataType in [ftSmallint, ftInteger, ftWord, ftBCD]  then
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
                      else
                      if dm.ADO155_1.Fields.FieldByName(field_name).DataType  in [ftDate,ftTime, ftDateTime] then
                           begin
                             try
                               strtodatetime(edit1.Text);
                               if s = '' then
                                 s := field_name+' = '''+ trim(edit1.text) +''''
                               else
                                 s := s +' and '+ field_name+' = '''+ trim(edit1.text) +'''';
                             except
                               showmessage('输入的内容不相符，只能输入日期') ;
                             end;
                           end;
                    end ;
                    DM.ADO155_1.Filter := S;
                  end ;
             end;
             4: begin
                      if dbgrid4.DataSource.DataSet.Active  then
                      begin
                        DM.ADO154_1.Filter := '';
                        s:= '';
                        if trim(Edit1.text) <> '' then
                        begin
                          if dm.ADO154_1.Fields.FieldByName(field_name).DataType  in [ftString,ftWideString]  then
                          begin
                            if s = '' then
                              s := field_name+' like ''%'+trim(edit1.text)+'%'''
                            else
                              s :=s +' and '+ field_name+' like ''%'+trim(edit1.text)+'%''' ;
                          end
                          else if dm.ADO154_1.Fields.FieldByName(field_name).DataType in [ftSmallint, ftInteger, ftWord, ftBCD]  then
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
                          else if dm.ADO154_1.Fields.FieldByName(field_name).DataType  in [ftDate,ftTime, ftDateTime] then
                               begin
                                 try
                                   strtodatetime(edit1.Text);
                                   if s = '' then
                                     s := field_name+' = '''+ trim(edit1.text) +''''
                                   else
                                     s := s +' and '+ field_name+' = '''+ trim(edit1.text) +'''';
                                 except
                                   showmessage('输入的内容不相符，只能输入日期') ;
                                 end;
                               end;
                        end ;
                        DM.ADO154_1.Filter := S;
                      end ;
             end;
    end;
end;

procedure TFrmMain.FormShow(Sender: TObject);
var
  i:byte;
  item:TMenuItem;
begin

  if not dm.ADOConnection1.Connected then
    application.Terminate ;  

  SGrid139_tmp1 := TStringGrid.Create(Self);
  SGridInv_tmp1 := TStringGrid.Create(Self);
  SGridDepz_tmp1 := TStringGrid.Create(Self);
  field_name := DBGrid1.Columns[0].FieldName ;
  PreColumn := DBGrid1.Columns[0] ;

  Label1.Caption := DBGrid1.Columns[0].Title.caption ;

  for i:=1 to DBGrid1.Columns.Count do
  begin
    item := TmenuItem.Create(self) ;
    item.Caption := dbgrid1.Columns[i-1].Title.Caption ;
    item.Checked := dbgrid1.Columns[i-1].Visible ;
    item.OnClick := item_click ;
  end;

  if ADOQuery1sql = '' then
    ADOQuery1sql := dm.ADOQuery1.SQL.Text ;
  btn2Click(nil);
end;

procedure TFrmMain.PopupMenu1Popup(Sender: TObject);
begin
  PopupMenu1.Items[1].Enabled:=(not DBGrid1.DataSource.DataSet.IsEmpty) and (StrToInt(vprev) in [2,4]);
  PopupMenu1.Items[2].Enabled:=PopupMenu1.Items[1].Enabled;
end;

procedure TFrmMain.N1Click(Sender: TObject);
var
  i:Integer;
begin
  if not (StrToInt(vprev) in [2,4]) then
  begin
    ShowMessage('对不起，你没有新增的权限');
    Exit;
  end;

  FrmInput :=TFrmInput.Create(Application);
  try
    FrmInput.Tag:=0;//新增
    FrmInput.WhareHouse_ptr:=0;
    if FrmInput.ShowModal = mrok then
    begin
      DM.aqry136.Close;
      DM.aqry136.Parameters[0].Value:=0;
      DM.aqry136.Open;
      DM.ADOConnection1.BeginTrans;
      try

        DM.aqry136.Append;
        DM.aqry136warehouse_ptr.Value:=FrmInput.WhareHouse_ptr;
        DM.aqry136stan_consume.Value:=StrToCurr(FrmInput.edt_consume.Text);
        DM.aqry136control_name.Value:= Trim(FrmInput.Edit1.Text);
        DM.aqry136unit_ptr.Value := StrToInt(FrmInput.lblUnitName.Hint);
        DM.aqry136.FieldByName('group_id').AsInteger := StrToInt(FrmInput.edtPJCCTS.Text);
        if FrmInput.CheckBox1.Checked = True   then
        begin
             DM.aqry136.FieldByName('Important_mtl').AsInteger  :=    1 ;
            { DM.aqry136.FieldByName('Prod_Area_Type').AsInteger :=   FrmInput.RadioGroup1.ItemIndex + 1;
              DM.aqry136.FieldByName('Depletion').AsFloat :=  StrToFloat(FrmInput.Edit2.Text);
              DM.aqry136.FieldByName('Plating').AsFloat :=  StrToFloat(FrmInput.Edit3.Text);
              DM.aqry136.FieldByName('Depth').AsFloat :=  StrToFloat(FrmInput.Edit4.Text);
              DM.aqry136.FieldByName('Density').AsFloat :=  StrToFloat(FrmInput.Edit5.Text);
              DM.aqry136.FieldByName('Formula_Result').AsFloat :=  StrToFloat(FrmInput.SpeedButton8.Hint);
              DM.aqry136.FieldByName('Mtl_Type').AsInteger :=   FrmInput.ComboBox1.ItemIndex + 1;    {}
        end else if FrmInput.CheckBox1.Checked = False   then
                  begin
                      DM.aqry136.FieldByName('Important_mtl').AsInteger  :=    0 ;
                  end;
        DM.aqry136.FieldByName('Prod_Area_Type').AsInteger :=   FrmInput.RadioGroup1.ItemIndex + 1;
        if FrmInput.Edit2.Text <>'' then
        DM.aqry136.FieldByName('Depletion').AsFloat :=  StrToFloat(FrmInput.Edit2.Text);
         if FrmInput.Edit3.Text <>'' then
        DM.aqry136.FieldByName('Plating').AsFloat :=  StrToFloat(FrmInput.Edit3.Text);
         if FrmInput.Edit4.Text <>'' then
        DM.aqry136.FieldByName('Depth').AsFloat :=  StrToFloat(FrmInput.Edit4.Text);
         if FrmInput.Edit5.Text <>'' then
        DM.aqry136.FieldByName('Density').AsFloat :=  StrToFloat(FrmInput.Edit5.Text);
        DM.aqry136.FieldByName('Formula').Value :=  FrmInput.Memo1.Text;
        DM.aqry136.FieldByName('Formula_Result').AsString :=  FrmInput.SpeedButton8.Hint;
        DM.aqry136.FieldByName('Mtl_Type').AsInteger :=   FrmInput.ComboBox1.ItemIndex + 1;


        DM.aqry136.Post;

        DM.ADO139.Close;
        DM.ADO139.Parameters[0].Value:=DM.aqry136rkey.Value;
        DM.ADO139.Open;
        for I := 0 to FrmInput.lvPeop.Items.Count - 1 do
        begin
          DM.ADO139.Append;
          DM.ADO139rkey136.Value:=DM.aqry136rkey.Value;
          DM.ADO139csi_ptr.Value:=Integer(FrmInput.lvPeop.Items[I].Data);
          DM.ADO139.Post;
        end;
        DM.ADO139.UpdateBatch();

        DM.ADO155.Close;
        DM.ADO155.Parameters[0].Value:=DM.aqry136rkey.Value;
        DM.ADO155.Open;

        for i:=0 to FrmInput.lvGX.Items.Count - 1 do
        begin
          DM.ADO155.Append;
          DM.ADO155control_ptr.Value:=DM.aqry136rkey.Value;
          DM.ADO155dept_ptr.Value:= Integer(FrmInput.lvGX.Items[i].data);
          DM.ADO155.Post;
        end;
        DM.ADO155.UpdateBatch();

        DM.ADO154.Close;
        DM.ADO154.Parameters[0].Value:=DM.aqry136rkey.Value;
        DM.ADO154.Open;
        for i:=0 to FrmInput.lvCL.Items.Count - 1 do
        begin
          DM.ADO154.Append;
          DM.ADO154control_ptr.Value:=DM.aqry136rkey.Value;
          DM.ADO154invt_ptr.Value:=Integer(FrmInput.lvCL.Items[i].data);
          DM.ADO154.Post;
        end;
        DM.ADO154.UpdateBatch();

        DM.ADOConnection1.CommitTrans;
      except
        on e:Exception do
        begin
          DM.ADOConnection1.RollbackTrans;
          ShowMessage('保存过程中出现错误！'+#13+'出错原因：'+e.Message);
        end;
      end;
    end;
  finally
    FrmInput.Free;
  end;
  FrmMain.btn2Click(nil);
end;

procedure TFrmMain.N2Click(Sender: TObject);
var
  i: Integer;
begin
  if not (StrToInt(vprev) in [2,4]) then
  begin
    ShowMessage('对不起，你没有编辑的权限');
    Exit;
  end;

  FrmInput :=TFrmInput.Create(Application);
  try
    FrmInput.Tag:=1;//编辑
    FrmInput.WhareHouse_ptr:=DM.ADOQuery1warehouse_ptr.Value;
    FrmInput.edt_consume.Text:=dm.ADOQuery1stan_consume.AsString;
    FrmInput.edtWhareHouse.Text:=DM.ADOQuery1WAREHOUSE_CODE.Value;
    FrmInput.lblWhareHouse.Caption:=DM.ADOQuery1WAREHOUSE_NAME.Value;
    FrmInput.Edit1.Text:=DM.ADOQuery1control_name.Value;
    FrmInput.edtPJCCTS.Text := DM.ADOQuery1.fieldbyname('group_id').AsString;
    if  DM.ADOQuery1.FieldByName('Important_mtl').AsInteger = 1 then
    begin
            FrmInput.CheckBox1.Checked := True;
    end else if  DM.ADOQuery1.FieldByName('Important_mtl').AsInteger = 0   then
                  begin
                      FrmInput.CheckBox1.Checked  :=    False ;
                  end;

       FrmInput.RadioGroup1.ItemIndex :=   DM.ADOQuery1.FieldByName('Prod_Area_Type').AsInteger - 1;
        if  DM.ADOQuery1.FieldByName('Depletion').AsString <>'' then
        FrmInput.Edit2.Text :=   DM.ADOQuery1.FieldByName('Depletion').AsString;
        if  DM.ADOQuery1.FieldByName('Plating').AsString <>'' then
        FrmInput.Edit3.Text :=   DM.ADOQuery1.FieldByName('Plating').AsString;
        if  DM.ADOQuery1.FieldByName('Depth').AsString <>'' then
        FrmInput.Edit4.Text :=   DM.ADOQuery1.FieldByName('Depth').AsString;
        if  DM.ADOQuery1.FieldByName('Density').AsString <>'' then
        FrmInput.Edit5.Text :=   DM.ADOQuery1.FieldByName('Density').AsString;
        FrmInput.Memo1.Text :=   DM.ADOQuery1.FieldByName('Formula').AsString;
        FrmInput.SpeedButton8.Hint :=   DM.ADOQuery1.FieldByName('Formula_Result').AsString;
        FrmInput.ComboBox1.ItemIndex := DM.ADOQuery1.FieldByName('Mtl_Type').AsInteger - 1;
  //  FrmInput.lbldept.Caption:=DM.ADOQuery1DEPT_NAME.Value;
  //  FrmInput.edtinvt.Text:=DM.ADOQuery1INV_PART_NUMBER.Value;
  //  FrmInput.lblinvt.Caption:=DM.ADOQuery1INV_PART_DESCRIPTION.Value;
  //  FrmInput.lblUnitName.Caption:=DM.ADOQuery1UNIT_NAME.Value;
  //  FrmInput.edtGroupId.Text:=DM.ADOQuery1group_id.AsString;

    DM.ADO139_1.Close;
    DM.ADO139_1.Parameters[0].Value:=DM.ADOQuery1rkey.Value;
    DM.ADO139_1.Open;
    DM.ADO139_1.First;
    i:=1;
    while not DM.ADO139_1.Eof do
    begin
      with FrmInput.lvPeop.Items.Add do
      begin
        Caption :=  DM.ADO139_1USER_LOGIN_NAME.AsString;
        SubItems.Add(DM.ADO139_1USER_FULL_NAME.AsString);
        SubItems.Add(DM.ADO139_1PHONE.AsString);
        Data := Pointer(DM.ADO139_1RKEY.AsInteger);
      end;
      DM.ADO139_1.Next;
    end;

    DM.ADO155_1.Close;
    DM.ADO155_1.Parameters[0].Value:=DM.ADOQuery1rkey.Value;
    DM.ADO155_1.Open;
    DM.ADO155_1.First;
    i:=1;
    while not DM.ADO155_1.Eof do
    begin
      with FrmInput.lvGX.Items.Add do
      begin
        Caption := DM.ADO155_1DEPT_CODE.AsString;
        SubItems.Add(DM.ADO155_1DEPT_NAME.AsString);
        Data := Pointer(DM.ADO155_1dept_ptr.asinteger);
      end;
//      FrmInput.StringGrid1.Cells[0,i]:=DM.ADO155_1DEPT_CODE.AsString;
//      FrmInput.StringGrid1.Cells[1,i]:=DM.ADO155_1DEPT_NAME.AsString;
//      FrmInput.StringGrid1.Cells[2,i]:=DM.ADO155_1dept_ptr.AsString;
     // FrmInput.SGrid.Cells[3,i]:=DM.ADO155_1PHONE.AsString;
      DM.ADO155_1.Next;
    end;

    DM.ADO154_1.Close;
    DM.ADO154_1.Parameters[0].Value:=DM.ADOQuery1rkey.Value;
    DM.ADO154_1.Open;
    DM.ADO154_1.First;
    i:=1;
    while not DM.ADO154_1.Eof do
    begin
      with FrmInput.lvCL.Items.Add do
      begin
        Caption := DM.ADO154_1INV_PART_NUMBER.AsString;
        SubItems.Add(DM.ADO154_1INV_NAME.AsString);
        SubItems.Add(DM.ADO154_1UNIT_NAME.AsString);
        //SubItems.Add(DM.ADO154_1Rkey02.AsString);
        Data := Pointer(DM.ADO154_1invt_ptr.AsInteger);
      end;
      FrmInput.lblUnitName.Caption :=DM.ADO154_1UNIT_NAME.AsString;
      FrmInput.lblUnitName.Hint :=DM.ADO154_1Rkey02.AsString;

//      FrmInput.StringGrid2.Cells[0,i]:=DM.ADO154_1INV_PART_NUMBER.AsString;
//      FrmInput.StringGrid2.Cells[1,i]:=DM.ADO154_1INV_NAME.AsString;
//      FrmInput.StringGrid2.Cells[2,i]:=DM.ADO154_1invt_ptr.AsString;
//      FrmInput.StringGrid2.Cells[3,i]:=DM.ADO154_1UNIT_NAME.AsString;
//      FrmInput.StringGrid2.Cells[4,i]:= DM.ADO154_1Rkey02.AsString;
//      FrmInput.lblUnitName.Caption :=DM.ADO154_1UNIT_NAME.AsString;
//      FrmInput.lblUnitName.Hint :=DM.ADO154_1Rkey02.AsString;
     // FrmInput.SGrid.Cells[3,i]:=DM.ADO155_1PHONE.AsString;
      DM.ADO154_1.Next;
//      i:=i+1;
//      FrmInput.StringGrid2.RowCount:=i;
    end;

    if FrmInput.ShowModal = mrok then
    begin
      DM.aqry136.Close;
      DM.aqry136.Parameters[0].Value:=DM.ADOQuery1rkey.Value;
      DM.aqry136.Open;
      DM.ADOConnection1.BeginTrans;
      try
        DM.aqry136.Edit;
        DM.aqry136warehouse_ptr.Value:=FrmInput.WhareHouse_ptr;
        DM.aqry136stan_consume.Value:=StrToCurr(FrmInput.edt_consume.Text);
        DM.aqry136control_name.Value:= Trim(FrmInput.Edit1.Text);
        dm.aqry136.FieldByName('group_id').AsInteger := StrToInt(FrmInput.edtPJCCTS.Text);
        if FrmInput.CheckBox1.Checked = True   then
        begin
             DM.aqry136.FieldByName('Important_mtl').AsInteger  :=    1 ;
        end else if FrmInput.CheckBox1.Checked = False   then
                  begin
                      DM.aqry136.FieldByName('Important_mtl').AsInteger  :=    0 ;
                  end;

        DM.aqry136.FieldByName('Prod_Area_Type').AsInteger :=   FrmInput.RadioGroup1.ItemIndex + 1;
        if FrmInput.Edit2.Text <>'' then
        DM.aqry136.FieldByName('Depletion').AsFloat :=  StrToFloat(FrmInput.Edit2.Text);
         if FrmInput.Edit3.Text <>'' then
        DM.aqry136.FieldByName('Plating').AsFloat :=  StrToFloat(FrmInput.Edit3.Text);
         if FrmInput.Edit4.Text <>'' then
        DM.aqry136.FieldByName('Depth').AsFloat :=  StrToFloat(FrmInput.Edit4.Text);
         if FrmInput.Edit5.Text <>'' then
        DM.aqry136.FieldByName('Density').AsFloat :=  StrToFloat(FrmInput.Edit5.Text);
        DM.aqry136.FieldByName('Formula').Value :=  FrmInput.Memo1.Text;
        DM.aqry136.FieldByName('Formula_Result').AsString :=  FrmInput.SpeedButton8.Hint;
        DM.aqry136.FieldByName('Mtl_Type').AsInteger :=   FrmInput.ComboBox1.ItemIndex + 1;
       // DM.aqry136unit_ptr.Value := StrToInt(FrmInput.lblUnitName.Hint);
        DM.aqry136.Post;


        DM.ADO139.Close;
        DM.ADO139.Parameters[0].Value:=dm.aqry136rkey.value;
        DM.ADO139.Open;
        while not DM.ADO139.IsEmpty do
          DM.ADO139.Delete;

        for I := 0 to FrmInput.lvPeop.Items.Count - 1 do
        begin
          DM.ADO139.Append;
          DM.ADO139rkey136.Value:=DM.aqry136rkey.Value;
          DM.ADO139csi_ptr.Value:=Integer(FrmInput.lvPeop.Items[I].Data);
          DM.ADO139.Post;
        end;
        DM.ADO139.UpdateBatch();

        DM.ADO155.Close;
        DM.ADO155.Parameters[0].Value:=dm.aqry136rkey.value;
        DM.ADO155.Open;
        while not DM.ADO155.IsEmpty do
          DM.ADO155.Delete;
        for i:=0 to FrmInput.lvGX.Items.Count - 1 do
        begin
          DM.ADO155.Append;
          DM.ADO155control_ptr.Value:=DM.aqry136rkey.Value;
          DM.ADO155dept_ptr.Value:= Integer(FrmInput.lvGX.Items[i].data);
          DM.ADO155.Post;
        end;
        DM.ADO155.UpdateBatch();

        DM.ADO154.Close;
        DM.ADO154.Parameters[0].Value:=dm.aqry136rkey.value;
        DM.ADO154.Open;
        while not DM.ADO154.IsEmpty do
          DM.ADO154.Delete;
        for i:=0 to FrmInput.lvCL.Items.Count - 1 do
        begin
          DM.ADO154.Append;
          DM.ADO154control_ptr.Value:=DM.aqry136rkey.Value;
          DM.ADO154invt_ptr.Value:=Integer(FrmInput.lvCL.Items[i].data);
          DM.ADO154.Post;
        end;
        DM.ADO154.UpdateBatch();

        DM.ADOConnection1.CommitTrans;
      except
        on e:Exception do
        begin
          DM.ADOConnection1.RollbackTrans;
          ShowMessage('保存过程中出现错误！'+#13+'出错原因：'+e.Message);
        end;
      end;
    end;
  finally
    FrmInput.Free;
  end;  
  FrmMain.btn2Click(nil);
end;

procedure TFrmMain.N3Click(Sender: TObject);
begin
  if not (StrToInt(vprev) in [2,4]) then
  begin
    ShowMessage('对不起，你没有删除的权限');
    Exit;
  end;

  if MessageDlg('删除操作是不可逆操作，确认删除？',mtWarning,[mbYes,mbNo],0)= mrno then Exit;

  try
    DM.ADOConnection1.BeginTrans;
    DM.aqry136.Close;
    DM.aqry136.Parameters[0].Value:=dm.ADOQuery1rkey.Value;
    DM.aqry136.Open;
    DM.aqry136.Delete;
    DM.ADOConnection1.CommitTrans;
  except
    on e:Exception do
    begin
      DM.ADOConnection1.RollbackTrans;
      ShowMessage('删除过程中出现错误！'+#13+'出错原因：'+e.Message);
    end;
  end;
  FrmMain.btn2Click(nil);
end;

procedure TFrmMain.btn4Click(Sender: TObject);
var
  i:integer;
begin
    with If_Form1 do
    begin
            if ShowModal=mrok then
            begin
               if dm.ADOQuery1.Active then dm.ADOQuery1.Close ;
               dm.ADOQuery1.SQL.Clear ;
               dm.ADOQuery1.SQL.Add(ADOQuery1SQL);
               for i := 1 to If_Form1.sgrid1.RowCount-2  do
               begin
                   dm.ADOQuery1.SQL.Add(trim(If_Form1.sgrid1.Cells[2,i]));
               end;
               dm.ADOQuery1.Prepared ;
               dm.ADOQuery1.Open;
               dm.ADOQuery1AfterScroll(dm.ADOQuery1);
            end ;
    end;
end;

end.

