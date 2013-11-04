--��±���

--MisDescBegin
x226001_g_ScriptId = 226001
x226001_g_MissionIdPre =337
x226001_g_MissionId = 338
x226001_g_MissionKind = 23
x226001_g_MissionLevel = 115
x226001_g_ScriptIdNext = {ScriptId = 226002 ,LV = 1 }
x226001_g_Name	="�����" 
x226001_g_DemandItem ={}
x226001_g_DemandKill ={{id=477,num=20}}

x226001_g_MissionName="��±���"
x226001_g_MissionInfo="    ���ڵ��˵Ĳ����Ѿ�������ǣ��ס������Ҳ�ܲ����ˡ�������ս��������ŷ����Щ����ʿһ��������������ǿ�ĵ��ˣ���������������С�ĵ��ˣ���ɵ��˾�������ˣ��ٽ���׷����\n \n    ����˵���˲���������һȺ�Ӹ�±����Ŀ󹤣����Ǹ�������սʿ��������ʱ��ļ���ģ������ȴ��������ְɡ�"  --��������
x226001_g_MissionTarget="    #G�����#W��������20��#R��±���#W��"		                                                                                               
x226001_g_MissionComplete="    ���ǹ�Ȼһ����������һ���Ե�����������ʿ����������Ӱ�죬����Ҫץס��λ��ᡣ"					--�������npc˵���Ļ�
x226001_g_ContinueInfo="    һȺ���������Ŀ󹤶��ѣ����ͷ������ǿ�ʯ���ľ�û�����⡣"
--������
x226001_g_MoneyBonus = 500

--�̶���Ʒ���������8��
x226001_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x226001_g_RadioItemBonus={}

--MisDescEnd
x226001_g_ExpBonus = 4000
--**********************************

--������ں���

--**********************************

function x226001_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x226001_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x226001_g_MissionId) > 0 then
	misIndex = GetMissionIndexByID(sceneId,selfId,x226001_g_MissionId)
		if x226001_CheckSubmit(sceneId, selfId, targetId) <= 0 then
                        BeginEvent(sceneId)
			AddText(sceneId,"#Y"..x226001_g_MissionName)
			AddText(sceneId,x226001_g_ContinueInfo)
		        AddText(sceneId,"#Y����Ŀ��#W") 
			AddText(sceneId,x226001_g_MissionTarget) 
			AddText(sceneId,format("\n    ɱ����±���   %d/%d", GetMissionParam(sceneId,selfId,misIndex,0),x226001_g_DemandKill[1].num ))
			EndEvent()
			DispatchEventList(sceneId, selfId, targetId)
		end

		     
                if x226001_CheckSubmit(sceneId, selfId, targetId) > 0 then
                     BeginEvent(sceneId)
                     AddText(sceneId,"#Y"..x226001_g_MissionName)
		     AddText(sceneId,x226001_g_MissionComplete)
		     AddMoneyBonus(sceneId, x226001_g_MoneyBonus)
		     EndEvent()
                     DispatchMissionContinueInfo(sceneId, selfId, targetId, x226001_g_ScriptId, x226001_g_MissionId)
                end

        elseif x226001_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x226001_g_MissionName)
                AddText(sceneId,x226001_g_MissionInfo) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x226001_g_MissionTarget) 
		AddMoneyBonus(sceneId, x226001_g_MoneyBonus)
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x226001_g_ScriptId, x226001_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x226001_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x226001_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x226001_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x226001_g_ScriptId, x226001_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x226001_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x226001_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x226001_CheckPushList(sceneId, selfId, targetId)
	if (sceneId==22) then
		if IsMissionHaveDone(sceneId, selfId, x226001_g_MissionIdPre) > 0 then
        	    	return 1
        end
  end
        return 0
	
end

--**********************************

--����

--**********************************

function x226001_OnAccept(sceneId, selfId)

	        BeginEvent(sceneId)
		AddMission( sceneId, selfId, x226001_g_MissionId, x226001_g_ScriptId, 1, 0, 0)
		AddText(sceneId,"��������"..x226001_g_MissionName) 
		EndEvent()
		DispatchMissionTips(sceneId, selfId)
		                                               
	     
end



--**********************************

--����

--**********************************

function x226001_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x226001_g_MissionId)
	for i, item in x226001_g_DemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
	end

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x226001_CheckSubmit( sceneId, selfId, targetId)
	misIndex = GetMissionIndexByID(sceneId,selfId,x226001_g_MissionId)
	if GetMissionParam(sceneId,selfId,misIndex,0) == x226001_g_DemandKill[1].num then
	        return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x226001_OnSubmit(sceneId, selfId, targetId, selectRadioId)
	if DelMission(sceneId, selfId, x226001_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x226001_g_MissionId)
		AddExp(sceneId, selfId, x226001_g_ExpBonus)
		AddMoney(sceneId, selfId, x226001_g_MoneyBonus)
		CallScriptFunction( x226001_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
	end
	

	
end



--**********************************

--ɱ����������

--**********************************

function x226001_OnKillObject(sceneId, selfId, objdataId)
	 if IsHaveMission(sceneId, selfId, x226001_g_MissionId) > 0 then 
	 misIndex = GetMissionIndexByID(sceneId,selfId,x226001_g_MissionId)  
	 num = GetMissionParam(sceneId,selfId,misIndex,0) 
	 	 if objdataId == x226001_g_DemandKill[1].id then 
       		    if num < x226001_g_DemandKill[1].num then
       		    	 SetMissionByIndex(sceneId,selfId,misIndex,0,num+1)
       		         BeginEvent(sceneId)
			 AddText(sceneId,format("ɱ����±���   %d/%d", GetMissionParam(sceneId,selfId,misIndex,0),x226001_g_DemandKill[1].num )) 
			 EndEvent()
			 DispatchMissionTips(sceneId, selfId)
		    end
       		 end
       		 
      end  

end



--**********************************

--���������¼�

--**********************************

function x226001_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x226001_OnItemChanged(sceneId, selfId, itemdataId)

end

