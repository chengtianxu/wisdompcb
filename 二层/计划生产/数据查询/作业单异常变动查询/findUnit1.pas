unit findUnit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGridEh, DB, ADODB;

type
  TfindForm1 = class(TForm)
    Temp_DBGridEh1: TDBGridEh;
    Panel1: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    Panel2: TPanel;
    Button1: TButton;
    Button2: TButton;
    DataSource1: TDataSource;
    ADOStoredProc1: TADOStoredProc;
    procedure Temp_DBGridEh1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    vColumn1: TColumnEh;
    procedure DrawDBGridEHColorCol(DBGridEHName: TDBGridEH; Rect: TRect; DataCol: Integer;
                                   Column: TColumnEh; State: TGridDrawState);

    procedure TitleBtnSort1(Sender: TObject; ACol: Integer;
                             Column: TColumnEh;value:TADODataSet);  overload;

    procedure TitleBtnSort1(Sender: TObject; ACol: Integer;
                             Column: TColumnEh;value:TADOTable);  overload;

    procedure TitleBtnSort1(Sender: TObject; ACol: Integer;
                             Column: TColumnEh;value:TADOStoredProc);  overload;

    procedure TitleBtnSort1(Sender: TObject; ACol: Integer;
                             Column: TColumnEh;value:TADOQuery);  overload;


    procedure EditDataChange(Sender: TObject;value:TADODataSet;vFieldName:string); overload;
    procedure EditDataChange(Sender: TObject;value:TADOTable;vFieldName:string); overload;
    procedure EditDataChange(Sender: TObject;value:TADOStoredProc;vFieldName:string); overload;
    procedure EditDataChange(Sender: TObject;value:TADOQuery;vFieldName:string); overload;


  end;

var
  findForm1: TfindForm1;

implementation

{$R *.dfm}

procedure TfindForm1.Temp_DBGridEh1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
  try
    if not (gdFixed in State) then
    begin
     if Temp_DBGridEh1.DataSource.DataSet.Active then //只有在打开的时候才画
        DrawDBGridEHColorCol((Sender as TDBGRidEH),Rect,DataCol,Column,State);
    end;
  except
    on e :exception do
    begin
     showmessage(e.Message);
    end;
  end;
end;

