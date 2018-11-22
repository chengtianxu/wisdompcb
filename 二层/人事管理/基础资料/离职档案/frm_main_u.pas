unit frm_main_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Series, TeEngine, Buttons, TeeProcs, Chart,
  DbChart, Grids, DBGridEh, ComCtrls, Menus,DB;

type
  Tfrm_main = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    LabelCount: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    Edit1: TEdit;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    DBGridEh1: TDBGridEh;
    TabSheet2: TTabSheet;
    TabSheet4: TTabSheet;
    PopupMenu2: TPopupMenu;
    PopupMenu1: TPopupMenu;
    RadioGroup2: TRadioGroup;
    dgh_grd1: TDBGridEh;
    DBGridEh3: TDBGridEh;
    RadioGroup3: TRadioGroup;
    RadioGroup4: TRadioGroup;
    PopupMenu3: TPopupMenu;
    PopupMenu4: TPopupMenu;
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
    N12: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    N15: TMenuItem;
    N16: TMenuItem;
    N17: TMenuItem;
    pnl1: TPanel;
    pnl0: TPanel;
    pnl2: TPanel;
    lbl1: TLabel;
    lbl2: TLabel;
    dtp1: TDateTimePicker;
    dtp2: TDateTimePicker;
    lbl3: TLabel;
    dtp3: TDateTimePicker;
    lbl4: TLabel;
    dtp4: TDateTimePicker;
    lbl5: TLabel;
    dtp5: TDateTimePicker;
    lbl6: TLabel;
    dtp6: TDateTimePicker;
    img1: TImage;
    txt1: TStaticText;
    BitBtn6: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure Edit1Change(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure RadioGroup2Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure TabSheet2Enter(Sender: TObject);
    procedure TabSheet4Enter(Sender: TObject);
    procedure TabSheet3Enter(Sender: TObject);
    procedure TabSheet1Enter(Sender: TObject);
    procedure dgh_grd1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure RadioGroup3Click(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure dgh_grd1TitleClick(Column: TColumnEh);
    procedure N8Click(Sender: TObject);
    procedure N14Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure PopupMenu3Popup(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure DBGridEh3DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure RadioGroup4Click(Sender: TObject);
    procedure DBGridEh3TitleClick(Column: TColumnEh);
    procedure N12Click(Sender: TObject);
    procedure PopupMenu4Popup(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure dtp1Change(Sender: TObject);
    procedure dtp2Change(Sender: TObject);
    procedure dtp3Change(Sender: TObject);
    procedure dtp4Change(Sender: TObject);
    procedure dtp5Change(Sender: TObject);
    procedure dtp6Change(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
  private
    PreColumn: TColumnEh;
    field_name:string;
    sSql :string;
    Sqltext: string;
    procedure init;
    procedure item_click(sender: TObject);
    procedure comeback(change_rkey: integer);
  public
    { Public declarations }
  end;

var
  frm_main: Tfrm_main;

implementation

uses damo, UQuery, Madd, UpdateLZDate,common, ufrm_showmessage, u_infosend;

{$R *.dfm}

procedure Tfrm_main.FormCreate(Sender: TObject);
begin
init;
end;

procedure Tfrm_main.init;
begin     
  if not App_init_2(dm.ADOConnection1 ) then
  begin
    ShowMsg('程序起动失败请联系管理员',1);
    application.Terminate;
    exit;
  end;
  Caption := application.Title;
 //
  { dm.ADOConnection1.Open;
   user_ptr := '3';
  vprev := '2';
  rkey73 :='2141'; }
  //   
  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd';
  dtp1.Date := IncMonth(Now,-3);
  dtp3.Date := incmonth(Now,-3);
  dtp5.Date := IncMonth(Now,-3);
  dtp2.Date := Now;
  dtp4.Date := Now;
  dtp6.Date := Now;
  damo.base:= ' dictid=9';
  dm.ADOTMP.Close;
  dm.ADOTMP.SQL.Text:='select rkey from data0419 where programe='+quotedstr('LZEmployee.exe');
  dm.ADOTMP.Open;
  dm.program_rkey :=dm.ADOTMP.fieldbyname('rkey').Value;
  dm.ADOTMP.Close;
  dm.ADOTMP.SQL.Text := format('select data0005.rkey, employee_name from data0005 inner join data0073 on data0073.employee_ptr=data0005.rkey '
      + 'where data0073.rkey=''%s'' ', [rkey73]);
  dm.ADOTMP.open;
  dm.data05_rkey := dm.ADOTMP.fieldbyname('rkey').asstring;
  dm.ADOTMP.Close;

 dm.ADOQuery1.SQL.Text := dm.ADOQuery1.SQL.Text+
     '  and employee_1.orginal_departmentid in '+
     ' (select departmentid from hr_permission where operator_ptr='+rkey73+
     ' and program_ptr='+inttostr(dm.program_rkey)+') ';
 sSql:= dm.ADOQuery1.SQL.Text ;

 dm.qry_info.sql.text := dm.qry_info.sql.text+ ' and alt.orginal_departmentid in '+
     ' (select departmentid from hr_permission where operator_ptr='+rkey73+
     ' and program_ptr='+inttostr(dm.program_rkey)+') '+
     ' order by  alt.alterdate desc ';

 dm.qry_info_bd.sql.text := dm.qry_info_bd.sql.text+ ' and alt.new_departmentid in '+
     ' ( select departmentid from hr_permission where operator_ptr='+rkey73+
     ' and program_ptr='+inttostr(dm.program_rkey)+') '+
     ' order by  alt.alterdate desc' ;

 DM.qry_info.Parameters[0].Value := dtp1.Date;
 DM.qry_info.Parameters[1].Value := dtp2.Date;
 DM.ADOQuery1.Parameters[0].Value := dtp3.Date;
 dm.ADOQuery1.Parameters[1].Value := dtp4.Date;
 DM.qry_info_bd.Parameters[0].Value := dtp5.Date;
 DM.qry_info_bd.Parameters[1].Value := dtp6.Date;
 
 dm.qry_info.active := true;
 dm.qry_info.Filter := 'active=0 and dictid=9';


  field_name := dgh_grd1.Columns[1].FieldName;
  PreColumn := dgh_grd1.Columns[1];
  dgh_grd1.Columns[1].Title.Color := clred ;
  bitbtn4.Visible := false;

  end;

procedure Tfrm_main.BitBtn5Click(Sender: TObject);
begin
popupmenu2.Popup(mouse.CursorPos.x,mouse.CursorPos.y);
end;

procedure Tfrm_main.item_click(sender: TObject);
var
  i:byte;
begin
  (sender as tmenuItem).Checked := not ((sender as tmenuItem).Checked);
  if (sender as tmenuItem).Checked then
      begin
          for i := 0 to DBGridEh1.FieldCount - 1 do
              if DBGridEh1.Columns[i].Title.Caption = (sender as tmenuItem).Caption then
                  begin
                      DBGridEh1.Columns[i].Visible := true ;
                      break ;
                  end ;
      end
  else
      begin
          for i := 0 to DBGridEh1.FieldCount - 1 do
              if DBGridEh1.Columns[i].Title.Caption = (sender as tmenuItem).Caption then
                  begin
                      DBGridEh1.Columns[i].Visible := false ;
                      break ;
                  end ;
      end ;
end;

procedure Tfrm_main.FormShow(Sender: TObject);
var
  i:integer;
  item:TMenuItem;

begin

if dm.ADOConnection1.Connected then
  begin
      if not dm.ADOQuery1.Active then  dm.ADOQuery1.Active := true;
      DBGridEh1TitleClick(PreColumn);
      label1.Caption:=PreColumn.Title.Caption;
      for i:=1 to DBGridEh1.Columns.Count do
      begin
          item := TmenuItem.Create(self) ;
          item.Caption := DBGridEh1.Columns[i-1].Title.Caption ;

          if DBGridEh1.Columns[i-1].Visible then
              item.Checked := true ;
              item.OnClick := item_click ;
              PopupMenu2.Items.Add(item) ;
      end;
  end;
  pagecontrol1.ActivePageIndex := 0;
  damo.base := ' dictid=9 ';
  if  dm.ADOQuery1.Active then  dm.ADOQuery1.Active := false;
  BitBtn2.Click;

    //SGrid_tmp1 := TStringGrid.Create(Self);
    //BitBtn3Click(nil);
end;
procedure Tfrm_main.DBGridEh1TitleClick(Column: TColumnEh);
begin
    if DBGridEh1.DataSource.DataSet.FieldByName(Column.FieldName).FieldKind = fkCalculated
    then  exit ;
    if (column.Title.SortMarker =smDownEh) or (column.Title.SortMarker =smNoneEh) then
    begin
      column.Title.SortMarker:=smUpEh;
      DM.ADOQuery1.Sort:=Column.FieldName;
    end
    else
    begin
      column.Title.SortMarker:=smDownEh;
      DM.ADOQuery1.Sort:=Column.FieldName+' DESC';
    end;
    if DBGridEh1.DataSource.DataSet.FieldByName(Column.FieldName).DataType in [ftDate, ftTime, ftDateTime] then exit;
    if (PreColumn.FieldName<>column.FieldName) and (column.ReadOnly) then
    begin
      label1.Caption:=column.Title.Caption;
      self.field_name:=column.FieldName;
      edit1.SetFocus;
      PreColumn.Title.Color := clBtnFace;
      Column.Title.Color := clred;
      PreColumn := column;
    end
    else
      edit1.SetFocus;
Label1.Left := Edit1.Left - Label1.Width -2;      
end;



procedure Tfrm_main.Edit1Change(Sender: TObject);
begin
  case pagecontrol1.ActivePageIndex of
    1:
    begin
      if DBGridEh1.DataSource.DataSet.FieldByName(field_name).FieldKind = fkCalculated then  exit;
      if DBGridEh1.DataSource.DataSet.FieldByName(field_name).DataType in [ftString,ftWideString,ftSmallint,ftInteger]  then
      begin
      if trim(Edit1.text) <> '' then
      begin
      if DBGridEh1.DataSource.DataSet.FieldByName(field_name).DataType in  [ftString, ftWideString]  then
      DBGridEh1.DataSource.DataSet.Filter:=' (' +  field_name + ' like ''%' + trim(edit1.text) + '%'')'
      else if DBGridEh1.DataSource.DataSet.FieldByName(field_name).DataType in  [ftSmallint, ftInteger]  then
      DBGridEh1.DataSource.DataSet.Filter:=' (' + field_name+' >= ' + inttostr(strtointdef(edit1.text,0))+')';
      end else
      DBGridEh1.DataSource.DataSet.Filter:='';
      end;
      labelcount.caption := inttostr(dm.ADOQuery1.RecordCount);
    end;
    0:
    begin
        if dgh_grd1.DataSource.DataSet.FieldByName(field_name).FieldKind = fkCalculated then  exit;
        if dgh_grd1.DataSource.DataSet.FieldByName(field_name).DataType in [ftString,ftWideString,ftSmallint,ftInteger]  then
      begin
        {if radiogroup3.ItemIndex = 0 then
        dgh_grd1.DataSource.DataSet.Filter := ' active=0 and dictid=9';
        if  radiogroup3.ItemIndex = 1 then
        dgh_grd1.DataSource.DataSet.Filter := ' active=1 and dictid=9';
        if radiogroup3.ItemIndex = 2 then
        begin
        dgh_grd1.DataSource.DataSet.Filter := '';
        end;
        bitbtn2.Click; }
        case RadioGroup3.ItemIndex of
        2:
        begin
        if trim(Edit1.text) <> '' then
          begin
            if dgh_grd1.DataSource.DataSet.FieldByName(field_name).DataType in  [ftString, ftWideString]  then
            dgh_grd1.DataSource.DataSet.Filter:=' (' +  field_name + ' like ''%' + trim(edit1.text) + '%'' )'
            else
            if dgh_grd1.DataSource.DataSet.FieldByName(field_name).DataType in  [ftSmallint, ftInteger]  then
            dgh_grd1.DataSource.DataSet.Filter:=' (' + field_name+' >= ' + inttostr(strtointdef(edit1.text,0))+')';
          end else
            dgh_grd1.DataSource.DataSet.Filter:='dictid=9';
       end;
          0:
        begin
        if trim(Edit1.text) <> '' then
          begin
            if dgh_grd1.DataSource.DataSet.FieldByName(field_name).DataType in  [ftString, ftWideString]  then
            dgh_grd1.DataSource.DataSet.Filter:=' (' +  field_name + ' like ''%' + trim(edit1.text) + '%'' and active=0 and dictid=9 )'
            else
            if dgh_grd1.DataSource.DataSet.FieldByName(field_name).DataType in  [ftSmallint, ftInteger]  then
            dgh_grd1.DataSource.DataSet.Filter:=' (' + field_name+' >= ' + inttostr(strtointdef(edit1.text,0))+' and active=0 and dictid=9 )';
          end else
            dgh_grd1.DataSource.DataSet.Filter:='active=0 and dictid=9';
       end;
          1:
        begin
        if trim(Edit1.text) <> '' then
          begin
            if dgh_grd1.DataSource.DataSet.FieldByName(field_name).DataType in  [ftString, ftWideString]  then
            dgh_grd1.DataSource.DataSet.Filter:=' (' +  field_name + ' like ''%' + trim(edit1.text) + '%'' and active=1 and dictid=9)'
            else
            if dgh_grd1.DataSource.DataSet.FieldByName(field_name).DataType in  [ftSmallint, ftInteger]  then
            dgh_grd1.DataSource.DataSet.Filter:=' (' + field_name+' >= ' + inttostr(strtointdef(edit1.text,0))+' and active=1 and dictid=9)';
          end else
            dgh_grd1.DataSource.DataSet.Filter:='active=1 and dictid=9';
       end;
      end;
      end;
      labelcount.Caption := inttostr(dm.qry_info.RecordCount);
    end;
    2:
    begin
        if dbgrideh3.DataSource.DataSet.FieldByName(field_name).FieldKind = fkCalculated then  exit;
        if dbgrideh3.DataSource.DataSet.FieldByName(field_name).DataType in [ftString,ftWideString,ftSmallint,ftInteger]  then
      begin
        if trim(Edit1.text) <> '' then
      begin
        if dbgrideh3.DataSource.DataSet.FieldByName(field_name).DataType in  [ftString, ftWideString]  then
        dbgrideh3.DataSource.DataSet.Filter:=' (' +  field_name + ' like ''%' + trim(edit1.text) + '%'')'
        else if dbgrideh3.DataSource.DataSet.FieldByName(field_name).DataType in  [ftSmallint, ftInteger]  then
        dbgrideh3.DataSource.DataSet.Filter:=' (' + field_name+' >= ' + inttostr(strtointdef(edit1.text,0))+')';
      end else
        dbgrideh3.DataSource.DataSet.Filter:='';
      end;
        labelcount.Caption := inttostr(dm.qry_info_bd.RecordCount);
    end;
  end;

end;

procedure Tfrm_main.BitBtn2Click(Sender: TObject);
 var
  i:integer;
begin

case     pagecontrol1.ActivePageIndex of
1: begin
      DM.ADOQuery1.Close;
      DM.ADOQuery1.Parameters[0].Value := dtp3.Date;
      DM.ADOQuery1.Parameters[1].Value := dtp4.Date;
      DM.ADOQuery1.Open;
      if DM.ADOQuery1.IsEmpty then exit;
      with dm.tmp do
      begin
        Close;
        SQL.Clear;
        SQL.Text := 'select distinct(model_name) from dbo.employeemsg_rpt_model';
        Open;
      end;
      RadioGroup2.Items.Clear;
      for i := 0 to dm.tmp.RecordCount - 1 do
      begin
        RadioGroup2.Items.Add(dm.tmp.FieldValues['model_name']);
        //showmessage(dm.tmp.FieldValues['model_name']);
        dm.tmp.Next;
      end;
      for i := 7 to DBGridEh1.Columns.Count - 1 do
      begin
        DBGridEh1.Columns[i].Visible := True;
      end;
      labelcount.caption := inttostr(dm.ADOQuery1.RecordCount);
   end;
  0: begin
     dm.qry_info.Close;
     DM.qry_info.Parameters[0].Value := dtp1.Date;
     DM.qry_info.Parameters[1].Value := dtp2.Date;
     dm.qry_info.Open;
     labelcount.Caption := inttostr(dm.qry_info.RecordCount);
   end;
  2: begin
      dm.qry_info_bd.Close;
      DM.qry_info_bd.Parameters[0].Value := dtp5.Date;
      DM.qry_info_bd.Parameters[1].Value := dtp6.Date;
      dm.qry_info_bd.Open;
      labelcount.Caption := inttostr(dm.qry_info_bd.RecordCount);
     end;
  end;

end;

procedure Tfrm_main.BitBtn1Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure Tfrm_main.RadioGroup2Click(Sender: TObject);
var
  ss: string;
  i, j: Integer;
  //A: Array of integer ;
begin
//单击某个模版，过滤相应字段
  for i := 8 to DBGridEh1.Columns.Count - 1 do
  begin
    DBGridEh1.Columns[i].Visible := False;
  end;

  ss := RadioGroup2.Items.Strings[RadioGroup2.ItemIndex];
  with dm.tmp do
  begin
    SQL.Clear;
    SQL.Text := 'select datafield_name from employeemsg_rpt_model where model_name =' +quotedstr(ss);
    Open;
  end;

  for j := 0 to dm.tmp.RecordCount - 1 do
  begin
    for i := 0 to DBGridEh1.Columns.Count - 1  do
    begin
      if (dm.tmp.FieldValues['datafield_name'] = DBGridEh1.Columns[i].Title.Caption ) then
      begin
        DBGridEh1.Columns[i].Visible := True;
        //DBGridEh1.Columns[i].Index := j;
      end;//A[j] := i;
    end;
    dm.tmp.Next;
  end;
   dbgrideh1.Refresh;
end;


procedure Tfrm_main.BitBtn4Click(Sender: TObject);
var
 i:byte;
begin
with Query_Form do
 begin
      with dm.ADOTMP do
      begin
        close;
        sql.Text:='select getdate() as sys_date';
        open;
        dtpk2.Date:=StrToDateTime(fieldvalues['sys_date']);
        dtpk1.Date:=dtpk2.Date-31;
      end;
 if ShowModal=mrok then
   with dm.ADOQuery1 do
    begin
     close;
     SQL.Text := sSql+ ' ';
     for i:=1 to SGrid1.RowCount-2 do
        SQL.Text:= SQL.Text+SGrid1.Cells[2,i]+#13;
     try
     //showmessage(dm.ADOQuery1.SQL.Text);
     frm_main.BitBtn2Click(Sender);
     except
      showmessage('查询失败');
      end;
    end;
  end;
end;

procedure Tfrm_main.TabSheet2Enter(Sender: TObject);
begin
bitbtn4.Visible := false;
end;

procedure Tfrm_main.TabSheet4Enter(Sender: TObject);
begin
bitbtn4.Visible := false;
end;

procedure Tfrm_main.TabSheet3Enter(Sender: TObject);
begin
bitbtn4.Visible := false;
end;

procedure Tfrm_main.TabSheet1Enter(Sender: TObject);
begin
bitbtn4.Visible := true;
end;

procedure Tfrm_main.dgh_grd1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
  If DM.qry_info.FieldByName('active').Value = 0  then
  Begin
    dgh_grd1.Canvas.Font.Color := clRed;
    If DM.qry_info.FieldByName('hascard').Value = '无'  then
      begin
          if (Column.Index=11) then
           begin
            dgh_grd1.Canvas.Brush.Color := clgreen ;
            //dgh_grd1.Canvas.Font.Color := clmaroon ;
            dgh_grd1.Canvas.FillRect(Rect);
            dgh_grd1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
            end;
      end;
          If DM.qry_info.FieldByName('hastrain').Value = 0  then
      begin
          if (Column.Index=12) then
           begin
            dgh_grd1.Canvas.Brush.Color := clgreen ;
            //dgh_grd1.Canvas.Font.Color := clmaroon ;
            dgh_grd1.Canvas.FillRect(Rect);
            dgh_grd1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
            end;
      end;
    dgh_grd1.DefaultDrawColumnCell(Rect, DataCol, Column, [gdFixed,gdFocused,gdSelected]);
  End; 
end;

procedure Tfrm_main.RadioGroup3Click(Sender: TObject);
begin
    if radiogroup3.ItemIndex = 0 then
      dgh_grd1.DataSource.DataSet.Filter := ' active=0 and dictid=9';
    if  radiogroup3.ItemIndex = 1 then
      dgh_grd1.DataSource.DataSet.Filter := ' active=1 and dictid=9';
    if radiogroup3.ItemIndex = 2 then
    begin
      dgh_grd1.DataSource.DataSet.Filter := 'dictid=9';
    end;
    bitbtn2.Click;
end;

procedure Tfrm_main.PageControl1Change(Sender: TObject);
var  i: integer;
begin
  Label1.Left := Edit1.Left - Label1.Width -2;
      lbl1.Visible := False;
      lbl2.Visible := False;
      lbl3.Visible := False;
      lbl4.Visible := False;
      lbl5.Visible := False;
      lbl6.Visible := False;
      dtp1.Visible := false;
      dtp2.Visible := false;
      dtp3.Visible := false;
      dtp4.Visible := false;
      dtp5.Visible := false;
      dtp6.Visible := false;

  case pagecontrol1.ActivePageIndex of
      0:
      begin
        lbl1.Visible := true;
        lbl2.Visible := true;
        dtp1.Visible := true;
        dtp2.Visible := true;
        if not dm.qry_info.Active then dm.qry_info.active := true;
        if dm.ADOQuery1.Active then dm.ADOQuery1.Active := false;
        if dm.qry_info_bd.Active then dm.qry_info_bd.active := false;
        bitbtn4.Visible := false;
        for i:=0 to   dgh_grd1.Columns.Count-1  do
        begin
           dgh_grd1.Columns[i].Title.Color := clBtnFace ;
        end;
        field_name := dgh_grd1.Columns[1].FieldName;
        PreColumn := dgh_grd1.Columns[1];
        dgh_grd1.Columns[1].Title.Color := clred ;
        damo.base := ' dictid=9';
        DM.qry_msg.Filter := 'status = 1';
        DM.AUTag := 0;    //页面切换，判断要做的是 离职
      end;
      1:
      begin
        lbl3.Visible := true;
        lbl4.Visible := true;
        dtp3.Visible := true;
        dtp4.Visible := true;
        if dm.qry_info.Active then dm.qry_info.active := false;
        if not dm.ADOQuery1.Active then dm.ADOQuery1.Active := true;
        if dm.qry_info_bd.Active then dm.qry_info_bd.active := false;
        bitbtn4.Visible := true;
        for i:=0 to   DBGridEh1.Columns.Count-1  do
        begin
           DBGridEh1.Columns[i].Title.Color := clBtnFace ;
        end;
        field_name := DBGridEh1.Columns[1].FieldName;
        PreColumn := DBGridEh1.Columns[1];

        DBGridEh1.Columns[1].Title.Color := clred ;
        damo.base := 'dictid=9';
      end;

     2:
      begin
        lbl5.Visible := true;
        lbl6.Visible := true;
        dtp5.Visible := true;
        dtp6.Visible := true;
        if not dm.qry_info_bd.Active then dm.qry_info_bd.Active := true;
        if dm.ADOQuery1.Active then dm.ADOQuery1.Active := false;
        if dm.qry_info.Active then dm.qry_info.active := false;
        bitbtn4.Visible := false;
        for i:=0 to   dbgrideh3.Columns.Count-1  do
        begin
           dbgrideh3.Columns[i].Title.Color := clBtnFace ;
        end;
        field_name := dbgrideh3.Columns[0].FieldName;
        PreColumn := dbgrideh3.Columns[0];
        dbgrideh3.Columns[0].Title.Color := clred ;
        DM.qry_msg.Filter := ' status = 2';
        damo.base :=' dictid=7  and item='+#39+'复职'+#39;
        DM.AUTag := 1;       //页面切换，判断要做的是 复工
      end;
  end;
  label1.Caption:=PreColumn.Title.Caption;
  bitbtn2.Click;
end;

procedure Tfrm_main.dgh_grd1TitleClick(Column: TColumnEh);
begin
    if dgh_grd1.DataSource.DataSet.FieldByName(Column.FieldName).FieldKind = fkCalculated
    then  exit ;
    if (column.Title.SortMarker =smDownEh) or (column.Title.SortMarker =smNoneEh) then
    begin
      column.Title.SortMarker:=smUpEh;
      DM.qry_info.Sort:=Column.FieldName;
    end
    else
    begin
      column.Title.SortMarker:=smDownEh;
      DM.qry_info.Sort:=Column.FieldName+' DESC';
    end;
    if dgh_grd1.DataSource.DataSet.FieldByName(Column.FieldName).DataType in [ftDate, ftTime, ftDateTime] then exit;
    if (PreColumn.FieldName<>column.FieldName) and (column.ReadOnly) then
    begin
      label1.Caption:=column.Title.Caption;
      self.field_name:=column.FieldName;
      edit1.SetFocus;
      PreColumn.Title.Color := clBtnFace;
      Column.Title.Color := clred;
      PreColumn := column;
    end
    else
      edit1.SetFocus;
    Label1.Left := Edit1.Left - Label1.Width -2;
end;

procedure Tfrm_main.N8Click(Sender: TObject);
begin
   pagecontrol1.ActivePageIndex := 2;

end;

procedure Tfrm_main.N14Click(Sender: TObject);
begin
if (strtoint(vprev) = 1) or (strtoint(vprev) = 3) then
  begin
    messagedlg('对不起!您没有该程序的可写权限', mtinformation, [mbok], 0);
    abort;
  end;
  fm_madd := tfm_madd.Create(Application);

  dm.qry_alt.Parameters[0].Value := 0;
  dm.qry_alt.Open;

  if fm_madd.ShowModal = mrok then dm.qry_alt.UpdateBatch
  else
  begin
    dm.qry_alt.Requery;  //避免引起-1错误
    dm.qry_alt.CancelBatch;
  end;

  dm.qry_alt.Close;

  if dm.AUTag = 0 then
  begin
  dm.qry_info.Requery; //刷新数据
  dm.qry_info.Sort:='oper_date DESC';
  end;

  if dm.AUTag = 1 then
  begin
  dm.qry_info_bd.Requery; //刷新数据
  dm.qry_info_bd.Sort:='oper_date DESC';
  end;
  fm_madd.Free;
  bitbtn2.Click;

end;

procedure Tfrm_main.N1Click(Sender: TObject);
  var rkey_r: integer;
begin
if (strtoint(vprev) = 1) or (strtoint(vprev) = 3)  or (strtoint(vprev) =2 ) then
  begin
    messagedlg('对不起!您没有该程序的写银权限', mtinformation, [mbok], 0);
    abort;
  end;
  rkey_r := dm.qry_info.fieldbyname('rkey').AsInteger;
  FrmUpdateLZDate := TFrmUpdateLZDate.Create(Application);
  FrmUpdateLZDate.ShowModal;
  FrmUpdateLZDate.Free;
  dm.qry_info.Locate('rkey',rkey_r,[]); //在alt中定位 
end;

procedure Tfrm_main.PopupMenu3Popup(Sender: TObject);
begin
  if ((dm.qry_info.fieldByName('active').asInteger = 0 )
  and (dgh_grd1.Selection.Rows.Count = 1)) then
    begin
      N1.Enabled := true;
      N2.Enabled := true;
    end;

  if  (dgh_grd1.Selection.Rows.Count > 1)    then
    begin
      N1.Enabled := false;
      N2.Enabled := false;
    end;

    if dm.qry_info.fieldByName('active').asInteger = 1 then
    begin
      N2.Enabled := False;
    end;

end;

procedure Tfrm_main.N2Click(Sender: TObject);
var flag_zl_train : integer;
begin
   flag_zl_train := 0;  // 自离有挂账标识/标示1需更新数据库
  if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
    begin
      messagedlg('对不起!您没有该程序的可写权限', mtinformation, [mbok], 0);
      abort;
    end;
  with dm.qry_alt do
    begin
          if messagedlg('生效后，不可还原，你确定要生效该记录吗？'
            + #13 + '1：更新该员工人事信息状态为离职'
            + #13 + '2：删除该员工考勤相关信息'
            + #13 + '3：更新该员工合同为无效'
            + #13 + '4：重新统计所有部门人数', mtconfirmation, [mbyes,mbno],1) = mrno
            then Exit;
          txt1.Caption :='检查考勤卡持有情况，如果是，则不能做变动';
          Application.ProcessMessages;
          DM.qryCheckLZ.Close;
          DM.qryCheckLZ.SQL.Clear;
          DM.qryCheckLZ.SQL.Text := Format('select roomcode,cardno from dbo.employeemsg  where rkey= ''%s'' ',[DM.qry_info.FieldValues['employeeid']]);
          DM.qryCheckLZ.Open;
          if (DM.qryCheckLZ.FieldValues['cardno'] <> null) and  (DM.qryCheckLZ.FieldValues['cardno'] <> '')  then
            begin
              ShowMessage('该员工考勤卡未收回，离职失败！');
              txt1.Caption :='';
              Exit;
            end;
          txt1.Caption :='检查是否需要做员工培训结案，如果是，则暂不能做变动';
          Application.ProcessMessages;
        if (DM.qry_info.fieldbyname('ttype').AsString <> '自离')
        then
         begin
          dm.qryCheckLZ.Close;
          dm.qryCheckLZ.SQL.Clear;
          dm.qryCheckLZ.SQL.Text :=Format(' select top 1 *  from dbo.Employee_Train  '+
                   ' where feels_payed=0 and train_feels>0  and effective_date >=getdate() '+
                   ' and employeeid=''%s'' ',[DM.qry_info.FieldValues['employeeid']]);
          dm.qryCheckLZ.Open;
            if (DM.qryCheckLZ.FieldValues['rkey'] <> null )  then
            begin
              txt1.Caption :='';
              ShowMessage('该员工有未结算的培训费尚在有效期，离职失败');
              Exit;
            end;
          end;
          //自离人员自动取消培训挂账
          if (DM.qry_info.fieldbyname('ttype').AsString = '自离')
        then
         begin
          dm.qryCheckLZ.Close;
          dm.qryCheckLZ.SQL.Clear;
          dm.qryCheckLZ.SQL.Text :=Format(' select top 1 *  from dbo.Employee_Train  '+
                   ' where feels_payed=0 and train_feels>0  and effective_date >=getdate() '+
                   ' and employeeid=''%s'' ',[DM.qry_info.FieldValues['employeeid']]);
          dm.qryCheckLZ.Open;
            if (DM.qryCheckLZ.FieldValues['rkey'] <> null )  then
            begin
              if messagedlg('该员工有培训挂账,自离生效后,'+ #13
              +'该员工的培训挂账会无费用结案,'+ #13
              +'你确定要生效该记录吗？', mtconfirmation, [mbyes,mbno],1) = mrno
              then Exit;
              flag_zl_train := 1;
            end;
          end;
         ////////////////////////////////////////////////////////////////////////////
          //开始数据操作
          try
             dm.ADOConnection1.BeginTrans;
          if  flag_zl_train = 1 then
          begin
            //txt1.Caption :='自动处理培训数据';
            //Application.ProcessMessages;
            DM.qryUpdateLZ.Close;
            DM.qryUpdateLZ.SQL.Clear;
            DM.qryUpdateLZ.SQL.Text := Format( ' update employee_train set feels_payed=1,'
              + ' oprator_ptr=''%s'', '
              + ' oprate_time=getdate(),'
              + ' train_result=train_result+'+#39+'(自离)'+#39
              + ' from  dbo.Employee_Train  '
              + ' where feels_payed=0 and train_feels>0  and effective_date >=getdate() '
              + ' and employeeid=''%s'' ',[dm.data05_rkey,DM.qry_info.FieldValues['employeeid']]);
            dm.qryUpdateLZ.ExecSQL;
          end;
          //更新人事信息
           txt1.Caption :='更新人事档案';
           Application.ProcessMessages;
          DM.qryUpdateLZ.Close;
          DM.qryUpdateLZ.SQL.Clear;
          DM.qryUpdateLZ.SQL.Text := Format(' update employeemsg set '
            + 'employeecode=isnull(new_employeecode,a.employeecode), '
            + 'departmentid=isnull(new_departmentid,a.departmentid), '
            + 'position=isnull(new_position,a.position), '
            + 'employ_type=isnull(new_employ_type,a.employ_type), '
            + 'politics_face=isnull(new_politics_face,a.politics_face), '
            + 'education=isnull(new_education,a.education), '
            + 'marriage=isnull(new_marriage,a.marriage), '
            + '[rank]=isnull(new_rank,a.[rank]), '
            + '[status]=2, '
            + 'outdutytime=isnull(b.alterdate,getdate()) '
            + 'from  employeemsg   a '
            + 'join employee_alteration b on a.rkey=b.employeeid '
            + 'where a.rkey = ''%s'' '
            + ' and b.rkey=''%s'' '
            + ' and active=0 '
            + ' and b.type in (select rkey from datadetail where dictid=9) '
             , [DM.qry_info.FieldValues['employeeid'],DM.qry_info.FieldValues['rkey']]);
          DM.qryUpdateLZ.ExecSQL;
          txt1.Caption :='删除多余考勤档案';
           Application.ProcessMessages;
          if ( pos('调',(DM.qry_info.fieldbyname('ttype').AsString))=0 )then
          begin
          //删除员工考勤相关信息 ，调厂的不删除
          DM.qryDelteDL.Close;
          DM.qryDelteDL.SQL.Clear;
          DM.qryDelteDL.SQL.Text := Format('delete from onoffdutydata where employeeid=%s'
            + ' and checkdate>=''%s''', [DM.qry_info.FieldValues['employeeid'],DM.qry_info.FieldValues['alterdate']]);
          DM.qryDelteDL.ExecSQL;
          end;
          txt1.Caption :='更新合同为无效';
          Application.ProcessMessages;
          with DM.qryTemp do
            begin
            //更新合同为无效
              Close;
              SQL.Clear;
              SQL.Text := 'update employee_contract set status=2 where status=1 and employeeid='
                + DM.qry_info.fieldByName('employeeid').asstring;
              ExecSQL;
            end;
        txt1.Caption :='更新离职档案';
        Application.ProcessMessages;
        Parameters[0].Value := dm.qry_info.fieldbyname('rkey').AsInteger;
        Open;
        Edit;
        FieldByName('active').AsInteger:=1;
        fieldbyname('oper_person').asinteger:=strtoint(dm.data05_rkey);
        fieldbyname('oper_date').asdatetime := now;
        Post;
        UpdateBatch;
        close;
        txt1.Caption :='离职生效更新部门人数';
        Application.ProcessMessages;
        dm.det_updata.execsql;   //离职生效更新部门人数
        DM.ADOConnection1.CommitTrans;
        ShowMessage('该记录生效成功！');
      except
        dm.ADOConnection1.RollbackTrans;
        ShowMessage('遇到错误,撤销数据操作');
        end;
      bitbtn2.click;
    end;
     txt1.Caption :='';
end;

procedure Tfrm_main.N3Click(Sender: TObject);
var i,k:  integer;
    array_1: array of string;
begin
  if (strtoint(vprev) = 1) or (strtoint(vprev) = 3) then
  begin
    messagedlg('对不起!您没有该程序的可写权限', mtinformation, [mbok], 0);
    abort;
  end;
     k:=dgh_grd1.SelectedRows.Count-1;
     SetLength(array_1,dgh_grd1.SelectedRows.Count);
      for I := 0 to dgh_grd1.SelectedRows.Count - 1 do
        begin
        DM.qry_info.GotoBookmark(Pointer(dgh_grd1.SelectedRows.Items[I]));
        array_1[i] :=DM.qry_info.FieldByName('rkey').asstring;
       // showmessage(array_1[i]);
        end;
        for i:=0 to k do
        begin
          dm.adotmp.sql.text :='delete from employee_alteration where active=0 and rkey ='+array_1[i];
          //showmessage(dm.adotmp.sql.text);
          dm.adotmp.ExecSQL;
        end;
        dm.qry_info.close;
        dm.qry_info.open;

end;

procedure Tfrm_main.DBGridEh3DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
  If DM.qry_info_bd.FieldByName('active').Value = 0  then
  Begin
    dbgrideh3.Canvas.Font.Color := clRed;
    dbgrideh3.DefaultDrawColumnCell(Rect, DataCol, Column, [gdFixed,gdFocused,gdSelected]);
  End;

end;

procedure Tfrm_main.RadioGroup4Click(Sender: TObject);
begin
    if radiogroup4.ItemIndex = 0 then
      dbgrideh3.DataSource.DataSet.Filter := ' active=0';
    if  radiogroup4.ItemIndex = 1 then
      dbgrideh3.DataSource.DataSet.Filter := ' active=1';
    if radiogroup4.ItemIndex = 2 then
    begin
      dbgrideh3.DataSource.DataSet.Filter := '';
    end;
    bitbtn2.Click;

end;

procedure Tfrm_main.DBGridEh3TitleClick(Column: TColumnEh);
begin
    if dbgrideh3.DataSource.DataSet.FieldByName(Column.FieldName).FieldKind = fkCalculated
    then  exit ;
    if (column.Title.SortMarker =smDownEh) or (column.Title.SortMarker =smNoneEh) then
    begin
      column.Title.SortMarker:=smUpEh;
      DM.qry_info_bd.Sort:=Column.FieldName;
    end
    else
    begin
      column.Title.SortMarker:=smDownEh;
      DM.qry_info_bd.Sort:=Column.FieldName+' DESC';
    end;
    if dbgrideh3.DataSource.DataSet.FieldByName(Column.FieldName).DataType in [ftDate, ftTime, ftDateTime] then exit;
    if (PreColumn.FieldName<>column.FieldName) and (column.ReadOnly) then
    begin
      label1.Caption:=column.Title.Caption;
      self.field_name:=column.FieldName;
      edit1.SetFocus;
      PreColumn.Title.Color := clBtnFace;
      Column.Title.Color := clred;
      PreColumn := column;
    end
    else
      edit1.SetFocus;
Label1.Left := Edit1.Left - Label1.Width -2;
end;

procedure Tfrm_main.N12Click(Sender: TObject);
var i,k:  integer;
    array_1: array of string;
begin
    if (strtoint(vprev) = 1) or (strtoint(vprev) = 3) then
    begin
      messagedlg('对不起!您没有该程序的可写权限', mtinformation, [mbok], 0);
      abort;
    end;
     k:=dbgrideh3.SelectedRows.Count-1;
     SetLength(array_1,dbgrideh3.SelectedRows.Count);
      for I := 0 to dbgrideh3.SelectedRows.Count - 1 do
        begin
        DM.qry_info_bd.GotoBookmark(Pointer(dbgrideh3.SelectedRows.Items[I]));
        array_1[i] :=DM.qry_info_bd.FieldByName('rkey').asstring;
       // showmessage(array_1[i]);
        end;
        for i:=0 to k do
        begin
          dm.adotmp.sql.text :='delete from employee_alteration where active=0 and rkey ='+array_1[i];
          //showmessage(dm.adotmp.sql.text);
          dm.adotmp.ExecSQL;
        end;
        dm.qry_info_bd.close;
        dm.qry_info_bd.open;

end;
procedure Tfrm_main.PopupMenu4Popup(Sender: TObject);
begin
 if ((dm.qry_info_bd.fieldByName('active').asInteger = 0 )
    and (dbgrideh3.Selection.Rows.Count = 1))      then
    begin
      N10.Enabled := true;
      N12.Enabled := true;
    end;
  if  (dbgrideh3.Selection.Rows.Count > 1)    then
    begin
      N10.Enabled := false;
      N12.Enabled := false;
    end;

    if dm.qry_info_bd.fieldByName('active').asInteger = 1 then
    begin
      N10.Enabled := False;
      N12.Enabled := False;
    end;

end;


procedure Tfrm_main.BitBtn3Click(Sender: TObject);
begin
case     PageControl1.ActivePageIndex of
  1:  begin
        common.Export_dbGridEH_to_Excel(dbgrideh1,'离职档案');
      end;
  0:  begin
        common.Export_dbGridEH_to_Excel(dgh_grd1,'预离职记录');
      end;
  2:  begin
        common.Export_dbGridEH_to_Excel(dbgrideh3,'复职记录');
      end;
  end;
end;

procedure Tfrm_main.comeback(change_rkey:integer);
var i,k:  integer;
    employeeid_str: string;
    yearmonth_str: string;
    accountid_str: string;
    nowyearmonth_str : string;
    fixedmoney_str: string;
    F3name_str: string;
    array_F: array of string;
    array_N: array of string;
 begin
  //showmessage('做薪资变动，做薪资调整');
  SetLength(array_F,0);
  SetLength(array_N,0);
  dm.tmp.SQL.Clear;
  dm.tmp.SQL.Text :='  select top 1 itemname,fixedmoney from dbo.DesignSalaryItem  where datafield='
  +quotedstr('F3') ;
  dm.tmp.Open;
  fixedmoney_str := dm.tmp.FieldByName('fixedmoney').asString;
  F3name_str:= dm.tmp.FieldByName('itemname').asString;
  dm.tmp.Close;

  dm.tmp.SQL.Clear;
  dm.tmp.SQL.Text := 'select employeeid,active,alterdate,'+
    ' orginal_accountid,new_accountid, '+
    ' substring(convert(nvarchar(20),dateadd(month,-1,alterdate),120),1,7) as lastmonth,'+
    ' substring(convert(nvarchar(20),alterdate,120),1,7) as nowmonth '+
    ' from employee_alteration where rkey='+inttostr(change_rkey);
  dm.tmp.Open;
  employeeid_str := dm.tmp.FieldByName('employeeid').asString;
  yearmonth_str := dm.tmp.FieldByName('lastmonth').asString;
  accountid_str := dm.tmp.FieldByName('new_accountid').asString;
  nowyearmonth_str  := dm.tmp.FieldByName('nowmonth').asString;
    if accountid_str ='' then Exit;
  dm.qryTemp.Sql.Text := 'select itemname,datafield '+
    ' from dbo.DesignSalaryItem '+
    ' where datasourcetype=2 ' +
    ' and accountid='+accountid_str+
    ' order by  itemindex ';
  dm.qryTemp.Open;
   k:= dm.qrytemp.recordcount;
   i:=0;
   SetLength(array_F,k);
   SetLength(array_n,k);
      while  not dm.qryTemp.Eof do
      begin
        array_F[i] :=  dm.qryTemp.FieldByName('datafield').asString;
        array_N[i] :=  dm.qryTemp.FieldByName('itemname').asString;
        i := i+1;
        dm.qryTemp.Next;
      end;
  dm.tmp1.sql.clear;
  dm.tmp1.SQL.Text :=
      ' update employee_alteration '+
      ' set orginal_accountid=NULL,'+
      ' new_accountid=NULL'+
      ' from employee_alteration where rkey='+inttostr(change_rkey);
 if messagedlg('是否需要添加帐套变动记录', mtconfirmation, [mbyes,mbno],0) = mryes then
   begin
    if ( dm.tmp.FieldByName('active').asString = '1')
    then
      begin
        if (dm.tmp.FieldByName('orginal_accountid').AsString <> dm.tmp.FieldByName('new_accountid').AsString)
         then
           begin
             dm.tmp1.sql.clear;
             dm.tmp1.SQL.Text :=
              ' insert into employee_alteration  '+
              ' (employeeid,alterdate,orginal_accountid,new_accountid,active,oper_person) '+
              ' select employeeid,substring(convert(nvarchar(20),alterdate,120)'+
              ' ,1,7)+'+#39+'-01'+#39+ ',orginal_accountid,new_accountid,active,'+dm.data05_rkey+
              ' from  employee_alteration where rkey ='+inttostr(change_rkey)+
              ' update employee_alteration '+
              ' set orginal_accountid=NULL,'+
              ' new_accountid=NULL'+
              ' from employee_alteration where rkey='+inttostr(change_rkey);
           end;
      end;
   end;
  dm.tmp1.ExecSql;
  //showmessage('复工变动中的帐套变动记录已处理');

 if messagedlg('是否需要将底薪清零？#13(误离职的复职可以选否)', mtconfirmation, [mbyes,mbno],0) = mryes
   then
   begin
    //showmessage('你选择了是');
     for i:=0 to k-1 do
     begin
       dm.tmp2.sql.clear;
             dm.tmp2.SQL.Text := 
          'if  ( (select '+array_F[i]+' from employeebasicsalary where employeeid='+employeeid_str+')>0) '+
          ' BEGIN '+
          ' insert into basicsalary_Alteration '+
          ' (employeeid,accountid,itemname,datafield,originaldata,newdata,effect_date,'+
          ' effect_flag,operator,operate_date,remark)'+
          ' select '+employeeid_str+','+accountid_str+','+#39+array_N[i]+#39+','+#39+array_F[i]+#39+','+
           array_F[i]+',0,'+#39+yearmonth_str+'-01'+#39+','+
          ' 1,'+dm.data05_rkey+',getdate(),'+#39+'复工，前一个离职月份数额调0'+#39+
          ' from employeebasicsalary '+
          ' where employeeid='+ employeeid_str+
          ' update employeebasicsalary  '+
          ' set '+array_F[i]+'=0 from employeebasicsalary where employeeid='+ employeeid_str+
          ' end  ';
       dm.tmp2.ExecSql;
     end;
       dm.tmp2.SQL.Clear;
       dm.tmp2.SQL.Text :=
           ' insert into basicsalary_Alteration '+
          ' (employeeid,accountid,itemname,datafield,originaldata,newdata,effect_date,'+
          ' effect_flag,operator,operate_date,remark)'+
          ' select '+employeeid_str+','+accountid_str+','+#39+F3name_str+#39+','+#39+'F3'+#39+','+
          ' 0,'+fixedmoney_str+','+#39+nowyearmonth_str+'-01'+#39+','+
          ' 1,'+dm.data05_rkey+',getdate(),'+#39+'复工月份,'+F3name_str+'数额更新'+#39+
          ' from employeebasicsalary '+
          ' where employeeid='+ employeeid_str+
          ' update employeebasicsalary  '+
          ' set '+'F3'+'='+fixedmoney_str+
          ' from employeebasicsalary where employeeid='+ employeeid_str;
        dm.tmp2.ExecSQL;
       dm.tmp.Close;
   end;//是否需要将底薪清0  

 end;



procedure Tfrm_main.N10Click(Sender: TObject);
begin
  ///使该条记录生效，并更新数据库
  if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
    begin
      messagedlg('对不起!您没有该程序的可写权限', mtinformation, [mbok], 0);
      abort;
    end; 
    with dm.qry_alt do
      begin

            //Locate('rkey',DM.qry_info_bd.fieldbyname('rkey').AsInteger, []); //在alt中定位
            if  not DM.qry_info_bd.fieldByName('New_departmentid').isnull then
              begin
                with DM.qryTemp do
                  begin
                   txt1.Caption :='检查部门人数是否满员，如果是，则不能做变动';
                   Application.ProcessMessages;
                    Close;
                    SQL.Clear;
                    SQL.Text := 'select * from datadepartment where rkey ='+ IntToStr(DM.qry_info_bd.FieldValues['New_departmentid']);
                    Open;
                    if FieldByName('departmentcount').asInteger >= Round (FieldByName('departmentration').AsInteger * (1 + FieldByName('max_overproof_percent').AsInteger/100)) then
                      begin
                        showmessage('该部门定额人数已满，不能调动到此部门，请查证！');
                        txt1.Caption :='';
                        Application.ProcessMessages;
                        Exit;
                      end;
                  end;
              end;
            txt1.Caption :='';
            Application.ProcessMessages;
            if messagedlg('生效后，不可还原，你确定要生效该记录吗？'
                + #13 + '1：更新该员工的异动信息到人事信息中'
                + #13 + '2：重新统计所有部门人数', mtconfirmation, [mbyes,mbno],1) = mrno then Exit;


            try
              dm.ADOConnection1.BeginTrans;
              txt1.Caption :='更新人事信息';
              Application.ProcessMessages;
                DM.qryUpdateBD.Close;
                DM.qryUpdateBD.SQL.Clear;
                DM.qryUpdateBD.SQL.Text := Format('update employeemsg set '
                  + 'employeecode=isnull(new_employeecode,a.employeecode), '
                  + 'departmentid=isnull(new_departmentid,a.departmentid), '
                  + 'position=isnull(new_position,a.position), '
                  + 'wagetype=isnull(new_accountid,a.wagetype), '
                  + 'employ_type=isnull(new_employ_type,a.employ_type), '
                  + 'politics_face=isnull(new_politics_face,a.politics_face), '
                  + 'education=isnull(new_education,a.education), '
                  + 'marriage=isnull(new_marriage,a.marriage), '
                  + 'outdutytime=NULL,'
                  + 'classgroupid=NULL,'
                  + 'ondutytime= ' + QuotedStr(DateToStr(DM.qry_info_bd.fieldValues['alterdate'])) + ','
                  //+ 'orginal_ondutytime = a.ondutytime, '
                  + '[rank]=isnull(new_rank,a.[rank]), '
                  + 'status = 1 '
                  + 'from employeemsg a '
                  + 'join employee_alteration b on a.rkey=b.employeeid '
                  + ' where a.rkey = ''%s'' '
                  + ' and b.rkey=''%s'' '
                  + ' and active=0 ', [DM.qry_info_bd.FieldValues['employeeid'],DM.qry_info_bd.FieldValues['rkey']]);
                DM.qryUpdateBD.ExecSQL;
            txt1.Caption :='复工生效后更新部门人数';
            Application.ProcessMessages;
                DM.det_updata.execsql;//复工生效更新部门人数
                dm.ADOTMP.Close;
                dm.ADOTMP.sql.clear;
                dm.ADOTMP.sql.text := ' select * from  employee_contract where employeeid='
                  + DM.qry_info_bd.fieldByName('employeeid').asstring;
                dm.ADOTMP.open;
            txt1.Caption :='整理合同数据';
            Application.ProcessMessages;
                if dm.adotmp.IsEmpty then
                  begin
                    //showmessage('加合同');
            txt1.Caption :='添加合同数据';
            Application.ProcessMessages;
                    dm.qrytemp.Close;
                    dm.qrytemp.SQL.Clear;
                    dm.qrytemp.SQL.Text := ' insert into dbo.employee_contract '+
                      ' (code,employeeid,startdate,probationdate,enddate,type,inputdate,'+
                      ' opration_person,status,remark) select ' +
                      QuotedStr(DM.qry_info_bd.fieldByName('new_employeecode').asstring)+','+
                      DM.qry_info_bd.fieldByName('employeeid').asstring+','+
                      quotedstr(DateToStr(DM.qry_info_bd.fieldValues['alterdate']))+','+
                      'dateadd(day,-1,dateadd(month,3,'+quotedstr(DateToStr(DM.qry_info_bd.fieldValues['alterdate']))+')), '+
                      'dateadd(day,-1,dateadd(year,3,'+quotedstr(DateToStr(DM.qry_info_bd.fieldValues['alterdate']))+')), '+
                      DM.qry_info_bd.fieldByName('new_employ_type').asstring+','+
                      quotedstr(DateToStr(DM.qry_info_bd.fieldValues['alterdate']))+','+
                      DM.data05_rkey+','+'1,'+ quotedstr('复工');
                      dm.qrytemp.execsql;
                  end;

                if  not dm.adotmp.IsEmpty then
                  begin
                    with DM.qryTemp do
                      begin
                        //更新合同为有效
            txt1.Caption :='修改合同数据';
            Application.ProcessMessages;
                        Close;
                        SQL.Clear;
                        SQL.Text := 'update employee_contract '+
                          '  set status=1 , startdate = '+quotedstr(DateToStr(DM.qry_info_bd.fieldValues['alterdate']))+','+
                          '  probationdate='+ 'dateadd(day,-1,dateadd(month,3,'+quotedstr(DateToStr(DM.qry_info_bd.fieldValues['alterdate']))+')) '+','+
                          '  enddate='+ 'dateadd(day,-1,dateadd(year,3,'+quotedstr(DateToStr(DM.qry_info_bd.fieldValues['alterdate']))+')) '+','+
                          '  remark=remark+'+ #39+'    复工  '+#39+
                          '  from employee_contract where  rkey in '+
                          ' ( select max(rkey) from employee_contract  where  status=2 and employeeid='+ DM.qry_info_bd.fieldByName('employeeid').asstring+')';
                        ExecSQL;
                        Close;
                        SQL.Clear;
                      end;
                  end;
                dm.ADOTMP.close;
                //如果是不小心做错了离职，回复以前的工号的时候不调整薪资
            txt1.Caption :='整理薪资数据';
            Application.ProcessMessages;
                if (DM.qry_info_bd.fieldbyname('orginal_employeecode').asstring <> DM.qry_info_bd.fieldbyname('new_employeecode').asstring )
                 then comeback(DM.qry_info_bd.fieldbyname('rkey').AsInteger);
                Parameters[0].Value := DM.qry_info_bd.fieldbyname('rkey').AsInteger;
                Open;
                Edit;
                FieldByName('active').AsInteger:=1;
                fieldbyname('oper_person').asinteger:=strtoint(dm.data05_rkey);
                fieldbyname('oper_date').asdatetime := now;
                Post;
                UpdateBatch;
                close;
                DM.ADOConnection1.CommitTrans;
                ShowMessage('该记录生效成功！');
                bitbtn2.click;
            except
            dm.ADOConnection1.RollbackTrans;
            // on e:except do
            ShowMessage('遇到错误,撤销数据操作');
            
        end;
    end;
    txt1.Caption :='';
end ;
 

procedure Tfrm_main.dtp1Change(Sender: TObject);
begin
bitbtn2.Click; 
end;

procedure Tfrm_main.dtp2Change(Sender: TObject);
begin
bitbtn2.Click; 
end;

procedure Tfrm_main.dtp3Change(Sender: TObject);
begin
bitbtn2.Click; 
end;

procedure Tfrm_main.dtp4Change(Sender: TObject);
begin
bitbtn2.Click; 
end;

procedure Tfrm_main.dtp5Change(Sender: TObject);
begin
bitbtn2.Click; 
end;

procedure Tfrm_main.dtp6Change(Sender: TObject);
begin
bitbtn2.Click; 
end;

procedure Tfrm_main.BitBtn6Click(Sender: TObject);
begin

 if (strtoint(vprev) = 1) or (strtoint(vprev) = 3) then
  begin
    messagedlg('对不起!您没有该程序的可写权限', mtinformation, [mbok], 0);
    abort;
  end;
         
  try
    frm_infosend := Tfrm_infosend.Create(nil);
    frm_infosend.ShowModal;
    
  finally
    frm_infosend.Free;
    end;


end;

end.
