--��ʿ�ļ�֤

--MisDescBegin
x205002_g_ScriptId = 205002
--x205002_g_MissionIdPre =41
x205002_g_MissionId = 42
x205002_g_MissionKind = 11
x205002_g_MissionLevel = 55
--x205002_g_ScriptIdNext = {ScriptId = 205003 ,LV = 1 }
x205002_g_Name	="�ٲ�̨" 
x205002_g_DemandItem ={}
x205002_g_DemandKill ={{id=302,num=30}}

x205002_g_MissionName="��ʿ�ļ�֤"
x205002_g_MissionInfo="    <�ٲ�̨�ڽ����������ߣ�����������������ֹ������Ǹ���˵����>\n \n    �����������ɹ��̶ӣ��Ƿ�ɼ�˼����ּ�⣬��������ģ��ͨ�̣�����һ��������������������顣�������Ĳ�ԭ��������Ұ��������û�е���Ʒ���������Ǹ��㣬�ֲ�ϡȱ�����ǣ�����ȴ�������Ǳ�������ٵ�ʱ���ɴ�����ŵ�Χס���ǡ����������Ѿ���������ʮ���ˣ�����Ϊ�̶ӵĻ��������죬����Ӧ�ø����ǳ�ͻ�����ǣ���Ϊ�������ū�ͣ��ɼ�˼�����������ǲ�����ô��������ô�۸���\n \n"  --��������
x205002_g_MissionInfo2="    ,������ȥ��ѵ���ǰѣ�124��114��������Щ������ģʿ����ɱ�ˣ������ǳ������ǵ��ֶΡ�"
x205002_g_MissionTarget="    #G�ٲ�̨#W����ɱ��30��#R������ģʿ��#W�������ǳ������ǳ�������ʿ��������"		                                                                                               
x205002_g_MissionComplete="    ������������Ƶ��˺�����ʱ����Ƥ����˺��������������ɳĮ�����������ü����ҿ��ü�����Ϊ��Ѫ���ٻ���������������ˡ�"					--�������npc˵���Ļ�
x205002_g_ContinueInfo="    ���ǲ������£�������������������ʿ�������������£�ȥ�ɣ�����Щ�˳������ǵ�����"
--������
x205002_g_MoneyBonus = 10000
--�̶���Ʒ���������8��
x205002_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x205002_g_RadioItemBonus={}

--MisDescEnd
x205002_g_ExpBonus = 1000
--**********************************

--������ں���

--**********************************

function x205002_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x205002_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x205002_g_MissionId) > 0 then
	misIndex = GetMissionIndexByID(sceneId,selfId,x205002_g_MissionId)
		if x205002_CheckSubmit(sceneId, selfId, targetId) <= 0 then
                        BeginEvent(sceneId)
			AddText(sceneId,"#Y"..x205002_g_MissionName)
			AddText(sceneId,x205002_g_ContinueInfo)
		        AddText(sceneId,"#Y����Ŀ��#W") 
			AddText(sceneId,x205002_g_MissionTarget) 
			AddText(sceneId,format("\n    ɱ��������ģʿ��   %d/%d", GetMissionParam(sceneId,selfId,misIndex,0),x205002_g_DemandKill[1].num ))
			EndEvent()
			DispatchEventList(sceneId, selfId, targetId)
		end

		     
                if x205002_CheckSubmit(sceneId, selfId, targetId) > 0 then
                     BeginEvent(sceneId)
                     AddText(sceneId,"#Y"..x205002_g_MissionName)
		     AddText(sceneId,x205002_g_MissionComplete)
		     AddMoneyBonus(sceneId, x205002_g_MoneyBonus)
		     EndEvent()
                     DispatchMissionContinueInfo(sceneId, selfId, targetId, x205002_g_ScriptId, x205002_g_MissionId)
                end

        elseif x205002_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x205002_g_MissionName)
                AddText(sceneId,x205002_g_MissionInfo..GetName(sceneId, selfId)..x205002_g_MissionInfo2) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x205002_g_MissionTarget) 
		AddMoneyBonus(sceneId, x205002_g_MoneyBonus)	
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x205002_g_ScriptId, x205002_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x205002_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x205002_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x205002_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x205002_g_ScriptId, x205002_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x205002_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x205002_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x205002_CheckPushList(sceneId, selfId, targetId)
	if (sceneId==5) then
        	    	return 1
        end
        return 0
	
end

--**********************************

--����

--**********************************

function x205002_OnAccept(sceneId, selfId)

	        BeginEvent(sceneId)
		AddMission( sceneId, selfId, x205002_g_MissionId, x205002_g_ScriptId, 1, 0, 0)
		AddText(sceneId,"��������"..x205002_g_MissionName) 
		EndEvent()
		DispatchMissionTips(sceneId, selfId)
		                                               
	     
end



--**********************************

--����

--**********************************

function x205002_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x205002_g_MissionId)
	for i, item in x205002_g_DemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
	end

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x205002_CheckSubmit( sceneId, selfId, targetId)
	misIndex = GetMissionIndexByID(sceneId,selfId,x205002_g_MissionId)
	if GetMissionParam(sceneId,selfId,misIndex,0) == x205002_g_DemandKill[1].num then
	        return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x205002_OnSubmit(sceneId, selfId, targetId, selectRadioId)

	if DelMission(sceneId, selfId, x205002_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x205002_g_MissionId)
		AddExp(sceneId, selfId, x205002_g_ExpBonus)
		AddMoney(sceneId, selfId, x205002_g_MoneyBonus)
		for i, item in x205002_g_RadioItemBonus do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end

		for i, item in x205002_g_DemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
		end
		--CallScriptFunction( x205002_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
	end
	

	
end



--**********************************

--ɱ����������

--**********************************

function x205002_OnKillObject(sceneId, selfId, objdataId)
	 if IsHaveMission(sceneId, selfId, x205002_g_MissionId) >= 0 then 
	 misIndex = GetMissionIndexByID(sceneId,selfId,x205002_g_MissionId)  
	 num = GetMissionParam(sceneId,selfId,misIndex,0) 
	 	 if objdataId == x205002_g_DemandKill[1].id then 
       		    if num < x205002_g_DemandKill[1].num then
       		    	 SetMissionByIndex(sceneId,selfId,misIndex,0,num+1)
       		         BeginEvent(sceneId)
			 AddText(sceneId,format("ɱ��������ģʿ��   %d/%d", GetMissionParam(sceneId,selfId,misIndex,0),x205002_g_DemandKill[1].num )) 
			 EndEvent()
			 DispatchMissionTips(sceneId, selfId)
		    end
       		 end
       		 
      end  

end



--**********************************

--���������¼�

--**********************************

function x205002_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x205002_OnItemChanged(sceneId, selfId, itemdataId)

end