procedure TfindForm1.DrawDBGridEHColorCol(DBGridEHName: TDBGridEH;
  Rect: TRect; DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
begin
 try
   if  DBGridEHName.DataSource.DataSet.RecNo  mod 2=0 then
     begin
          DBGridEHName.Canvas.Brush.Color:=RGB(244,241,255);
          DBGridEHName.Canvas.FillRect(rect);
          //DBGridEHName.Canvas.font.color:=clblack; //不要此句，不然的话将不会显示不同的字体的颜色值
     end
     else
     begin
          DBGridEHName.Canvas.Brush.Color:=clwhite;
          DBGridEHName.Canvas.FillRect(rect);
          //DBGridEHName.Canvas.font.color:=clblack;
     end;
    if ((State = [gdSelected]) or (State=[gdSelected,gdFocused])) then
     begin
          DBGridEHName.Canvas.Brush.Color:=RGB(0,224,224);
          DBGridEHName.Canvas.FillRect(rect);
          //DBGridEHName.Canvas.font.color:=clblack;
     end;
     DBGridEHName.DefaultDrawColumnCell(rect,datacol,column,state);
 except
    on e :exception do
    begin
     showmessage(e.Message);
    end;
  end;

end;

procedure TfindForm1.TitleBtnSort1(Sender: TObject; ACol: Integer;
  Column: TColumnEh; value: TADODataSet);
var
  sortstring:string; //排序列
begin
 try
  //先设置这个内容 OptionsEh＝dghAutoSortMarking
  //Column.Title.TitleButton＝true
  //进行排序
  with Column do
  begin
    if Column<> vColumn1  then
    begin
     if vColumn1<>nil then
       vColumn1.Title.color:=clbtnface;
     vColumn1:=Column;
     Column.Title.Color :=clred;
    end;

    if FieldName = '' then
      Exit;
    case Title.SortMarker of
      smNoneEh:
      begin
        Title.SortMarker := smDownEh;
        sortstring := Column.FieldName + ' ASC';
      end;
      smDownEh: sortstring := Column.FieldName + ' ASC';
      smUpEh: sortstring := Column.FieldName + ' DESC';
    end;
    //进行排序
    try
      value.Sort := sortstring //dataset为实际数据集变量名
    except
    end;
  end;
 except
    on e :exception do
    begin
     showmessage(e.Message);
    end;
  end;
end;


procedure TfindForm1.TitleBtnSort1(Sender: TObject; ACol: Integer;
  Column: TColumnEh; value: TADOTable);
var
  sortstring:string; //排序列
begin
 try
  //先设置这个内容 OptionsEh＝dghAutoSortMarking
  //Column.Title.TitleButton＝true
  //进行排序
  with Column do
  begin
    if Column<> vColumn1  then
    begin
     if vColumn1<>nil then
       vColumn1.Title.color:=clbtnface;
     vColumn1:=Column;
     Column.Title.Color :=clred;
    end;

    if FieldName = '' then
      Exit;
    case Title.SortMarker of
      smNoneEh:
      begin
        Title.SortMarker := smDownEh;
        sortstring := Column.FieldName + ' ASC';
      end;
      smDownEh: sortstring := Column.FieldName + ' ASC';
      smUpEh: sortstring := Column.FieldName + ' DESC';
    end;
    //进行排序
    try
      value.Sort := sortstring //dataset为实际数据集变量名
    except
    end;
  end;
 except
    on e :exception do
    begin
     showmessage(e.Message);
    end;
  end;
end;

procedure TfindForm1.TitleBtnSort1(Sender: TObject; ACol: Integer;
  Column: TColumnEh; value: TADOQuery);
var
  sortstring:string; //排序列
begin
 try
  //先设置这个内容 OptionsEh＝dghAutoSortMarking
  //Column.Title.TitleButton＝true
  //进行排序
  with Column do
  begin
    if Column<> vColumn1  then
    begin
     if vColumn1<>nil then
       vColumn1.Title.color:=clbtnface;
     vColumn1:=Column;
     Column.Title.Color :=clred;
    end;

    if FieldName = '' then
      Exit;
    case Title.SortMarker of
      smNoneEh:
      begin
        Title.SortMarker := smDownEh;
        sortstring := Column.FieldName + ' ASC';
      end;
      smDownEh: sortstring := Column.FieldName + ' ASC';
      smUpEh: sortstring := Column.FieldName + ' DESC';
    end;
    //进行排序
    try
      value.Sort := sortstring //dataset为实际数据集变量名
    except
    end;
  end;
 except
    on e :exception do
    begin
     showmessage(e.Message);
    end;
  end;
end;

procedure TfindForm1.TitleBtnSort1(Sender: TObject; ACol: Integer;
  Column: TColumnEh; value: TADOStoredProc);
var
  sortstring:string; //排序列
begin
 try
  //先设置这个内容 OptionsEh＝dghAutoSortMarking
  //Column.Title.TitleButton＝true
  //进行排序
  with Column do
  begin
    if Column<> vColumn1  then
    begin
     if vColumn1<>nil then
       vColumn1.Title.color:=clbtnface;
     vColumn1:=Column;
     Column.Title.Color :=clred;
    end;

    if FieldName = '' then
      Exit;
    case Title.SortMarker of
      smNoneEh:
      begin
        Title.SortMarker := smDownEh;
        sortstring := Column.FieldName + ' ASC';
      end;
      smDownEh: sortstring := Column.FieldName + ' ASC';
      smUpEh: sortstring := Column.FieldName + ' DESC';
    end;
    //进行排序
    try
      value.Sort := sortstring //dataset为实际数据集变量名
    except
    end;
  end;
 except
    on e :exception do
    begin
     showmessage(e.Message);
    end;
  end;
end;

procedure TfindForm1.Button2Click(Sender: TObject);
begin
  modalresult:=mrCancel	;
end;

procedure TfindForm1.Button1Click(Sender: TObject);
begin
  modalresult:=mrok;
end;

procedure TfindForm1.EditDataChange(Sender: TObject; value: TADOTable;vFieldName:string);
begin
  value.Filter:='';
  if trim(tedit(sender as tedit).Text)<>'' then
  begin
    if vColumn1=nil then //exit;
      value.Filter :=vFieldName+ ' like '''+trim(tedit(sender as tedit).Text)+'%'''
    else
      value.Filter :=vColumn1.FieldName+ ' like '''+trim(tedit(sender as tedit).Text)+'%''';
  end
  else
   value.Filter:='';
end;

procedure TfindForm1.EditDataChange(Sender: TObject; value: TADODataSet;vFieldName:string);
begin
  value.Filter:='';
  if trim(tedit(sender as tedit).Text)<>'' then
  begin
    if vColumn1=nil then //exit;
      value.Filter :=vFieldName+ ' like '''+trim(tedit(sender as tedit).Text)+'%'''
    else                
      value.Filter :=vColumn1.FieldName+ ' like '''+trim(tedit(sender as tedit).Text)+'%''';
  end
  else
   value.Filter:='';
end;

procedure TfindForm1.EditDataChange(Sender: TObject; value: TADOQuery;vFieldName:string);
begin
  value.Filter:='';
  if trim(tedit(sender as tedit).Text)<>'' then
  begin
    if vColumn1=nil then //exit;
      value.Filter :=vFieldName+ ' like '''+trim(tedit(sender as tedit).Text)+'%'''
    else                 
      value.Filter :=vColumn1.FieldName+ ' like '''+trim(tedit(sender as tedit).Text)+'%''';
  end
  else
   value.Filter:='';
end;

procedure TfindForm1.EditDataChange(Sender: TObject;
  value: TADOStoredProc;vFieldName:string);
begin
  
  value.Filter:='';
  if trim(tedit(sender as tedit).Text)<>'' then
  begin
    if vColumn1=nil then //exit;
      value.Filter :=vFieldName+ ' like '''+trim(tedit(sender as tedit).Text)+'%'''
    else                 
      value.Filter :=vColumn1.FieldName+ ' like '''+trim(tedit(sender as tedit).Text)+'%''';

  end
  else
   value.Filter:='';
end;

procedure TfindForm1.FormCreate(Sender: TObject);
begin
  self.BorderIcons := self.BorderIcons - [biMinimize] - [biMaximize];
  self.BorderStyle  := bsSingle;
  self.Position := poScreenCenter;
end;

end.
